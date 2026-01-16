import '../../domain/entities/trip.dart';
import '../../domain/enums/trip_status.dart';
import '../../domain/repositories/trip_repository.dart';
import '../datasources/remote/trips_remote_data_source.dart';

class TripRepositoryImpl implements TripRepository {
  final TripsRemoteDataSource remote;
  TripRepositoryImpl({required this.remote});

  @override
  Future<Trip> getTripDetails(String id) async {
    final model = await remote.getTripDetails(id);
    return model.toEntity();
  }

  @override
  Future<List<Trip>> getTrips() async {
    final models = await remote.getTrips();
    return models.map((e) => e.toEntity()).toList();
  }

  @override
  Future<Trip> updateStatus({required String tripId, required TripStatus status, Map<String, dynamic>? payload}) async {
    final model = await remote.updateStatus(tripId: tripId, status: status.name, payload: payload);
    return model.toEntity();
  }
}

