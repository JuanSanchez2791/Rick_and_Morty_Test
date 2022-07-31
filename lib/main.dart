import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:rick_and_morty_test/screens/home/home_screen.dart';
import 'package:rick_and_morty_test/services/auth/authentication_service.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  AuthenticationService.intializeService();
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarIconBrightness: Brightness.dark,
      statusBarColor: Colors.transparent));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(scaffoldBackgroundColor: Colors.blue.shade900),
      home: const HomeScreen(),
    );
  }
}
