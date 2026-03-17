import 'package:bazar/features/Atef/Splach_screen.dart';

import 'package:bazar/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:bazar/features/islam/set_location/widgets/address_controller.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AddressController()),
      ],
      child: MaterialApp(
        theme: ThemeData(fontFamily: "OpenSans"),
        debugShowCheckedModeBanner: false,
        home: SplashScreen(),
      ),
    );
  }
}
