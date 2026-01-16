import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../core/services/secure_storage_service.dart';
import '../../data/datasources/local/offline_queue_local_data_source.dart';
import '../../data/datasources/remote/auth_remote_data_source.dart';
import '../../data/datasources/remote/location_remote_data_source.dart';
import '../../data/datasources/remote/trips_remote_data_source.dart';
import '../../data/datasources/remote/upload_remote_data_source.dart';
import '../../data/repositories/auth_repository_impl.dart';
import '../../data/repositories/location_repository_impl.dart';
import '../../data/repositories/trip_repository_impl.dart';
import '../../data/repositories/upload_repository_impl.dart';
import '../../domain/repositories/auth_repository.dart';
import '../../domain/repositories/location_repository.dart';
import '../../domain/repositories/trip_repository.dart';
import '../../domain/repositories/upload_repository.dart';
import '../../domain/usecases/get_trip_details.dart';
import '../../domain/usecases/get_trips.dart';
import '../../domain/usecases/login.dart';
import '../../domain/usecases/report_incident.dart';
import '../../domain/usecases/send_location.dart';
import '../../domain/usecases/update_status.dart';
import '../../domain/usecases/upload_photo.dart';

// DataSources
final authRemoteDataSourceProvider = Provider<AuthRemoteDataSource>((ref) => AuthRemoteDataSourceImpl());
final locationRemoteDataSourceProvider = Provider<LocationRemoteDataSource>((ref) => LocationRemoteDataSourceImpl());
final uploadRemoteDataSourceProvider = Provider<UploadRemoteDataSource>((ref) => UploadRemoteDataSourceImpl());
final tripsRemoteDataSourceProvider = Provider<TripsRemoteDataSource>((ref) => TripsRemoteDataSourceImpl());
final offlineQueueProvider = Provider<OfflineQueueLocalDataSource>((ref) => OfflineQueueLocalDataSource.instance);

// Repositories
final authRepositoryProvider = Provider<AuthRepository>((ref) {
  return AuthRepositoryImpl(remote: ref.read(authRemoteDataSourceProvider), storage: SecureStorageService.instance);
});
final locationRepositoryProvider = Provider<LocationRepository>((ref) {
  return LocationRepositoryImpl(remote: ref.read(locationRemoteDataSourceProvider), localQueue: ref.read(offlineQueueProvider));
});
final uploadRepositoryProvider = Provider<UploadRepository>((ref) {
  return UploadRepositoryImpl(remote: ref.read(uploadRemoteDataSourceProvider));
});
final tripRepositoryProvider = Provider<TripRepository>((ref) {
  return TripRepositoryImpl(remote: ref.read(tripsRemoteDataSourceProvider));
});

// Usecases
final loginUseCaseProvider = Provider<Login>((ref) => Login(ref.read(authRepositoryProvider)));
final getTripsUseCaseProvider = Provider<GetTrips>((ref) => GetTrips(ref.read(tripRepositoryProvider)));
final getTripDetailsUseCaseProvider = Provider<GetTripDetails>((ref) => GetTripDetails(ref.read(tripRepositoryProvider)));
final updateStatusUseCaseProvider = Provider<UpdateStatus>((ref) => UpdateStatus(ref.read(tripRepositoryProvider)));
final sendLocationUseCaseProvider = Provider<SendLocation>((ref) => SendLocation(ref.read(locationRepositoryProvider)));
final uploadPhotoUseCaseProvider = Provider<UploadPhoto>((ref) => UploadPhoto(ref.read(uploadRepositoryProvider)));
final reportIncidentUseCaseProvider = Provider<ReportIncident>((ref) => ReportIncident(ref.read(uploadRepositoryProvider)));

