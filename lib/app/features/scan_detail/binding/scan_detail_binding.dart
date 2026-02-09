import 'package:flutter_vision_scanner/app/core/services/pdf_service.dart';
import 'package:flutter_vision_scanner/app/features/scan_records/domain/entities/scan_record.dart';
import 'package:get/get.dart';
import 'package:flutter_vision_scanner/app/features/scan_detail/controller/scan_detail_controller.dart';

/// Binding class for the Scan Detail feature.
class ScanDetailBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PdfService>(() => PdfService());

    Get.lazyPut<ScanDetailController>(
      () => ScanDetailController(
        pdfService: Get.find<PdfService>(),
        scanRecord: Get.arguments as ScanRecord,
      ),
    );
  }
}
