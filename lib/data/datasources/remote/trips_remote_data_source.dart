import '../../models/trip_model.dart';

abstract class TripsRemoteDataSource {
  Future<List<TripModel>> getTrips();
  Future<TripModel> getTripDetails(String id);
  Future<TripModel> updateStatus({
    required String tripId,
    required String status,
    Map<String, dynamic>? payload,
  });
}

class TripsRemoteDataSourceImpl implements TripsRemoteDataSource {
  @override
  Future<List<TripModel>> getTrips() {
    throw UnsupportedError('Trips endpoints not provided.');
  }

  @override
  Future<TripModel> getTripDetails(String id) {
    throw UnsupportedError('Trips endpoints not provided.');
  }

  @override
  Future<TripModel> updateStatus({required String tripId, required String status, Map<String, dynamic>? payload}) {
    throw UnsupportedError('Status update endpoint not provided.');
  }
}

