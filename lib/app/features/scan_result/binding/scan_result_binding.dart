import 'package:flutter_vision_scanner/app/core/services/pdf_service.dart';
import 'package:flutter_vision_scanner/app/features/scan_result/controller/scan_result_controller.dart';
import 'package:flutter_vision_scanner/app/features/scan_records/data/datasources/scan_record_datasource_impl.dart';
import 'package:flutter_vision_scanner/app/features/scan_records/data/repositories/scan_record_repository_impl.dart';
import 'package:flutter_vision_scanner/app/features/scan_records/domain/datasources/scan_record_datasource.dart';
import 'package:flutter_vision_scanner/app/features/scan_records/domain/repositories/scan_record_repository.dart';
import 'package:flutter_vision_scanner/app/features/scan_result/domain/entities/scan_result.dart';
import 'package:flutter_vision_scanner/app/features/scan_result/domain/usecases/save_scan_result_usecase.dart';
import 'package:get/get.dart';

/// Binding class for the Scan Result feature.
class ScanResultBinding extends Bindings {
  @override
  void dependencies() {
    // 1. Datasource.
    Get.lazyPut<ScanRecordDatasource>(() => ScanRecordDatasourceImpl());

    // 2. Repository.
    Get.lazyPut<ScanRecordRepository>(
      () => ScanRecordRepositoryImpl(
        localDatasource: Get.find<ScanRecordDatasource>(),
      ),
    );

    // 3. UseCase.
    Get.lazyPut<SaveScanResultUseCase>(
      () => SaveScanResultUseCase(repository: Get.find<ScanRecordRepository>()),
    );

    // 3.1 Services.
    Get.lazyPut<PdfService>(() => PdfService());

    // 4. Controller.
    Get.lazyPut<ScanResultController>(
      () => ScanResultController(
        pdfService: Get.find<PdfService>(),
        saveUseCase: Get.find<SaveScanResultUseCase>(),
        scanResult: Get.arguments as ScanResult,
      ),
    );
  }
}
