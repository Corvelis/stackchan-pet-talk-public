import 'package:flutter/material.dart';

import '../localization/app_localizations.dart';
import '../models/stackchan_models.dart';
import '../theme/app_theme.dart';
import '../widgets/app_scaffold.dart';
import '../widgets/character_level_card.dart';
import '../widgets/prompt_editor_card.dart';

class CharacterSettingsScreen extends StatefulWidget {
  const CharacterSettingsScreen({super.key});

  @override
  State<CharacterSettingsScreen> createState() =>
      _CharacterSettingsScreenState();
}

class _CharacterSettingsScreenState extends State<CharacterSettingsScreen> {
  late final TextEditingController _promptController;
  late final TextEditingController _masterNameController;
  AppLanguage? _seededLanguage;
  bool _edited = false;
  bool _seeding = false;
  int _tabIndex = 0;

  @override
  void initState() {
    super.initState();
    _promptController = TextEditingController()..addListener(_markEdited);
    _masterNameController = TextEditingController()..addListener(_markEdited);
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final language = AppLanguageScope.languageOf(context);
    if (_seededLanguage == language || _edited) {
      return;
    }
    final profile = CharacterProfile.initial(context.strings);
    _seeding = true;
    _promptController.text = profile.basePrompt;
    _masterNameController.text = profile.masterName;
    _seeding = false;
    _seededLanguage = language;
  }

  @override
  void dispose() {
    _promptController.removeListener(_markEdited);
    _masterNameController.removeListener(_markEdited);
    _promptController.dispose();
    _masterNameController.dispose();
    super.dispose();
  }

  void _markEdited() {
    if (_seeding) {
      return;
    }
    _edited = true;
  }

  @override
  Widget build(BuildContext context) {
    final strings = context.strings;
    return AppScaffold(
      title: strings.characterSettings,
      actions: [
        TextButton.icon(
          onPressed: () {
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(SnackBar(content: Text(strings.dummySaved)));
          },
          icon: const Icon(Icons.save_rounded),
          label: Text(strings.save),
        ),
      ],
      child: ListView(
        padding: const EdgeInsets.fromLTRB(18, 8, 18, 28),
        children: [
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: SegmentedButton<int>(
              segments: [
                ButtonSegment(value: 0, label: Text(strings.tabBasic)),
                ButtonSegment(value: 1, label: Text(strings.tabAffection)),
                ButtonSegment(value: 2, label: Text(strings.tabReaction)),
                ButtonSegment(value: 3, label: Text(strings.tabPrompt)),
                ButtonSegment(value: 4, label: Text(strings.tabTest)),
              ],
              selected: {_tabIndex},
              onSelectionChanged: (value) => setState(() {
                _tabIndex = value.first;
              }),
            ),
          ),
          const SizedBox(height: 18),
          _buildTab(context),
        ],
      ),
    );
  }

  Widget _buildTab(BuildContext context) {
    return switch (_tabIndex) {
      0 => _BasicTab(
        masterNameController: _masterNameController,
        promptController: _promptController,
      ),
      1 => _AffectionTab(levels: _profile.affectionLevels),
      2 => _ReactionTab(reactions: _profile.reactions),
      3 => _PromptPreviewTab(
        masterNameController: _masterNameController,
        promptController: _promptController,
      ),
      4 => const _TestTab(),
      _ => const SizedBox.shrink(),
    };
  }

  CharacterProfile get _profile => CharacterProfile.initial(context.strings);
}

class _BasicTab extends StatelessWidget {
  const _BasicTab({
    required this.masterNameController,
    required this.promptController,
  });

  final TextEditingController masterNameController;
  final TextEditingController promptController;

  @override
  Widget build(BuildContext context) {
    final strings = context.strings;
    return Column(
      children: [
        TextField(
          controller: masterNameController,
          decoration: InputDecoration(
            labelText: strings.masterName,
            prefixIcon: const Icon(Icons.badge_rounded),
          ),
        ),
        const SizedBox(height: 14),
        PromptEditorCard(
          title: strings.basePrompt,
          controller: promptController,
        ),
      ],
    );
  }
}

class _AffectionTab extends StatelessWidget {
  const _AffectionTab({required this.levels});

  final List<AffectionLevel> levels;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        for (final level in levels) ...[
          CharacterLevelCard(level: level),
          const SizedBox(height: 10),
        ],
      ],
    );
  }
}

class _ReactionTab extends StatelessWidget {
  const _ReactionTab({required this.reactions});

  final Map<String, String> reactions;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        for (final entry in reactions.entries) ...[
          TextFormField(
            initialValue: entry.value,
            decoration: InputDecoration(
              labelText: entry.key,
              prefixIcon: const Icon(Icons.auto_awesome_rounded),
            ),
          ),
          const SizedBox(height: 12),
        ],
      ],
    );
  }
}

class _PromptPreviewTab extends StatelessWidget {
  const _PromptPreviewTab({
    required this.masterNameController,
    required this.promptController,
  });

  final TextEditingController masterNameController;
  final TextEditingController promptController;

  @override
  Widget build(BuildContext context) {
    final strings = context.strings;
    return AnimatedBuilder(
      animation: Listenable.merge([masterNameController, promptController]),
      builder: (context, _) {
        return Container(
          width: double.infinity,
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: AppColors.surface,
            borderRadius: BorderRadius.circular(14),
            border: Border.all(color: AppColors.border),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                strings.promptPreview,
                style: Theme.of(context).textTheme.titleMedium,
              ),
              const SizedBox(height: 12),
              Text(
                '${promptController.text}\n\n${strings.partner}: ${masterNameController.text}\n${strings.identity}: master / guest / unknown\n${strings.state}: idle / listening / thinking / speaking',
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ],
          ),
        );
      },
    );
  }
}

class _TestTab extends StatelessWidget {
  const _TestTab();

  @override
  Widget build(BuildContext context) {
    final strings = context.strings;
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: AppColors.border),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            strings.testConversation,
            style: Theme.of(context).textTheme.titleMedium,
          ),
          const SizedBox(height: 12),
          TextField(
            minLines: 3,
            maxLines: 6,
            decoration: InputDecoration(hintText: strings.testInput),
          ),
          const SizedBox(height: 12),
          OutlinedButton.icon(
            onPressed: null,
            icon: const Icon(Icons.play_arrow_rounded),
            label: Text(strings.unavailableInM1),
          ),
        ],
      ),
    );
  }
}
