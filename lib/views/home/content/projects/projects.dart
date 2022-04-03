import 'package:alderautomationsdotcom/globals.dart';
import 'package:alderautomationsdotcom/widgets/centerted_view/centerted_view.dart';
import 'package:alderautomationsdotcom/widgets/projects_box/projects_box.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;

class ProjectsView extends StatefulWidget {
  const ProjectsView({Key? key}) : super(key: key);

  @override
  _ProjectsViewState createState() => _ProjectsViewState();
}

class _ProjectsViewState extends State<ProjectsView>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      value: 0.0,
      duration: const Duration(seconds: 25),
      upperBound: 1,
      lowerBound: -1,
      vsync: this,
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return AnimatedBuilder(
      animation: _controller,
      builder: (BuildContext context, Widget? child) {
        return ClipPath(
            clipper: DrawClip(_controller.value),
            child: Container(
              decoration: const BoxDecoration(
                color: brandBlue,
              ),
              height: size.height * 0.85,
              child: CenteredView(
                child: Stack(children: [
                  SizedBox(
                    child: Column(
                      children: const <Widget>[
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
                      ],
                    ),
                  ),
                ]),
              ),
            ));
      },
    );
  }
}

class DrawClip extends CustomClipper<Path> {
  double move = 0;
  double slice = math.pi;
  DrawClip(this.move);
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(0, size.height * 0.95);
    double xCenter =
        size.width * 0.5 + (size.width * 0.6 + 1) * math.sin(move * slice);
    double yCenter = size.height * 0.95 + 69 * math.cos(move * slice);
    path.quadraticBezierTo(xCenter, yCenter, size.width, size.height * 0.95);

    path.lineTo(size.width, 0);
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}
