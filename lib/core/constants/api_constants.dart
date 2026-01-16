class ApiConstants {
  static const String baseUrl = String.fromEnvironment('API_BASE_URL', defaultValue: '');

  // Known endpoints (do not invent beyond provided ones)
  static const String login = '/api/v1/mobile/login';
  static const String postLocation = '/api/v1/mobile/location';
  static String tripLocation(String id) => '/api/v1/mobile/trips/$id/location';
  static String tripUploadPhoto(String id) => '/api/v1/mobile/trips/$id/upload-photo';
  static String tripIncident(String id) => '/api/v1/mobile/trips/$id/incident';
}

