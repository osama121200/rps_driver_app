import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../core/services/connectivity_service.dart';
import '../../core/services/offline_sync_service.dart';
import '../../data/datasources/local/offline_queue_local_data_source.dart';
import 'providers.dart';
import 'gps_controller.dart';

class AppBootstrapper extends ConsumerStatefulWidget {
  final Widget child;
  const AppBootstrapper({super.key, required this.child});

  @override
  ConsumerState<AppBootstrapper> createState() => _AppBootstrapperState();
}

class _AppBootstrapperState extends ConsumerState<AppBootstrapper> {
  StreamSubscription<bool>? _sub;

  @override
  void initState() {
    super.initState();
    ConnectivityService.instance.initialize();
    _sub = ConnectivityService.instance.onConnectivityChanged.listen((connected) {
      if (connected) {
        final locationRepo = ref.read(locationRepositoryProvider);
        final local = OfflineQueueLocalDataSource.instance;
        OfflineSyncService.instance.syncGpsQueue(locationRepo, local);
      }
    });
    // Start foreground GPS tracking (5 min by default)
    ref.read(gpsControllerProvider.notifier).start();
  }

  @override
  void dispose() {
    _sub?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => widget.child;
}

