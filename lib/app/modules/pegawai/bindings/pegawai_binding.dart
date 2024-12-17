import 'package:get/get.dart';
import 'package:myapp/app/modules/pegawai/controllers/pegawai_controller.dart';

class PegawaiBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => PegawaiController());
  }
}