import '../../domain/entities/trip.dart';
import '../../domain/enums/trip_status.dart';
import 'site_model.dart';
import 'status_history_model.dart';
import 'vehicle_model.dart';

class TripModel {
  final String id;
  final String reference;
  final SiteModel origin;
  final SiteModel destination;
  final VehicleModel? vehicle;
  final TripStatus status;
  final List<StatusHistoryModel> history;

  const TripModel({
    required this.id,
    required this.reference,
    required this.origin,
    required this.destination,
    this.vehicle,
    required this.status,
    this.history = const [],
  });

  factory TripModel.fromJson(Map<String, dynamic> json) => TripModel(
        id: json['id'].toString(),
        reference: json['reference'] as String? ?? '',
        origin: SiteModel.fromJson(json['origin'] as Map<String, dynamic>),
        destination: SiteModel.fromJson(json['destination'] as Map<String, dynamic>),
        vehicle: json['vehicle'] == null ? null : VehicleModel.fromJson(json['vehicle'] as Map<String, dynamic>),
        status: _statusFromString(json['status'] as String? ?? ''),
        history: (json['history'] as List<dynamic>? ?? [])
            .map((e) => StatusHistoryModel.fromJson(e as Map<String, dynamic>))
            .toList(),
      );

  Trip toEntity() => Trip(
        id: id,
        reference: reference,
        origin: origin.toEntity(),
        destination: destination.toEntity(),
        vehicle: vehicle?.toEntity(),
        status: status,
        history: history.map((e) => e.toEntity()).toList(),
      );
}

TripStatus _statusFromString(String v) {
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

