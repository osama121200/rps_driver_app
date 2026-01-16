import '../../domain/repositories/location_repository.dart';
import '../datasources/local/offline_queue_local_data_source.dart';
import '../datasources/remote/location_remote_data_source.dart';

class LocationRepositoryImpl implements LocationRepository {
  final LocationRemoteDataSource remote;
  final OfflineQueueLocalDataSource localQueue;

  LocationRepositoryImpl({required this.remote, required this.localQueue});

  @override
  Future<void> postLocation({required double latitude, required double longitude, required DateTime timestamp}) async {
    try {
      await remote.postLocation(latitude: latitude, longitude: longitude, timestamp: timestamp);
    } catch (_) {
      await localQueue.enqueueGps(latitude: latitude, longitude: longitude, timestamp: timestamp);
    }
  }

  @override
  Future<void> postTripLocation({
    required String tripId,
    required double latitude,
    required double longitude,
    required DateTime timestamp,
  }) async {
    try {
      await remote.postTripLocation(tripId: tripId, latitude: latitude, longitude: longitude, timestamp: timestamp);
    } catch (_) {
      await localQueue.enqueueGps(tripId: tripId, latitude: latitude, longitude: longitude, timestamp: timestamp);
    }
  }
}

