import 'package:flutter_vision_scanner/app/core/services/pdf_service.dart';
import 'package:flutter_vision_scanner/app/features/scan_records/domain/entities/scan_record.dart';
import 'package:get/get.dart';

class ScanDetailController extends GetxController {
  ScanDetailController({
    required PdfService pdfService,
    required ScanRecord scanRecord,
  }) : _pdfService = pdfService,
       scanRecord = scanRecord;

  final PdfService _pdfService;

  final ScanRecord scanRecord;

  @override
  void onInit() {
    super.onInit();
  }

  Future<void> openPdfExternally() async {
    final fileName = scanRecord.fileName;

    await _pdfService.openResultPdf(imagePath: fileName);
  }
}
