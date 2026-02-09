import 'package:flutter_vision_scanner/app/core/services/pdf_service.dart';
import 'package:flutter_vision_scanner/app/features/scan_records/domain/entities/scan_record.dart';
import 'package:get/get.dart';

/// Controller for the Scan Detail page.
class ScanDetailController extends GetxController {
  /// Constructor with required dependencies.
  ScanDetailController({
    required PdfService pdfService,
    required this.scanRecord,
  }) : _pdfService = pdfService;

  /// The scan record whose details are being displayed.
  final ScanRecord scanRecord;

  final PdfService _pdfService;

  /// Open the scan result PDF in an external application.
  Future<void> openPdfExternally() async {
    final fileName = scanRecord.fileName;

    await _pdfService.openResultPdf(imagePath: fileName);
  }
}
