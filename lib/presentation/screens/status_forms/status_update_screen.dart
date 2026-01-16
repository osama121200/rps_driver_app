import 'package:flutter/material.dart';
import '../../../domain/enums/trip_status.dart';
import '../../widgets/slide_to_confirm.dart';

class StatusUpdateScreen extends StatefulWidget {
  final String tripId;
  final TripStatus nextStatus;
  const StatusUpdateScreen({super.key, required this.tripId, required this.nextStatus});

  @override
  State<StatusUpdateScreen> createState() => _StatusUpdateScreenState();
}

class _StatusUpdateScreenState extends State<StatusUpdateScreen> {
  final TextEditingController _mrnController = TextEditingController();

  @override
  void dispose() {
    _mrnController.dispose();
    super.dispose();
  }

  void _confirm() {
    // TODO: call UpdateStatus usecase with contextual payload
    Navigator.of(context).pop(true);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Changement de statut')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            if (widget.nextStatus == TripStatus.customs)
              TextField(
                controller: _mrnController,
                decoration: const InputDecoration(labelText: 'MRN (optionnel)'),
              ),
            const Spacer(),
            SlideToConfirm(label: 'Glisser pour confirmer', onConfirmed: _confirm),
            const SizedBox(height: 12),
          ],
        ),
      ),
    );
  }
}

