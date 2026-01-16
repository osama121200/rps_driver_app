import '../enums/trip_status.dart';
import '../entities/trip.dart';
import '../repositories/trip_repository.dart';

class UpdateStatus {
  final TripRepository repository;
  const UpdateStatus(this.repository);

  Future<Trip> call({
    required String tripId,
    required TripStatus status,
    Map<String, dynamic>? payload,
  }) {
    return repository.updateStatus(tripId: tripId, status: status, payload: payload);
  }
}

