import 'package:flutter/material.dart';

class SocialMediaButtons extends StatelessWidget {
  const SocialMediaButtons({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        children: [
          Row(
            children: const [
              Expanded(
                  child: Divider(
                    color: Colors.black,
                  )),
              Text(" OR Continue with "),
              Expanded(
                  child: Divider(
                    color: Colors.black,
                  )),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              InkWell(
                onTap: () {},
                child: Image.asset(
                  "assets/img/google_logo.png",
                  width: 30,
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              /*InkWell(
                onTap: () {},
                child: Image.asset(
                  "assets/img/facebook_logo.png",
                  width: 30,
                ),
              ),*/
            ],
          )
        ],
      ),
    );
  }
}