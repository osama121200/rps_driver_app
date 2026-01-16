import '../enums/trip_status.dart';
import 'site.dart';
import 'status_history.dart';
import 'vehicle.dart';

class Trip {
  final String id;
  final String reference;
  final Site origin;
  final Site destination;
  final Vehicle? vehicle;
  final TripStatus status;
  final List<StatusHistory> history;

  const Trip({
    required this.id,
    required this.reference,
    required this.origin,
    required this.destination,
    this.vehicle,
    required this.status,
    this.history = const [],
  });
}

