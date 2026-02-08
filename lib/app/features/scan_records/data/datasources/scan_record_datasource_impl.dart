import 'package:flutter_vision_scanner/app/features/scan_records/data/models/scan_record_dto.dart';
import 'package:flutter_vision_scanner/app/core/domain/types/either.dart';
import 'package:flutter_vision_scanner/app/core/domain/types/failure.dart';
import 'package:flutter_vision_scanner/app/features/scan_records/domain/datasources/scan_record_datasource.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

/// SQLite implementation of [ScanRecordDatasource].
class ScanRecordDatasourceImpl implements ScanRecordDatasource {
  static const String _databaseName = 'scan_records.db';
  static const String _tableName = 'scan_records';
  static const int _databaseVersion = 1;

  static Database? _database;

  Future<void> _init() async {
    if (_database != null) return;

    final directory = await getApplicationDocumentsDirectory();
    final path = '${directory.path}/$_databaseName';

    _database = await openDatabase(
      path,
      version: _databaseVersion,
      onCreate: _createTable,
    );
  }

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

  @override
  Future<Either<Failure, bool>> insertScanRecord(ScanRecordDto record) async {
    try {
      await _init();
      final db = _database;
      if (db == null) {
        throw Exception('Database not initialized');
      }

      final inserted =
          await db.insert(
            _tableName,
            record.toMap(),
            conflictAlgorithm: ConflictAlgorithm.replace,
          ) >
          0;
      return Right(inserted);
    } catch (e, stackTrace) {
      return Left(
        Failure.generic(
          message: 'Failed to write scan record',
          body: e.toString(),
          strackTrace: stackTrace,
        ),
      );
    }
  }

  @override
  Future<Either<Failure, List<ScanRecordDto>>> readAllScanRecords() async {
    try {
      await _init();
      final db = _database;
      if (db == null) {
        throw Exception('Database not initialized');
      }

      final maps = await db.query(_tableName);
      final records = maps.map((map) => ScanRecordDto.fromMap(map)).toList();
      return Right(records);
    } catch (e, stackTrace) {
      return Left(
        Failure.generic(
          message: 'Failed to read scan records',
          body: e.toString(),
          strackTrace: stackTrace,
        ),
      );
    }
  }
}
