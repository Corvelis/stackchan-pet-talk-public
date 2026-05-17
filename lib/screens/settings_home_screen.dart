import 'package:flutter/material.dart';

import '../localization/app_localizations.dart';
import '../theme/app_theme.dart';
import '../widgets/app_scaffold.dart';
import '../widgets/settings_list_tile.dart';
import 'character_settings_screen.dart';

class SettingsHomeScreen extends StatelessWidget {
  const SettingsHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final strings = context.strings;
    return AppScaffold(
      title: strings.settingsTitle,
      child: ListView(
        padding: const EdgeInsets.fromLTRB(18, 8, 18, 28),
        children: [
          Text(
            strings.settingsHeading,
            style: Theme.of(context).textTheme.headlineSmall,
          ),
          const SizedBox(height: 8),
          Text(
            strings.settingsDescription,
            style: Theme.of(
              context,
            ).textTheme.bodyMedium?.copyWith(color: AppColors.subtext),
          ),
          const SizedBox(height: 18),
          DecoratedBox(
            decoration: BoxDecoration(
              color: AppColors.surface,
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: AppColors.border),
            ),
            child: Column(
              children: [
                SettingsListTile(
                  icon: Icons.settings_input_antenna_rounded,
                  title: strings.stackchanConnection,
                  subtitle: strings.stackchanConnectionSubtitle,
                ),
                const Divider(height: 1),
                SettingsListTile(
                  icon: Icons.graphic_eq_rounded,
                  title: strings.voice,
                  subtitle: strings.voiceSubtitle,
                ),
                const Divider(height: 1),
                SettingsListTile(
                  icon: Icons.developer_board_rounded,
                  title: strings.aiModel,
                  subtitle: strings.aiModelSubtitle,
                ),
                const Divider(height: 1),
                SettingsListTile(
                  icon: Icons.face_retouching_natural_rounded,
                  title: strings.masterRecognition,
                  subtitle: strings.masterRecognitionSubtitle,
                ),
                const Divider(height: 1),
                SettingsListTile(
                  icon: Icons.favorite_rounded,
                  title: strings.characterSettings,
                  subtitle: strings.characterSettingsSubtitle,
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute<void>(
                        builder: (_) => const CharacterSettingsScreen(),
                      ),
                    );
                  },
                ),
                const Divider(height: 1),
                SettingsListTile(
                  icon: Icons.notifications_active_rounded,
                  title: strings.background,
                  subtitle: strings.backgroundSubtitle,
                ),
                const Divider(height: 1),
                SettingsListTile(
                  icon: Icons.policy_rounded,
                  title: strings.dataLicenses,
                  subtitle: strings.dataLicensesSubtitle,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
