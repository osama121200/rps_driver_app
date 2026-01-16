import 'dart:io';
import 'package:dio/dio.dart';
import '../../../core/constants/api_constants.dart';
import '../../../core/network/api_client.dart';

abstract class UploadRemoteDataSource {
  Future<void> uploadTripPhoto({required String tripId, required String filePath, required String type});
  Future<void> reportIncident({required String tripId, required String type, String? comment, String? photoPath});
}

class UploadRemoteDataSourceImpl implements UploadRemoteDataSource {
  final Dio _dio;
  UploadRemoteDataSourceImpl({Dio? dio}) : _dio = dio ?? ApiClient().dio;

  @override
  Future<void> uploadTripPhoto({required String tripId, required String filePath, required String type}) async {
    final formData = FormData.fromMap({
      'type': type,
      'file': await MultipartFile.fromFile(filePath, filename: filePath.split(Platform.pathSeparator).last),
    });
    await _dio.post(ApiConstants.tripUploadPhoto(tripId), data: formData);
  }

  @override
  Future<void> reportIncident({required String tripId, required String type, String? comment, String? photoPath}) async {
    final map = <String, dynamic>{
      'type': type,
      'comment': comment,
    };
    if (photoPath != null && photoPath.isNotEmpty) {
      map['file'] = await MultipartFile.fromFile(photoPath, filename: photoPath.split(Platform.pathSeparator).last);
    }
    await _dio.post(ApiConstants.tripIncident(tripId), data: FormData.fromMap(map));
  }
}

