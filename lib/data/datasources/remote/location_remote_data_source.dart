import 'package:dio/dio.dart';
import '../../../core/constants/api_constants.dart';
import '../../../core/network/api_client.dart';

abstract class LocationRemoteDataSource {
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

class LocationRemoteDataSourceImpl implements LocationRemoteDataSource {
  final Dio _dio;
  LocationRemoteDataSourceImpl({Dio? dio}) : _dio = dio ?? ApiClient().dio;

  @override
  Future<void> postLocation({required double latitude, required double longitude, required DateTime timestamp}) async {
    await _dio.post(ApiConstants.postLocation, data: {
      'latitude': latitude,
      'longitude': longitude,
      'timestamp': timestamp.toIso8601String(),
    });
  }

  @override
  Future<void> postTripLocation({
    required String tripId,
    required double latitude,
    required double longitude,
    required DateTime timestamp,
  }) async {
    await _dio.post(ApiConstants.tripLocation(tripId), data: {
      'latitude': latitude,
      'longitude': longitude,
      'timestamp': timestamp.toIso8601String(),
    });
  }
}

