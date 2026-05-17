import 'package:flutter/material.dart';

import '../models/stackchan_models.dart';
import '../theme/app_theme.dart';

class CharacterLevelCard extends StatelessWidget {
  const CharacterLevelCard({super.key, required this.level});

  final AffectionLevel level;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: AppColors.border),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              CircleAvatar(
                radius: 16,
                backgroundColor: AppColors.yellow.withValues(alpha: 0.2),
                child: Text(
                  '${level.level}',
                  style: Theme.of(context).textTheme.labelLarge,
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Text(
                  level.title,
                  style: Theme.of(context).textTheme.titleMedium,
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Text(level.tone, style: Theme.of(context).textTheme.bodyMedium),
          const SizedBox(height: 6),
          Text(
            level.promptHint,
            style: Theme.of(
              context,
            ).textTheme.bodyMedium?.copyWith(color: AppColors.subtext),
          ),
        ],
      ),
    );
  }
}
