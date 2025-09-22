import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:game_grid/config/bindings.dart';
import 'package:game_grid/config/routes/routes.dart';
import 'package:game_grid/firebase_options.dart';
import 'package:get/get.dart';
import 'config/theme/light_theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
);
  runApp(MyApp());
}

String dummyImg =
    'https://i.pinimg.com/736x/2e/e3/73/2ee373e5d634ffa3a6a99ea6a6e8b5a0.jpg';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      debugShowMaterialGrid: false,
      title: 'Game Grid',
      theme: lightTheme,
      themeMode: ThemeMode.light,
      initialRoute: AppLinks.splash_screen,
      getPages: AppRoutes.pages,
      defaultTransition: Transition.fadeIn,
      initialBinding: AppBindings(),
    );
  }
}
