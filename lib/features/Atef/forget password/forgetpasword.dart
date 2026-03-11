import 'package:bazar/core/services/firebase/firebase.dart';
import 'package:bazar/core/utils/colors/maincolors.dart';
import 'package:bazar/core/utils/images/images.dart';
import 'package:bazar/core/utils/validator/validator.dart';
import 'package:bazar/core/widgets/MainBtn.dart';
import 'package:bazar/features/Atef/SignIn/SignIn.dart';
import 'package:bazar/features/Atef/SignIn/widgets/MainTextField.dart';
import 'package:flutter/material.dart';

class Forgetpasword extends StatefulWidget {
  const Forgetpasword({super.key});

  @override
  State<Forgetpasword> createState() => _ForgetpaswordState();
}

class _ForgetpaswordState extends State<Forgetpasword> {
  final TextEditingController emailController = TextEditingController();
  final _formKeyforgert = GlobalKey<FormState>();
  String? errorMessage;

  @override
  void dispose() {
    emailController.dispose();

    super.dispose();
  }

  void _forgetpassword() async {
    if (_formKeyforgert.currentState!.validate()) {
      final error = await AuthService().resetPassword(
        email: emailController.text,
      );

      if (error != null) {
        setState(() {
          errorMessage = error;
        });
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text("Check your email!"),
            backgroundColor: Colors.green,
            duration: Duration(seconds: 2),
          ),
        );

        Future.delayed(const Duration(seconds: 2), () {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (_) => const SignIn()),
          );
        });
      }
    }
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MainColors.mainWhite,
      appBar: AppBar(backgroundColor: MainColors.mainWhite),
      body: Form(
        key: _formKeyforgert,
        child: SafeArea(
          child: SizedBox(
            width: double.infinity,
            child: Padding(
              padding: const EdgeInsets.only(left: 24),
              child: ListView(
                children: [
                  Column(
                    children: [
                      Row(
                        children: [
                          Text(
                            "Don't worry Reset it!",
                            style: TextStyle(
                              fontSize: 26,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 10),

                      Row(
                        children: [
                          Text(
                            "Reset Your Password",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w500,
                              color: Colors.black.withValues(alpha: 0.3),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),

                  SizedBox(height: 24),

                  Padding(
                    padding: const EdgeInsets.only(bottom: 6),
                    child: Text(
                      "Email",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 24),
                    child: Maintextfield(
                      hint: 'Your email',
                      pic: Images.frame1,
                      obs: false,
                      validator: AppValidators.email,
                      svg: true,
                      isIcon: false,
                      iconss: null,
                      keyboared: TextInputType.emailAddress,
                      controller: emailController,
                      errorText: errorMessage,
                    ),
                  ),
                  SizedBox(height: 21),

                  const SizedBox(height: 16),

                  const SizedBox(height: 24),
                  Padding(
                    padding: const EdgeInsets.only(right: 24),
                    child: MainBtm(
                      txt: "Forget Password",
                      onPressed: _forgetpassword,
                      radius: 48,
                    ),
                  ),

                  SizedBox(height: 24),

                  SizedBox(height: 24),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
