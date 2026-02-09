import 'dart:io';
import 'package:path_provider/path_provider.dart';

/// Utility class for managing storage paths related to scan records.
class StoragePaths {
  /// Get the directory path for storing scan files.
  static Future<String> get scansDir async {
    final docsDir = await getApplicationDocumentsDirectory();
    return '${docsDir.path}/scans';
  }

  /// Get the full file path for a scan file given its name.
  static Future<String> fullFilePath(String fileName) async {
    final dir = await scansDir;
    return '$dir/$fileName';
  }

  /// Ensure the scans directory exists and return it as a Directory object.
  static Future<Directory> get scansDirectory async {
    final path = await scansDir;
    final dir = Directory(path);
    await dir.create(recursive: true);
    return dir;
  }
}
