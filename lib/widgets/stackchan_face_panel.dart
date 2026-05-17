import 'package:flutter/material.dart';

import '../localization/app_localizations.dart';
import '../models/stackchan_models.dart';
import '../theme/app_theme.dart';
import 'status_pill.dart';

class StackchanFacePanel extends StatelessWidget {
  const StackchanFacePanel({
    super.key,
    required this.status,
    required this.speaker,
    required this.familiarity,
    required this.affection,
  });

  final StackchanStatus status;
  final SpeakerIdentity speaker;
  final double familiarity;
  final double affection;

  @override
  Widget build(BuildContext context) {
    final strings = context.strings;
    final faceColor = switch (status) {
      StackchanStatus.idle => AppColors.mint,
      StackchanStatus.listening => AppColors.blue,
      StackchanStatus.thinking => AppColors.yellow,
      StackchanStatus.speaking => AppColors.coral,
    };

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: AppColors.border),
      ),
      child: Column(
        children: [
          Row(
            children: [
              StatusPill(
                label: _statusLabel(strings, status),
                color: faceColor,
                icon: _statusIcon(status),
              ),
              const Spacer(),
              StatusPill(
                label: _speakerLabel(strings, speaker),
                color: AppColors.blue,
                icon: Icons.person_search_rounded,
              ),
            ],
          ),
          const SizedBox(height: 22),
          Container(
            width: 156,
            height: 156,
            decoration: BoxDecoration(
              color: faceColor.withValues(alpha: 0.12),
              shape: BoxShape.circle,
              border: Border.all(color: faceColor.withValues(alpha: 0.32)),
            ),
            child: CustomPaint(painter: _StackchanFacePainter(faceColor)),
          ),
          const SizedBox(height: 22),
          _MetricBar(
            label: strings.familiarity,
            value: familiarity,
            color: AppColors.mint,
          ),
          const SizedBox(height: 12),
          _MetricBar(
            label: strings.affection,
            value: affection,
            color: AppColors.coral,
          ),
        ],
      ),
    );
  }

  String _statusLabel(AppStrings strings, StackchanStatus status) {
    return switch (status) {
      StackchanStatus.idle => strings.statusIdle,
      StackchanStatus.listening => strings.statusListening,
      StackchanStatus.thinking => strings.statusThinking,
      StackchanStatus.speaking => strings.statusSpeaking,
    };
  }

  IconData _statusIcon(StackchanStatus status) {
    return switch (status) {
      StackchanStatus.idle => Icons.self_improvement_rounded,
      StackchanStatus.listening => Icons.hearing_rounded,
      StackchanStatus.thinking => Icons.psychology_alt_rounded,
      StackchanStatus.speaking => Icons.record_voice_over_rounded,
    };
  }

  String _speakerLabel(AppStrings strings, SpeakerIdentity speaker) {
    return switch (speaker) {
      SpeakerIdentity.master => strings.speakerMaster,
      SpeakerIdentity.guest => strings.speakerGuest,
      SpeakerIdentity.unknown => strings.speakerUnknown,
    };
  }
}

class _MetricBar extends StatelessWidget {
  const _MetricBar({
    required this.label,
    required this.value,
    required this.color,
  });

  final String label;
  final double value;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: 72,
          child: Text(label, style: Theme.of(context).textTheme.bodyMedium),
        ),
        Expanded(
          child: ClipRRect(
            borderRadius: BorderRadius.circular(999),
            child: LinearProgressIndicator(
              value: value,
              minHeight: 9,
              color: color,
              backgroundColor: AppColors.border,
            ),
          ),
        ),
        const SizedBox(width: 10),
        SizedBox(
          width: 40,
          child: Text(
            '${(value * 100).round()}%',
            textAlign: TextAlign.end,
            style: Theme.of(context).textTheme.labelMedium,
          ),
        ),
      ],
    );
  }
}

class _StackchanFacePainter extends CustomPainter {
  const _StackchanFacePainter(this.color);

  final Color color;

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.stroke
      ..strokeWidth = 6
      ..strokeCap = StrokeCap.round;
    final fill = Paint()
      ..color = AppColors.surface
      ..style = PaintingStyle.fill;

    canvas.drawCircle(size.center(Offset.zero), size.width * 0.34, fill);
    canvas.drawCircle(size.center(Offset.zero), size.width * 0.34, paint);
    canvas.drawLine(
      Offset(size.width * 0.34, size.height * 0.43),
      Offset(size.width * 0.34, size.height * 0.45),
      paint,
    );
    canvas.drawLine(
      Offset(size.width * 0.66, size.height * 0.43),
      Offset(size.width * 0.66, size.height * 0.45),
      paint,
    );
    canvas.drawArc(
      Rect.fromCenter(
        center: Offset(size.width * 0.5, size.height * 0.55),
        width: size.width * 0.28,
        height: size.height * 0.18,
      ),
      0.2,
      2.7,
      false,
      paint,
    );
    canvas.drawLine(
      Offset(size.width * 0.5, size.height * 0.1),
      Offset(size.width * 0.5, size.height * 0.24),
      paint,
    );
  }

  @override
  bool shouldRepaint(covariant _StackchanFacePainter oldDelegate) {
    return color != oldDelegate.color;
  }
}
