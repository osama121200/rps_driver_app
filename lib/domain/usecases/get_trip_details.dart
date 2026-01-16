import '../entities/trip.dart';
import '../repositories/trip_repository.dart';

class GetTripDetails {
  final TripRepository repository;
  const GetTripDetails(this.repository);

  Future<Trip> call(String id) => repository.getTripDetails(id);
}

