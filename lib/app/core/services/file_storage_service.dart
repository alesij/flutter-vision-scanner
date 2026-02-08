import 'package:flutter_vision_scanner/app/core/domain/models/scan_record_dto.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';

/// Service for managing scan record storage using SQLite.
/// Handles database initialization, CRUD operations, and queries.
class FileStorageService {
  static const String _databaseName = 'scan_records.db';
  static const String _tableName = 'scan_records';
  static const int _databaseVersion = 1;

  static Database? _database;

  /// Initialize the database.
  /// Creates the database file and table structure if they don't exist.
  Future<void> init() async {
    if (_database != null) return;

    final directory = await getApplicationDocumentsDirectory();
    final path = '${directory.path}/$_databaseName';

    _database = await openDatabase(
      path,
      version: _databaseVersion,
      onCreate: _createTable,
    );
  }

  /// Create the scan_records table schema.
  Future<void> _createTable(Database db, int version) async {
    await db.execute('''
      CREATE TABLE IF NOT EXISTS $_tableName (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        file_name TEXT NOT NULL,
        scan_type TEXT NOT NULL,
        saved_at TEXT NOT NULL,
        file_size_bytes INTEGER NOT NULL
      )
    ''');
  }

  /// Write a new scan record to the database.
  Future<bool> writeScanRecord(ScanRecordDto record) async {
    await init();
    final db = _database;
    if (db == null) {
      throw Exception('Database not initialized');
    }

    /// Insert the record into the database and return true if successful.
    /// 0 indicates failure, while any positive integer indicates success.
    return await db.insert(
          _tableName,
          record.toMap(),
          conflictAlgorithm: ConflictAlgorithm.replace,
        ) >
        0;
  }

  /// Read all scan records from the database.
  Future<List<ScanRecordDto>> readAllScanRecords() async {
    await init();
    final db = _database!;
    final maps = await db.query(_tableName);
    return maps.map((map) => ScanRecordDto.fromMap(map)).toList();
  }

  /// Read a single scan record by ID.
  Future<ScanRecordDto?> readScanRecordById(int id) async {
    await init();
    final db = _database!;
    final maps = await db.query(_tableName, where: 'id = ?', whereArgs: [id]);
    if (maps.isEmpty) return null;
    return ScanRecordDto.fromMap(maps.first);
  }

  /// Delete a scan record by ID.
  Future<int> deleteScanRecord(int id) async {
    await init();
    final db = _database!;
    return await db.delete(_tableName, where: 'id = ?', whereArgs: [id]);
  }

  /// Close the database connection.
  Future<void> close() async {
    if (_database != null) {
      await _database!.close();
      _database = null;
    }
  }
}
