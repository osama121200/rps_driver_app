import '../entities/trip.dart';
import '../enums/trip_status.dart';

abstract class TripRepository {
  Future<List<Trip>> getTrips();
  Future<Trip> getTripDetails(String id);
  Future<Trip> updateStatus({
    required String tripId,
    required TripStatus status,
    Map<String, dynamic>? payload,
  });
}

