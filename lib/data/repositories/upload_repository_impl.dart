import '../../domain/repositories/upload_repository.dart';
import '../datasources/remote/upload_remote_data_source.dart';

class UploadRepositoryImpl implements UploadRepository {
  final UploadRemoteDataSource remote;
  UploadRepositoryImpl({required this.remote});

  @override
  Future<void> reportIncident({required String tripId, required String type, String? comment, String? photoPath}) {
    return remote.reportIncident(tripId: tripId, type: type, comment: comment, photoPath: photoPath);
  }

  @override
  Future<void> uploadTripPhoto({required String tripId, required String filePath, required String type}) {
    return remote.uploadTripPhoto(tripId: tripId, filePath: filePath, type: type);
  }
}

