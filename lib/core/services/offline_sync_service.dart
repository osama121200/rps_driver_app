import 'dart:async';
import '../../data/datasources/local/offline_queue_local_data_source.dart';
import '../../domain/repositories/location_repository.dart';

class OfflineSyncService {
  OfflineSyncService._();
  static final OfflineSyncService instance = OfflineSyncService._();

  Future<void> syncGpsQueue(LocationRepository locationRepository, OfflineQueueLocalDataSource local) async {
    final items = await local.fetchGpsQueue(limit: 200);
    for (final row in items) {
      try {
        final String? tripId = row['trip_id'] as String?;
        final double lat = (row['latitude'] as num).toDouble();
        final double lng = (row['longitude'] as num).toDouble();
        final DateTime ts = DateTime.parse(row['timestamp'] as String);
        if (tripId == null) {
          await locationRepository.postLocation(latitude: lat, longitude: lng, timestamp: ts);
        } else {
          await locationRepository.postTripLocation(tripId: tripId, latitude: lat, longitude: lng, timestamp: ts);
        }
        await local.deleteGpsById(row['id'] as int);
      } catch (_) {
        // Stop on first failure to avoid tight loop
        break;
      }
    }
  }
}

