// import 'package:bazar/features/islam/Confirm_Order/Confirm_Order_visaAdded.dart';
import 'package:bazar/features/Atef/Splach_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(fontFamily: "OpenSans"),
      debugShowCheckedModeBanner: false,
      // home: ConfirmOrderVisaadded(),
      home: SplashScreen(),
    );
  }
}
