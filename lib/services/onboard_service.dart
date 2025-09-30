import 'package:shared_preferences/shared_preferences.dart';

class OnboardingService {


  static final OnboardingService instance = OnboardingService._internal();

  OnboardingService._internal();


  static const String _seenOnboardingKey = "seen_onboarding";

   Future<bool> hasSeenOnboarding() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool(_seenOnboardingKey) ?? false;
  }



   Future<void> setOnboardingSeen() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_seenOnboardingKey, true);
  }
}