import 'package:flutter/material.dart';
import 'package:rick_and_morty_test/components/mobile_layout.dart';
import 'package:rick_and_morty_test/components/responsive_layout.dart';
import 'package:rick_and_morty_test/screens/signup/signup_form.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ResponsiveLayout(
        mobileChild: MobileLayout(
          imageWidget: Image.asset(
            "assets/img/rick_and_morty_logo.png",
            height: 100,
          ),
          dataWidget: SignUpForm(),
        ));
  }
}