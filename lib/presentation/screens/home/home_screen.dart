import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/constants/app_strings.dart';
import '../../widgets/mission_card.dart';
import '../../state/providers.dart';
import '../../../domain/entities/trip.dart';

final tripsFutureProvider = FutureProvider<List<Trip>>((ref) async {
  final getTrips = ref.read(getTripsUseCaseProvider);
  return await getTrips();
});

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final tripsAsync = ref.watch(tripsFutureProvider);
    return Scaffold(
      appBar: AppBar(title: const Text('Dashboard')),
      body: RefreshIndicator(
        onRefresh: () async {
          ref.invalidate(tripsFutureProvider);
          await ref.read(tripsFutureProvider.future);
        },
        child: tripsAsync.when(
          data: (trips) {
            if (trips.isEmpty) {
              return ListView(
                padding: const EdgeInsets.symmetric(vertical: 16),
                children: [
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
              );
            }
            final trip = trips.first;
            return ListView(
              padding: const EdgeInsets.symmetric(vertical: 16),
              children: [
                MissionCard(
                  reference: trip.reference,
                  origin: trip.origin.name,
                  destination: trip.destination.name,
                  status: trip.status.name,
                ),
              ],
            );
          },
          loading: () => const Center(child: CircularProgressIndicator()),
          error: (e, st) {
            return ListView(
              padding: const EdgeInsets.symmetric(vertical: 16),
              children: [
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
            );
          },
        ),
      ),
    );
  }
}

