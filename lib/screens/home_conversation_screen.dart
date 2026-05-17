import 'package:flutter/material.dart';

import '../localization/app_localizations.dart';
import '../models/stackchan_models.dart';
import '../theme/app_theme.dart';
import '../widgets/app_scaffold.dart';
import '../widgets/conversation_bubble.dart';
import '../widgets/primary_action_bar.dart';
import '../widgets/stackchan_face_panel.dart';
import '../widgets/status_pill.dart';
import 'settings_home_screen.dart';

class HomeConversationScreen extends StatefulWidget {
  const HomeConversationScreen({super.key});

  static const routeName = '/home';

  @override
  State<HomeConversationScreen> createState() => _HomeConversationScreenState();
}

class _HomeConversationScreenState extends State<HomeConversationScreen> {
  final _textController = TextEditingController();
  StackchanStatus _status = StackchanStatus.idle;
  final List<({String author, String message, bool isStackchan})> _messages =
      [];
  AppLanguage? _seededLanguage;
  bool _hasUserMessages = false;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final language = AppLanguageScope.languageOf(context);
    if (_seededLanguage == language || _hasUserMessages) {
      return;
    }
    final strings = context.strings;
    _messages
      ..clear()
      ..add((
        author: 'stackchan-talk',
        message: strings.initialStackchanMessage,
        isStackchan: true,
      ))
      ..add((
        author: strings.speakerMaster,
        message: strings.initialMasterMessage,
        isStackchan: false,
      ));
    _seededLanguage = language;
  }

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }

  void _cycleTalkState() {
    setState(() {
      _status = switch (_status) {
        StackchanStatus.idle => StackchanStatus.listening,
        StackchanStatus.listening => StackchanStatus.thinking,
        StackchanStatus.thinking => StackchanStatus.speaking,
        StackchanStatus.speaking => StackchanStatus.idle,
      };
    });
  }

  void _sendText() {
    final text = _textController.text.trim();
    if (text.isEmpty) {
      return;
    }
    setState(() {
      final strings = context.strings;
      _messages.add((
        author: strings.speakerMaster,
        message: text,
        isStackchan: false,
      ));
      _messages.add((
        author: 'stackchan-talk',
        message: strings.dummyReply,
        isStackchan: true,
      ));
      _textController.clear();
      _status = StackchanStatus.speaking;
      _hasUserMessages = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    final strings = context.strings;
    return AppScaffold(
      title: strings.conversationTitle,
      actions: [
        IconButton(
          tooltip: strings.settingsTooltip,
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute<void>(
                builder: (_) => const SettingsHomeScreen(),
              ),
            );
          },
          icon: const Icon(Icons.tune_rounded),
        ),
      ],
      bottomNavigationBar: PrimaryActionBar(
        controller: _textController,
        onTalk: _cycleTalkState,
        onSend: _sendText,
      ),
      child: ListView(
        padding: const EdgeInsets.fromLTRB(18, 8, 18, 18),
        children: [
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: [
              StatusPill(
                label: strings.dummyConnected,
                color: AppColors.mint,
                icon: Icons.check_circle_rounded,
              ),
              const StatusPill(
                label: '192.168.4.1:8080',
                color: AppColors.blue,
                icon: Icons.memory_rounded,
              ),
            ],
          ),
          const SizedBox(height: 14),
          StackchanFacePanel(
            status: _status,
            speaker: SpeakerIdentity.master,
            familiarity: 0.64,
            affection: 0.58,
          ),
          const SizedBox(height: 18),
          Text(
            strings.conversationHistory,
            style: Theme.of(context).textTheme.titleMedium,
          ),
          const SizedBox(height: 8),
          for (final item in _messages)
            ConversationBubble(
              author: item.author,
              message: item.message,
              isStackchan: item.isStackchan,
            ),
        ],
      ),
    );
  }
}
