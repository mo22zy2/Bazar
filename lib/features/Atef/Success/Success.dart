import 'package:bazar/core/services/firebase/firebase.dart';
import 'package:bazar/core/utils/colors/maincolors.dart';
import 'package:bazar/core/utils/images/images.dart';
import 'package:bazar/core/widgets/MainBtn.dart';
import 'package:bazar/features/Ali/HomePage/home_page.dart';
// import 'package:bazar/features/Atef/SignIn/SignIn.dart';
import 'package:flutter/material.dart';

class Success extends StatelessWidget {
  Success({super.key});
  final AuthService authentication = AuthService();

  // void onSignOut(BuildContext context) {
  //   authentication.signOut();
  //   Navigator.pushReplacement(
  //     context,
  //     MaterialPageRoute(builder: (context) => SignIn()),
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MainColors.mainWhite,
      body: SafeArea(
        child: ListView(
          children: [
            SizedBox(height: 209),
            Image.asset(Images.groupps, width: 160, height: 91),
            SizedBox(height: 40),
            Text(
              textAlign: TextAlign.center,
              "Congratulation!",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(
              textAlign: TextAlign.center,
              "your account is complete, please enjoy the best menu from us.",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: Colors.black.withValues(alpha: 0.3),
              ),
            ),
            SizedBox(height: 40),
            Padding(
              padding: const EdgeInsets.all(24),
              child: MainBtm(
                txt: "Get Started",
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => Home_page()),
                  );
                },
                radius: 48,
              ),
            ),
            //    MainBtm(txt: "Sign out", onPressed: () => onSignOut(context), radius: 48),
          ],
        ),
      ),
    );
  }
}
