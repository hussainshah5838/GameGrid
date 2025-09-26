import 'package:flutter/material.dart';
import 'package:game_grid/config/helper/logger.dart';
import 'package:game_grid/config/routes/routes.dart';
import 'package:game_grid/constants/app_colors.dart';
import 'package:game_grid/model/auth_model.dart';
import 'package:game_grid/services/auth_services.dart';
import 'package:game_grid/view/widget/common_show_snackbar_widget.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthController extends GetxController {


  Rx<AuthModel?> currentUser = Rx<AuthModel?>(null);
  RxBool isLoading = false.obs;

   RxBool hasFormError = false.obs;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  RxBool isTermsChecked = false.obs;
  RxString errorMessage = "".obs;
   RxString nameError = "".obs;
  RxString emailError = "".obs;
  RxString passwordError = "".obs;

RxBool termsError = false.obs;
   RxBool isPasswordHide = true.obs;
   RxString emailErrorMessage = "".obs;

   RxBool isRememberMeChecked = false.obs;
  RxString savedUid = "".obs;


  Future<void> saveCredentials(String uuid,) async {
    if (!isRememberMeChecked.value) return;
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('uuid', uuid);
   
  }

  Future<void> loadSavedCredentials() async {
    final prefs = await SharedPreferences.getInstance();
    final uuid = prefs.getString('uuid') ?? "";
    if (uuid.isNotEmpty) {
      savedUid.value = uuid;
      isRememberMeChecked.value = true;
    }
  }

  Future<void> clearSavedCredentials() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('uuid');
  }



  togglePassword()=> isPasswordHide.value = !isPasswordHide.value;
   void toggleRememberMe() => isRememberMeChecked.value = !isRememberMeChecked.value;

  void toggleCheckBox() {
  isTermsChecked.value = !isTermsChecked.value;

  if (isTermsChecked.value) {
    termsError.value = false;
   
  }
}

void resetForm() {
  nameError.value = "";
  emailError.value = "";
  passwordError.value = "";
  emailErrorMessage.value = "";
  errorMessage.value = "";

  isTermsChecked.value = false;
  termsError.value = false;
  isPasswordHide.value = true;

  formKey.currentState?.reset();
}


  bool validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      emailError.value = "Email is required";
      return false;
    }
    if (!GetUtils.isEmail(value)) {
      emailError.value = "Enter a valid email address";
      return false;
    }
    emailError.value = "";
    return true;
  }

   bool validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      passwordError.value = "Password is required";
      return false;
    }
    if (value.length < 6) {
      passwordError.value = "Password must be at least 6 chars";
      return false;
    }
    passwordError.value = "";
    return true;
  }

  bool validateName(String? value) {
    if (value == null || value.isEmpty) {
      nameError.value = "Full name is required";
      return false;
    }
    nameError.value = "";
    return true;
  }

    bool validateForm(String name, String email, String password) {
    final validName = validateName(name);
    final validEmail = validateEmail(email);
    final validPassword = validatePassword(password);

    if (!isTermsChecked.value) {
      termsError.value = true;
    } else {
      termsError.value = false;
    }

    return validName && validEmail && validPassword && isTermsChecked.value;
  }


  Future<void> signUp(String email, String password, String name,
    ) async {
  isLoading.value = true;
  
  try {
    final user = await AuthServices.instance.signUp(
      email: email,
      password: password,
      name: name,
      
    );
    currentUser.value = user;

    if (user?.uid != null) {
      showCommonSnackbarWidget("Success", 
    "Account Registered Successfully", kBorderColor2, kBorderColor2, kGreenColor3);
      Get.offAllNamed(AppLinks.loginScreen);
      resetForm();
      prettyLogger("Registered");
    }
  } catch (e) {
    errorMessage.value = parseErrorMessage(e);
    showCommonSnackbarWidget("Error", 
    "${errorMessage.value}", kBorderColor2, kBorderColor2, kRedColor);
    prettyLogger("Error creating user: ${errorMessage.value}");
  } finally {
    isLoading.value = false;
  }
}


bool validateEmailAndPassword(String email, String password) {
  bool isValid = true;

  if (email.isEmpty) {
    emailError.value = "Email is required";
    isValid = false;
  } else if (!GetUtils.isEmail(email)) {
    emailError.value = "Enter a valid email address";
    isValid = false;
  } else {
    emailError.value = "";
  }


  if (password.isEmpty) {
    passwordError.value = "Password is required";
    isValid = false;
  } else if (password.length < 6) {
    passwordError.value = "Password must be at least 6 characters";
    isValid = false;
  } else {
    passwordError.value = "";
  }

  return isValid;
}




  Future checkEmailVerified()async{

  }


  


  Future<void> login(String email, String password) async {
    try {
      isLoading.value = true;
      errorMessage.value = "";
      final user = await AuthServices.instance.login(email: email, password: password);
      currentUser.value = user;

      if(currentUser.value!.uid.isNotEmpty){


      if (isRememberMeChecked.value) {
        await saveCredentials(user!.uid);
      } else {
        await clearSavedCredentials();
      }
      Get.offAllNamed(AppLinks.navbarScreen);
      }
    } catch (e) {
       errorMessage.value = parseErrorMessage(e);
       prettyLogger(e);
       showCommonSnackbarWidget("Error", 
    "${errorMessage.value}", kBorderColor2, kBorderColor2, kRedColor);

    } finally {
      isLoading.value = false;
    }
  }

  String parseErrorMessage(dynamic error) {
   
    if (error.toString().contains('email-already-in-use')) {
      return 'This email is already registered.';
    } else if (error.toString().contains('weak-password')) {
      return 'Password is too weak. Use at least 6 characters.';
    } else if (error.toString().contains('invalid-email')) {
      return 'Invalid email format.';
    } else {
      return 'An error occurred. Please try again.';
    }
  }


Future<void> loadCurrentUserDetails() async {
  isLoading.value = true;
  try {
    final uid = currentUser.value?.uid;
    if (uid != null) {
      final userDetails = await AuthServices.instance.fetchCurrentUserDetails(uid);
      currentUser.value = userDetails;
    }
  } catch (e) {
    prettyLogger("Error loading current user: $e");
  } finally {
    isLoading.value = false;
  }
}


  Future<void> logout() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    sp.remove("uuid");
    await AuthServices.instance.logout();
    currentUser.value = null;
    Get.offAllNamed(AppLinks.loginScreen);
  }

  Future<void> loadCurrentUser() async {
    final user = await AuthServices.instance.getCurrentUser();
    currentUser.value = user;
  }
}
