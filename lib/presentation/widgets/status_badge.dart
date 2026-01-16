import 'package:flutter/material.dart';
import '../../core/constants/app_colors.dart';

class StatusBadge extends StatelessWidget {
  final String label;
  final Color? color;
  const StatusBadge({super.key, required this.label, this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: (color ?? AppColors.primary).withOpacity(0.1),
        borderRadius: BorderRadius.circular(999),
        border: Border.all(color: color ?? AppColors.primary, width: 1),
      ),
      child: Text(label, style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: color ?? AppColors.primary)),
    );
  }
}

