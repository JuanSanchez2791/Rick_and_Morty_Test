import 'package:flutter/material.dart';
import 'package:rick_and_morty_test/components/rounded_buttom.dart';
import 'package:rick_and_morty_test/screens/login/login_screen.dart';
import 'package:rick_and_morty_test/screens/signup/signup_screen.dart';


class LoginRegisterButtons extends StatelessWidget {
  const LoginRegisterButtons({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          const SizedBox(
            height: 20,
          ),
          RoundedButton(
              label: "LOG IN",
              onPressed: () {
                Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const LogInScreen()),
                    (route) => false);
              }),
          const SizedBox(
            height: 10,
          ),
          RoundedButton(
              label: "SIGN UP",
              onPressed: () {
                Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const SignUpScreen()),
                    (route) => false);
              }),
        ],
      ),
    );
  }
}
