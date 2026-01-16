import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class OfflineQueueLocalDataSource {
  static final OfflineQueueLocalDataSource instance = OfflineQueueLocalDataSource._();
  OfflineQueueLocalDataSource._();

  Database? _db;

  Future<Database> _database() async {
    if (_db != null) return _db!;
    final dir = await getApplicationDocumentsDirectory();
    final path = p.join(dir.path, 'rps_driver.db');
    _db = await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) async {
        await db.execute('''
          CREATE TABLE IF NOT EXISTS gps_queue(
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            trip_id TEXT,
            latitude REAL NOT NULL,
            longitude REAL NOT NULL,
            timestamp TEXT NOT NULL
          );
        ''');
        await db.execute('''
          CREATE TABLE IF NOT EXISTS status_queue(
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            trip_id TEXT NOT NULL,
            status TEXT NOT NULL,
            payload TEXT,
            timestamp TEXT NOT NULL
          );
        ''');
      },
    );
    return _db!;
  }

  Future<void> enqueueGps({
    String? tripId,
    required double latitude,
    required double longitude,
    required DateTime timestamp,
  }) async {
    final db = await _database();
    await db.insert('gps_queue', {
      'trip_id': tripId,
      'latitude': latitude,
      'longitude': longitude,
      'timestamp': timestamp.toIso8601String(),
    });
  }

  Future<List<Map<String, dynamic>>> fetchGpsQueue({int limit = 100}) async {
    final db = await _database();
    return db.query('gps_queue', orderBy: 'id ASC', limit: limit);
  }

  Future<void> deleteGpsById(int id) async {
    final db = await _database();
    await db.delete('gps_queue', where: 'id=?', whereArgs: [id]);
  }
}

