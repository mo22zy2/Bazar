import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefs {
  static const String key = "isSignin";

  static Future<bool> getSignedin() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool(key) ?? false;
  }

  static Future<void> setsignIn() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(key, true);
  }

  static Future<void> logout() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(key, false);
  }

  static Future<void> clear() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.clear();
  }
  static Future<bool> getOnBoarding() async {
  final prefs = await SharedPreferences.getInstance();
  return prefs.getBool("seenOnboarding") ?? false;
}

static Future<void> setOnBoarding() async {
  final prefs = await SharedPreferences.getInstance();
  await prefs.setBool("seenOnboarding", true);
}
}
