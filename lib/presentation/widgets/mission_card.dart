import 'package:flutter/material.dart';
import '../../core/constants/app_colors.dart';
import '../../core/constants/app_spacing.dart';
import 'status_badge.dart';

class MissionCard extends StatelessWidget {
  final String reference;
  final String origin;
  final String destination;
  final String status;
  const MissionCard({
    super.key,
    required this.reference,
    required this.origin,
    required this.destination,
    required this.status,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              children: [
                const Icon(Icons.local_shipping, color: AppColors.primary),
                const SizedBox(width: 8),
                Text(reference, style: Theme.of(context).textTheme.headlineMedium),
                const Spacer(),
                StatusBadge(label: status.toUpperCase()),
              ],
            ),
            const SizedBox(height: AppSpacing.lg),
            Row(
              children: [
                const Icon(Icons.home_work_outlined, color: AppColors.textSecondary),
                const SizedBox(width: 8),
                Expanded(child: Text(origin, style: Theme.of(context).textTheme.bodyLarge)),
              ],
            ),
            const SizedBox(height: AppSpacing.md),
            Row(
              children: [
                const Icon(Icons.place_outlined, color: AppColors.textSecondary),
                const SizedBox(width: 8),
                Expanded(child: Text(destination, style: Theme.of(context).textTheme.bodyLarge)),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

