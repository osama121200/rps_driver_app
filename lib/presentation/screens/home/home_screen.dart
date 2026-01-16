import 'package:flutter/material.dart';
import '../../../core/constants/app_strings.dart';
import '../../widgets/mission_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Placeholder: Active mission unknown without endpoint
    const bool hasMission = false;
    return Scaffold(
      appBar: AppBar(title: const Text('Dashboard')),
      body: RefreshIndicator(
        onRefresh: () async {
          // TODO: trigger GetTrips when endpoint available
          await Future<void>.delayed(const Duration(milliseconds: 600));
        },
        child: ListView(
          padding: const EdgeInsets.symmetric(vertical: 16),
          children: [
            if (hasMission)
              const MissionCard(
                reference: 'VOY-2026-XXX',
                origin: 'Origine',
                destination: 'Destination',
                status: 'assigned',
              )
            else
              Center(
                child: Padding(
                  padding: const EdgeInsets.all(24),
                  child: Text(
                    AppStrings.waitingAssignment,
                    style: Theme.of(context).textTheme.headlineMedium,
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}

