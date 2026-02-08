import 'package:flutter_vision_scanner/app/features/scan_result/controller/scan_result_controller.dart';
import 'package:flutter_vision_scanner/app/features/scan_records/data/datasources/scan_record_datasource_impl.dart';
import 'package:flutter_vision_scanner/app/features/scan_records/data/repositories/scan_record_repository_impl.dart';
import 'package:flutter_vision_scanner/app/features/scan_records/domain/datasources/scan_record_datasource.dart';
import 'package:flutter_vision_scanner/app/features/scan_records/domain/repositories/scan_record_repository.dart';
import 'package:flutter_vision_scanner/app/features/scan_records/domain/usecases/save_scan_record_usecase.dart';
import 'package:get/get.dart';

/// Binding class for the Scan Result feature.
class ScanResultBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ScanRecordDatasource>(() => ScanRecordDatasourceImpl());
    Get.lazyPut<ScanRecordRepository>(
      () => ScanRecordRepositoryImpl(
        localDatasource: Get.find<ScanRecordDatasource>(),
      ),
    );
    Get.lazyPut<SaveScanRecordUseCase>(
      () => SaveScanRecordUseCase(repository: Get.find<ScanRecordRepository>()),
    );
    Get.lazyPut<ScanResultController>(() => ScanResultController());
  }
}
