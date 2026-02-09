import 'dart:io';

import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;

/// Utility class for creating and cleaning up temporary PDF files.
class PdfService {
  /// Create a temporary PDF file from an image path and return the file path.
  static Future<String> _createTempPdfFromImage(String imagePath) async {
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

  Future<void> openResultPdf({required String imagePath}) async {
    final tempPdf = await _createTempPdfFromImage(imagePath);
    try {
      await OpenFile.open(tempPdf);
    } finally {
      File(tempPdf).delete().ignore();
    }
  }
}
