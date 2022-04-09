import 'package:alderautomationsdotcom/globals.dart';
import 'package:alderautomationsdotcom/widgets/centerted_view/centerted_view.dart';
import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

class AboutView extends StatelessWidget {
  const AboutView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      height: size.height * 0.75,
      color: brandBlack,
      child: CenteredView(
        child: Align(
          alignment: Alignment.center,
          child: ScreenTypeLayout(
            desktop: Column(
              children: [
                const Padding(
                  padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
                  child: Text(
                    'About',
                    textAlign: TextAlign.center,
                    style: TextStyle(color: brandWhite, fontSize: 24),
                  ),
                ),
                Row(
                  children: [
                    ClipOval(
                        child: Image.asset(
                      'headshot.jpeg',
                      height: size.height / 2,
                    )),
                    const SizedBox(
                      width: 50,
                    ),
                    const Expanded(
                      child: Text(
                        'Hello\nmy name is Alex Alder \nI am a full stack developer I specialize in Flutter, Python, Java, and Wordpress, with familiarity with JavaScript, C++, PHP, and am constantly excited to learn more ',
                        style: TextStyle(color: brandWhite, fontSize: 18),
                      ),
                    ),
                  ],
                )
              ],
            ),
            mobile: Column(
              children: [
                const Padding(
                  padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
                  child: Text(
                    'About',
                    textAlign: TextAlign.center,
                    style: TextStyle(color: brandWhite, fontSize: 24),
                  ),
                ),
                Column(
                  children: [
                    SizedBox(
                      height: 50,
                    ),
                    ClipOval(
                        child: Image.asset(
                      'headshot.jpeg',
                      height: 275,
                    )),
                    const Text(
                      'Hello\nmy name is Alex Alder \nI am a full stack developer I specialize in Flutter, Python, Java, and Wordpress, with familiarity with JavaScript, C++, PHP, and am constantly excited to learn more ',
                      style: TextStyle(color: brandWhite, fontSize: 18),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
