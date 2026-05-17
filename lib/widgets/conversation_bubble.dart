import 'package:flutter/material.dart';

import '../theme/app_theme.dart';

class ConversationBubble extends StatelessWidget {
  const ConversationBubble({
    super.key,
    required this.author,
    required this.message,
    required this.isStackchan,
  });

  final String author;
  final String message;
  final bool isStackchan;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: isStackchan ? Alignment.centerLeft : Alignment.centerRight,
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 560),
        child: Container(
          margin: const EdgeInsets.symmetric(vertical: 5),
          padding: const EdgeInsets.all(14),
          decoration: BoxDecoration(
            color: isStackchan ? AppColors.surface : AppColors.mint,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(
              color: isStackchan ? AppColors.border : AppColors.mint,
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                author,
                style: Theme.of(context).textTheme.labelMedium?.copyWith(
                  color: isStackchan ? AppColors.subtext : Colors.white,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                message,
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: isStackchan ? AppColors.text : Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
