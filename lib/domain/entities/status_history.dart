import '../enums/trip_status.dart';

class StatusHistory {
  final TripStatus status;
  final DateTime timestamp;
  final String? note;

  const StatusHistory({
    required this.status,
    required this.timestamp,
    this.note,
  });
}

