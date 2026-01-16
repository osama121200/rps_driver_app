import 'package:flutter/material.dart';
import '../../core/constants/app_colors.dart';

class SlideToConfirm extends StatefulWidget {
  final String label;
  final VoidCallback onConfirmed;
  const SlideToConfirm({super.key, required this.label, required this.onConfirmed});

  @override
  State<SlideToConfirm> createState() => _SlideToConfirmState();
}

class _SlideToConfirmState extends State<SlideToConfirm> {
  double _value = 0;
  bool _confirmed = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onHorizontalDragUpdate: (details) {
        if (_confirmed) return;
        setState(() {
          _value = (_value + details.primaryDelta! / 250).clamp(0.0, 1.0);
        });
      },
      onHorizontalDragEnd: (_) {
        if (_confirmed) return;
        if (_value > 0.85) {
          setState(() => _confirmed = true);
          widget.onConfirmed();
        } else {
          setState(() => _value = 0);
        }
      },
      child: Container(
        height: 56,
        decoration: BoxDecoration(
          color: AppColors.primary.withOpacity(0.08),
          borderRadius: BorderRadius.circular(999),
          border: Border.all(color: AppColors.primary, width: 1),
        ),
        child: Stack(
          children: [
            Center(
              child: Text(
                widget.label,
                style: Theme.of(context).textTheme.labelLarge?.copyWith(color: AppColors.primary),
              ),
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: FractionallySizedBox(
                widthFactor: _confirmed ? 1 : (_value.clamp(0, 1) * 0.85) + 0.15,
                child: Container(
                  margin: const EdgeInsets.all(4),
                  decoration: BoxDecoration(
                    color: AppColors.primary,
                    borderRadius: BorderRadius.circular(999),
                  ),
                  child: const Icon(Icons.chevron_right, color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

