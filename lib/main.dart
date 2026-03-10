import 'package:bazar/features/Atef/Splach_screen.dart';
import 'package:bazar/features/islam/set_location/widgets/address_controller.dart';
import 'package:bazar/features/islam/Confirm_Order/Confirm_Order_visaAdded.dart';
import 'package:bazar/features/islam/My_Cart/my_cart.dart';
import 'package:bazar/firebase_options.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => AddressController(),
      child: MaterialApp(
        theme: ThemeData(fontFamily: "OpenSans"),
        debugShowCheckedModeBanner: false,
        home: SplashScreen(),
      ),
    );
  }
}
