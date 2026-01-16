import '../../domain/entities/status_history.dart';
import '../../domain/enums/trip_status.dart';

class StatusHistoryModel {
  final TripStatus status;
  final DateTime timestamp;
  final String? note;

  const StatusHistoryModel({
    required this.status,
    required this.timestamp,
    this.note,
  });

  factory StatusHistoryModel.fromJson(Map<String, dynamic> json) => StatusHistoryModel(
        status: _statusFromString(json['status'] as String? ?? ''),
        timestamp: DateTime.tryParse(json['timestamp'] as String? ?? '') ?? DateTime.now(),
        note: json['note'] as String?,
      );

  StatusHistory toEntity() => StatusHistory(status: status, timestamp: timestamp, note: note);

  static TripStatus _statusFromString(String v) {
    switch (v) {
      case 'assigned':
        return TripStatus.assigned;
      case 'on_way_to_pickup':
        return TripStatus.onWayToPickup;
      case 'loading':
        return TripStatus.loading;
      case 'in_transit':
        return TripStatus.inTransit;
      case 'customs':
        return TripStatus.customs;
      case 'ferry':
        return TripStatus.ferry;
      case 'unloading':
        return TripStatus.unloading;
      case 'completed':
        return TripStatus.completed;
      default:
        return TripStatus.assigned;
    }
  }
}

