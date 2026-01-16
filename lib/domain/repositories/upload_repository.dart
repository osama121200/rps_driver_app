abstract class UploadRepository {
  Future<void> uploadTripPhoto({
    required String tripId,
    required String filePath,
    required String type, // e.g., 'pod' or 'ferry_ticket'
  });

  Future<void> reportIncident({
    required String tripId,
    required String type,
    required String? comment,
    String? photoPath,
  });
}

