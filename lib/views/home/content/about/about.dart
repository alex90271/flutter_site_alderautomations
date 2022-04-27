import 'package:alderautomationsdotcom/globals.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:responsive_builder/responsive_builder.dart';

String _aboutText =
    'Hi!\nI\'m Alex Alder\nI am a full stack developer\nspecializing in in Flutter, Python, Java, and Wordpress,\nI also have familiarity with JavaScript, C++, PHP, and am constantly learning more\n\nI am currently working on a POS integrated tip and payroll report generator';

class AboutView extends StatelessWidget {
  const AboutView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      height: size.height * 0.75,
      color: brandBlack,
      child: Align(
        alignment: Alignment.center,
        child: ScreenTypeLayout(
          desktop: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Padding(
                padding: EdgeInsets.fromLTRB(5, 15, 0, 0),
                child: Text(
                  'About',
                  textAlign: TextAlign.center,
                  style: TextStyle(color: brandWhite, fontSize: 24),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ClipOval(
                      child: Image.asset(
                    headShot,
                    height: size.height / 2,
                  )),
                  const SizedBox(
                    width: 50,
                  ),
                  Flexible(
                    child: Text(
                      _aboutText,
                      style: const TextStyle(color: brandWhite, fontSize: 18),
                    ),
                  ),
                ],
              )
            ],
          ),
          mobile: Column(
            children: [
              const Padding(
                padding: EdgeInsets.fromLTRB(5, 15, 0, 0),
                child: Text(
                  'About',
                  textAlign: TextAlign.center,
                  style: TextStyle(color: brandWhite, fontSize: 20),
                ),
              ),
              Column(
                children: [
                  const SizedBox(
                    height: 50,
                  ),
                  ClipOval(
                      child: Image.asset(
                    headShot,
                    height: 225,
                  )),
                  const SizedBox(
                    height: 25,
                  ),
                  Text(
                    _aboutText,
                    style: const TextStyle(color: brandWhite, fontSize: 14),
                    textAlign: TextAlign.center,
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
