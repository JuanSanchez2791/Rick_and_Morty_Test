import 'package:flutter/material.dart';
import 'package:rick_and_morty_test/components/mobile_layout.dart';
import 'package:rick_and_morty_test/components/responsive_layout.dart';
import 'login_register_buttons.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ResponsiveLayout(
        mobileChild: MobileLayout(
          imageWidget: Image.asset(
            "assets/img/rick_and_morty_logo.png",
            height: 100,
          ),
          dataWidget: const LoginRegisterButtons(),
        ));
  }
}