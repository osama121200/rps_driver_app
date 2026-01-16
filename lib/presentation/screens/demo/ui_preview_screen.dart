import 'package:flutter/material.dart';
import '../../../core/constants/demo_data.dart';
import '../../screens/auth/login_screen.dart';
import '../../screens/home/home_screen.dart';
import '../../screens/trip_details/trip_details_screen.dart';
import '../../screens/pod/pod_screen.dart';
import '../../screens/incident/incident_screen.dart';
import '../../widgets/mission_card.dart';
import 'barcode_preview_screen.dart';

class UiPreviewScreen extends StatelessWidget {
  const UiPreviewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('UI Preview')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          _sectionTitle(context, 'Navigate to'),
          _navButton(context, 'Login Screen', const LoginScreen()),
          _navButton(context, 'Home / Dashboard (empty)', const HomeScreen()),
          _navButton(context, 'Trip Details', const TripDetailsScreen(tripId: 'demo')),
          _navButton(context, 'Proof of Delivery (POD)', const PodScreen(tripId: 'demo')),
          _navButton(context, 'Incident Report', const IncidentScreen(tripId: 'demo')),
          _navButton(context, 'Barcode / Scanner (UI only)', const BarcodePreviewScreen()),
          const SizedBox(height: 24),
          _sectionTitle(context, 'Home / Dashboard (with mission)'),
          MissionCard(
            reference: DemoData.missionRef,
            origin: DemoData.origin,
            destination: DemoData.destination,
            status: 'assigned',
          ),
          const SizedBox(height: 12),
          MissionCard(
            reference: DemoData.missionRef,
            origin: DemoData.origin,
            destination: DemoData.destination,
            status: 'in_transit',
          ),
          const SizedBox(height: 12),
          MissionCard(
            reference: DemoData.missionRef,
            origin: DemoData.origin,
            destination: DemoData.destination,
            status: 'customs',
          ),
          const SizedBox(height: 12),
          MissionCard(
            reference: DemoData.missionRef,
            origin: DemoData.origin,
            destination: DemoData.destination,
            status: 'completed',
          ),
        ],
      ),
    );
  }

  Widget _navButton(BuildContext context, String label, Widget screen) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: ElevatedButton(
        onPressed: () => Navigator.of(context).push(MaterialPageRoute(builder: (_) => screen)),
        child: Text(label),
      ),
    );
  }

  Widget _sectionTitle(BuildContext context, String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Text(title, style: Theme.of(context).textTheme.headlineMedium),
    );
  }
}

