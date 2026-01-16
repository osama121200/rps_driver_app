import 'dart:async';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../core/services/gps_service.dart';
import '../../domain/usecases/send_location.dart';
import 'providers.dart';

class GpsController extends StateNotifier<bool> {
  final SendLocation sendLocation;
  Timer? _timer;
  GpsController({required this.sendLocation}) : super(false);

  Future<void> start() async {
    if (state) return;
    final ok = await GpsService.instance.ensurePermissions();
    if (!ok) return;
    state = true;
    _timer?.cancel();
    // Default: every 5 minutes
    _timer = Timer.periodic(const Duration(minutes: 5), (_) async {
      final pos = await GpsService.instance.getCurrentPosition();
      if (pos == null) return;
      await sendLocation(latitude: pos.latitude, longitude: pos.longitude, timestamp: DateTime.now());
    });
  }

  void stop() {
    _timer?.cancel();
    state = false;
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }
}

final gpsControllerProvider = StateNotifierProvider<GpsController, bool>((ref) {
  return GpsController(sendLocation: ref.read(sendLocationUseCaseProvider));
});

