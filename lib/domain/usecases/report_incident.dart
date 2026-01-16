import '../repositories/upload_repository.dart';

class ReportIncident {
  final UploadRepository repository;
  const ReportIncident(this.repository);

  Future<void> call({
    required String tripId,
    required String type,
    String? comment,
    String? photoPath,
  }) {
    return repository.reportIncident(tripId: tripId, type: type, comment: comment, photoPath: photoPath);
  }
}

