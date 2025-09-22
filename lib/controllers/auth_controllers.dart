import 'package:game_grid/config/helper/logger.dart';
import 'package:game_grid/constants/app_colors.dart';
import 'package:game_grid/model/auth_model.dart';
import 'package:game_grid/services/auth_services.dart';
import 'package:game_grid/view/widget/my_text_widget.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {


  Rx<AuthModel?> currentUser = Rx<AuthModel?>(null);
  RxBool isLoading = false.obs;
  



  Future<void> signUp(String email, String password, String name,
      {String? phone, int? age, String? role}) async {
    try {
      isLoading.value = true;
      final user = await AuthServices.instance.signUp(
        email: email,
        password: password,
        name: name,
        phone: phone,
        age: age,
        role: role,
      );
      currentUser.value = user;
    if(user != null){
      
      
    }
    } catch(e) {
      prettyLogger("Error creating user $e");
    } finally {
      isLoading.value = false;
    }
  }



  Future checkEmailVerified()async{

  }



  Future<void> login(String email, String password) async {
    try {
      isLoading.value = true;
      final user = await AuthServices.instance.login(email: email, password: password);
      currentUser.value = user;
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> logout() async {
    await AuthServices.instance.logout();
    currentUser.value = null;
  }

  Future<void> loadCurrentUser() async {
    final user = await AuthServices.instance.getCurrentUser();
    currentUser.value = user;
  }
}
