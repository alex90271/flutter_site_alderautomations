import 'package:alderautomationsdotcom/views/widgets/centerted_view/centerted_view.dart';
import 'package:alderautomationsdotcom/views/widgets/projects_box/projects_box.dart';
import 'package:alderautomationsdotcom/views/widgets/return_button/return_button.dart';
import 'package:flutter/material.dart';
import '../widgets/NavigationBar/navigation_bar.dart';
import 'package:alderautomationsdotcom/globals.dart';

class ProjectsView extends StatelessWidget {
  const ProjectsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: brandWhite,
      body: CenteredView(
        child: Column(
          children: const <Widget>[
            NaviBar(),
            ProjectsInfoBox(
                title: 'Custom Wordpress Websites',
                desc:
                    'Build your own wordpress website, with easy access to an admin panel for custom conent editing'),
            ProjectsInfoBox(
                title: 'Custom Flutter Applications',
                desc:
                    'Custom flutter Applications \nCompatible with both iOS, Android, Web, and more'),
            ProjectsInfoBox(
                title: 'Custom Python Scripts',
                desc:
                    'Create custom python scripts to help organize or automate your data'),
            ReturnButton()
          ],
        ),
      ),
    );
  }
}
