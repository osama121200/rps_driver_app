import 'dart:async';
import 'package:connectivity_plus/connectivity_plus.dart';

class ConnectivityService {
  ConnectivityService._();
  static final ConnectivityService instance = ConnectivityService._();

  final Connectivity _connectivity = Connectivity();
  final StreamController<bool> _controller = StreamController<bool>.broadcast();

  Stream<bool> get onConnectivityChanged => _controller.stream;

  Future<void> initialize() async {
    final results = await _connectivity.checkConnectivity();
    if (results.isNotEmpty) {
      _controller.add(_connected(results.first));
    }
    _connectivity.onConnectivityChanged.listen((resultList) {
      if (resultList.isEmpty) return;
      _controller.add(_connected(resultList.first));
    });
  }

  bool _connected(ConnectivityResult result) {
    return result == ConnectivityResult.mobile || result == ConnectivityResult.wifi;
  }
}

