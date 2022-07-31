import 'package:flutter/material.dart';
import 'package:rick_and_morty_test/screens/home/home_screen.dart';
import 'package:rick_and_morty_test/screens/listviews/characters_listview.dart';
import 'package:rick_and_morty_test/services/auth/authentication_service.dart';

class LandingScreen extends StatefulWidget {
  const LandingScreen({Key? key}) : super(key: key);

  @override
  _LandingScreenState createState() => _LandingScreenState();
}

class _LandingScreenState extends State<LandingScreen> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const SizedBox(
            height: 20,
          ),
          SizedBox(
            height: 150,
            child: Column(
              children: [
                SizedBox(
                  height: 100,
                  child: Image.asset(
                    "assets/img/rick_and_morty_logo.png",
                  ),
                ),
                Stack(
                  children: [
                    Center(
                      child: SizedBox(
                      height: 40,
                      child: Text(
                        'Hello ${AuthenticationService().getUserName()}',
                        style: const TextStyle(fontSize: 35, color: Colors.white),
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        IconButton(onPressed: () {
                        AuthenticationService().signOut().then((value) {
                          Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const HomeScreen()
                              ),
                                  (route) => false);
                        });
                      },
                          icon: const Icon(Icons.logout),
                          color: Colors.white,
                      ),
                      ]
                    ),
                  ]
                ),
              ],
            ),
          ),
          SizedBox(
            height: 500,
            child: DefaultTabController(
            length: _tabs.length,
            child: const Scaffold(
              body: TabBarView(
                children: [
                  CharacterListView(),
                ],
              ),
            ),
        ),
          ),
        ]
      ),
    );
  }
}

final _tabs = [
  'CHARACTER',
  ];