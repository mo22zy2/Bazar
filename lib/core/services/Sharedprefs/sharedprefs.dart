import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefs {
  static Future<bool> getSignedin() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool("isSignin") ?? false;
  }

  static Future<void> setsignIn() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool("isSignin", true);
  }

  // Future<bool> isFirstTime() async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   return prefs.getBool("firstTime") ?? true;
  // }

  // Future<void> setFirstTimeFalse() async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   await prefs.setBool("firstTime", false);
  // }
}
