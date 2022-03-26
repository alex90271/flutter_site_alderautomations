import 'package:alderautomationsdotcom/views/widgets/centerted_view/centerted_view.dart';
import 'package:alderautomationsdotcom/views/widgets/return_button/return_button.dart';
import 'package:flutter/material.dart';
import '../widgets/NavigationBar/navigation_bar.dart';

class ContactView extends StatelessWidget {
  const ContactView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CenteredView(
        child: Column(
          children: const [NaviBar(), Text('contact us'), ReturnButton()],
        ),
      ),
    );
  }
}
