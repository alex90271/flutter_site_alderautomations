import 'package:alderautomationsdotcom/globals.dart';
import 'package:alderautomationsdotcom/views/widgets/calendar/calendar.dart';
import 'package:alderautomationsdotcom/views/widgets/centerted_view/centerted_view.dart';
import 'package:alderautomationsdotcom/views/widgets/return_button/return_button.dart';
import 'package:flutter/material.dart';
import '../widgets/NavigationBar/navigation_bar.dart';

const squareapp =
    " <!-- Start Square Appointments Embed Code --><script src='https://squareup.com/appointments/buyer/widget/be8krbfi80p3h4/GEHYJQKV3K0K5.js'></script><!-- End Square Appointments Embed Code --> ";

class ContactView extends StatelessWidget {
  const ContactView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Column(
        children: [
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text('Contact Us'),
          ),
          Column(
            children: [
              Row(
                children: const [
                  TextContactForm(
                    label: 'First Name',
                    initial: '',
                    helper: '',
                  ),
                  TextContactForm(
                    label: 'Last Name',
                    initial: '',
                    helper: '',
                  ),
                  TextContactForm(
                    label: 'Buisness Name',
                    initial: '',
                    helper: '',
                  )
                ],
              ),
              Row(
                children: const [
                  TextContactForm(
                    label: 'Phone Number',
                    initial: '',
                    helper: '',
                    length: 10,
                  ),
                  TextContactForm(
                    label: 'Email',
                    initial: '',
                    helper: '',
                  ),
                ],
              ),
              const DateFeild(
                label: 'Date',
                initial: '',
                helper: '',
              )
            ],
          ),
        ],
      ),
    );
  }
}

class DateFeild extends StatefulWidget {
  final label;
  final initial;
  final helper;
  final length;

  const DateFeild({
    Key? key,
    this.label,
    this.initial,
    this.helper,
    this.length = 50,
  }) : super(key: key);

  @override
  State<DateFeild> createState() => _DateFeildState();
}

class _DateFeildState extends State<DateFeild> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: SizedBox(
            width: 350,
            child: TextFormField(
              initialValue: widget.initial,
              maxLength: widget.length,
              decoration: InputDecoration(
                labelText: widget.label,
                labelStyle: const TextStyle(
                  color: brandBlack,
                ),
                helperText: widget.helper,
                enabledBorder: const UnderlineInputBorder(
                  borderSide: BorderSide(color: brandBlue),
                ),
              ),
            ),
          ),
        ),
        const CalendarWidget()
      ],
    );
  }
}

class TextContactForm extends StatefulWidget {
  final initial;
  final label;
  final length;
  final helper;
  const TextContactForm(
      {Key? key,
      required this.initial,
      required this.label,
      required this.helper,
      this.length = 30})
      : super(key: key);

  @override
  State<TextContactForm> createState() => _TextContactFormState();
}

class _TextContactFormState extends State<TextContactForm> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: SizedBox(
            width: 350,
            child: TextFormField(
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter some text';
                }
                return null;
              },
              initialValue: widget.initial,
              maxLength: widget.length,
              decoration: InputDecoration(
                labelText: widget.label,
                labelStyle: const TextStyle(
                  color: brandBlack,
                ),
                helperText: widget.helper,
                enabledBorder: const UnderlineInputBorder(
                  borderSide: BorderSide(color: brandBlue),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
