// ignore_for_file: avoid_print, use_build_context_synchronously

import 'package:bazar/core/services/firebase/firebase.dart';
import 'package:bazar/core/utils/colors/maincolors.dart';
import 'package:bazar/core/utils/images/images.dart';
import 'package:bazar/core/utils/validator/validator.dart';
import 'package:bazar/core/widgets/MainBtn.dart';
import 'package:bazar/features/Atef/SignIn/widgets/MainTextField.dart';
import 'package:bazar/features/Atef/SignUp/SignUp.dart';

import 'package:flutter/material.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final _formKeysignin = GlobalKey<FormState>();

  final TextEditingController passwordController = TextEditingController();
  final TextEditingController emailController = TextEditingController();

  final AuthService authentication = AuthService();
  @override
  void dispose() {
    passwordController.dispose();
    emailController.dispose();

    super.dispose();
  }

  void _onSignIp() {
    if (_formKeysignin.currentState!.validate()) {
      authentication.signIn(
        context: context,
        email: emailController.text,
        password: passwordController.text,
      );
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
        key: _formKeysignin,
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
                            "Welcome Back <3",
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
                            "Sign to your account",
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
                    ),
                  ),
                  SizedBox(height: 21),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 6),
                    child: Text(
                      "Password",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 24),
                    child: Maintextfield(
                      hint: 'Your password',
                      pic: Images.frame1,

                      obs: true,
                      validator: AppValidators.password,
                      svg: false,
                      iconss: null,
                      isIcon: false,
                      keyboared: TextInputType.text,
                      controller: passwordController,
                    ),
                  ),
                  const SizedBox(height: 16),

                  GestureDetector(
                    onTap: () {},
                    child: Text(
                      "Forgot Password?",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        color: MainColors.mainPurple,
                      ),
                    ),
                  ),

                  const SizedBox(height: 24),
                  Padding(
                    padding: const EdgeInsets.only(right: 24),
                    child: MainBtm(
                      txt: "Login",
                      onPressed: _onSignIp,
                      radius: 48,
                    ),
                  ),

                  SizedBox(height: 24),
                  Padding(
                    padding: const EdgeInsets.only(right: 24),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          textAlign: TextAlign.center,

                          "Don’t have an account? ",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: Colors.black.withValues(alpha: 0.3),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(builder: (context) => SignUp()),
                            );
                          },
                          child: Text(
                            textAlign: TextAlign.center,

                            " Sign Up",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: MainColors.mainPurple,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 24),

                  Padding(
                    padding: const EdgeInsets.only(right: 24),
                    child: Row(
                      children: [
                        Expanded(
                          child: Divider(thickness: 1, color: Colors.grey),
                        ),

                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 10),
                          child: Text(
                            "Or with",
                            style: TextStyle(color: Colors.grey, fontSize: 14),
                          ),
                        ),

                        Expanded(
                          child: Divider(thickness: 1, color: Colors.grey),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 24),
                  Padding(
                    padding: const EdgeInsets.only(right: 24),
                    child: GestureDetector(
                      child: Image.asset(Images.pic1, fit: BoxFit.cover),
                    ),
                  ),
                  SizedBox(height: 9),
                  Padding(
                    padding: const EdgeInsets.only(right: 24),
                    child: GestureDetector(
                      child: Image.asset(Images.pic2, fit: BoxFit.cover),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
