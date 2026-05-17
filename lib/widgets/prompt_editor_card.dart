import 'package:flutter/material.dart';

import '../localization/app_localizations.dart';
import '../theme/app_theme.dart';

class PromptEditorCard extends StatelessWidget {
  const PromptEditorCard({
    super.key,
    required this.title,
    required this.controller,
    this.minLines = 5,
  });

  final String title;
  final TextEditingController controller;
  final int minLines;

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
          Text(title, style: Theme.of(context).textTheme.titleMedium),
          const SizedBox(height: 12),
          TextField(
            controller: controller,
            minLines: minLines,
            maxLines: minLines + 5,
            decoration: InputDecoration(
              alignLabelWithHint: true,
              hintText: strings.promptHint,
            ),
          ),
        ],
      ),
    );
  }
}
