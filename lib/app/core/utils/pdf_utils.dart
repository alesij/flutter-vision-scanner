import 'dart:io';

import 'package:path_provider/path_provider.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;

/// Utility class for creating and cleaning up temporary PDF files.
class PdfUtils {
  /// Create a temporary PDF file from an image path and return the file path.
  static Future<String> createTempPdfFromImage(String imagePath) async {
    final pdf = pw.Document();

    final imageBytes = await File(imagePath).readAsBytes();
    final pdfImage = pw.MemoryImage(imageBytes);

    pdf.addPage(
      pw.Page(
        pageFormat: PdfPageFormat.a4,
        build: (_) => pw.Center(child: pw.Image(pdfImage)),
      ),
    );

    final tempDir = await getTemporaryDirectory();
    final timestamp = DateTime.now().millisecondsSinceEpoch;
    final pdfPath = '${tempDir.path}/scan_$timestamp.pdf';
    await File(pdfPath).writeAsBytes(await pdf.save(), flush: true);
    return pdfPath;
  }

  /// Delete a file if it exists.
  static Future<void> deleteIfExists(String? path) async {
    if (path == null) return;
    final file = File(path);
    if (await file.exists()) {
      await file.delete();
    }
  }
}
