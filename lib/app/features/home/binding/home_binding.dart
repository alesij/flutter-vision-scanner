import 'package:flutter_vision_scanner/app/features/capture/controller/choose_source_dialog_controller.dart';
import 'package:flutter_vision_scanner/app/features/home/controller/home_controller.dart';
import 'package:flutter_vision_scanner/app/features/scan_records/data/datasources/scan_record_datasource_impl.dart';
import 'package:flutter_vision_scanner/app/features/scan_records/data/repositories/scan_record_repository_impl.dart';
import 'package:flutter_vision_scanner/app/features/scan_records/domain/datasources/scan_record_datasource.dart';
import 'package:flutter_vision_scanner/app/features/scan_records/domain/repositories/scan_record_repository.dart';
import 'package:flutter_vision_scanner/app/features/scan_records/domain/usecases/get_recent_scans_usecase.dart';
import 'package:get/get.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ScanRecordDatasource>(() => ScanRecordDatasourceImpl());
    Get.lazyPut<ScanRecordRepository>(
      () => ScanRecordRepositoryImpl(
        localDatasource: Get.find<ScanRecordDatasource>(),
      ),
    );
    Get.lazyPut<GetRecentScansUseCase>(
      () => GetRecentScansUseCase(repository: Get.find<ScanRecordRepository>()),
    );
    Get.lazyPut<HomeController>(() => HomeController());
    Get.lazyPut<ChooseSourceDialogController>(
      () => ChooseSourceDialogController(),
    );
  }
}
