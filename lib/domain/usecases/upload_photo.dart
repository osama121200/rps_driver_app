import '../repositories/upload_repository.dart';

class UploadPhoto {
  final UploadRepository repository;
  const UploadPhoto(this.repository);

  Future<void> call({
    required String tripId,
    required String filePath,
    required String type,
  }) {
    return repository.uploadTripPhoto(tripId: tripId, filePath: filePath, type: type);
  }
}

