import '../entities/trip.dart';
import '../repositories/trip_repository.dart';

class GetTrips {
  final TripRepository repository;
  const GetTrips(this.repository);

  Future<List<Trip>> call() => repository.getTrips();
}

