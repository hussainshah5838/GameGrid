import 'package:game_grid/view/screens/auth/login/login.dart';
import 'package:game_grid/view/screens/auth/register/register.dart';
import 'package:game_grid/view/screens/bottom_nav_bar/bottom_nav_bar.dart';
import 'package:game_grid/view/screens/launch/onboarding.dart';
import 'package:get/get.dart';

import '../../view/screens/launch/splash_screen.dart';

class AppRoutes {
  static final List<GetPage> pages = [
    GetPage(
      name: AppLinks.splash_screen,
      page: () => SplashScreen(),
    ),
    GetPage(
      name: AppLinks.onBoardingScreen,
      page: () => Onboarding(),
    ),
    GetPage(
      name: AppLinks.loginScreen,
      page: () => Login(),
    ),
    GetPage(
      name: AppLinks.signupScreen,
      page: () => Register(),
    ),
    GetPage(
      name: AppLinks.navbarScreen,
      page: () => BottomNavBar(),
    ),
  ];
}

class AppLinks {
  static const splash_screen = '/splash_screen';
  static const onBoardingScreen = '/onBoardingScreen';
  static const loginScreen = '/loginScreen';
  static const signupScreen = '/signupScreen';
  static const navbarScreen = '/navbarScreen';
}
