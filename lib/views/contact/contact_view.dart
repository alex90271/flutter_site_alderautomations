import 'package:alderautomationsdotcom/views/widgets/centerted_view/centerted_view.dart';
import 'package:alderautomationsdotcom/views/widgets/return_button/return_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import '../widgets/NavigationBar/navigation_bar.dart';

const squareapp =
    " <!-- Start Square Appointments Embed Code --><script src='https://squareup.com/appointments/buyer/widget/be8krbfi80p3h4/GEHYJQKV3K0K5.js'></script><!-- End Square Appointments Embed Code --> ";

class ContactView extends StatelessWidget {
  const ContactView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CenteredView(
        child: Column(
          children: [
            const NaviBar(),
            const Text('contact us'),
            const ReturnButton(),
            Html(data: squareapp)
          ],
        ),
      ),
    );
  }
}
