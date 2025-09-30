import 'package:game_grid/controllers/auth_controllers.dart';
import 'package:get/get.dart';

class AppBindings extends Bindings {


  @override
  void dependencies() {
    Get.put(AuthController());

  }


}