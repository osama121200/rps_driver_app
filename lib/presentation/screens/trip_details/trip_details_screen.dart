import 'package:flutter/material.dart';
import '../../../core/constants/app_spacing.dart';
import '../../widgets/status_badge.dart';

class TripDetailsScreen extends StatelessWidget {
  final String tripId;
  const TripDetailsScreen({super.key, required this.tripId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Détails mission')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Card(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      const Text('VOY-2026-XXX', style: TextStyle(fontWeight: FontWeight.w700, fontSize: 18)),
                      const Spacer(),
                      const StatusBadge(label: 'ASSIGNED'),
                    ],
                  ),
                  const SizedBox(height: AppSpacing.lg),
                  _siteRow(Icons.home_work_outlined, 'Origine entrepôt', '08:00 - 18:00'),
                  const SizedBox(height: AppSpacing.md),
                  _siteRow(Icons.place_outlined, 'Destination client', '08:00 - 18:00'),
                ],
              ),
            ),
          ),
          const SizedBox(height: 12),
          Card(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text('Timeline', style: TextStyle(fontWeight: FontWeight.w700)),
                  SizedBox(height: 12),
                  // Placeholder for vertical timeline
                  Text('assigned → on_way_to_pickup → loading → in_transit → customs/ferry → unloading → completed'),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _siteRow(IconData icon, String name, String time) {
    return Row(
      children: [
        Icon(icon),
        const SizedBox(width: 8),
        Expanded(child: Text(name)),
        Text(time, style: const TextStyle(color: Colors.grey)),
      ],
    );
  }
}

