abstract class LocationRepository {
  Future<void> postLocation({
    required double latitude,
    required double longitude,
    required DateTime timestamp,
  });

  Future<void> postTripLocation({
    required String tripId,
    required double latitude,
    required double longitude,
    required DateTime timestamp,
  });
}

