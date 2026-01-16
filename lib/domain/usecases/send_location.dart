import '../repositories/location_repository.dart';

class SendLocation {
  final LocationRepository repository;
  const SendLocation(this.repository);

  Future<void> call({
    required double latitude,
    required double longitude,
    required DateTime timestamp,
  }) {
    return repository.postLocation(latitude: latitude, longitude: longitude, timestamp: timestamp);
  }
}

