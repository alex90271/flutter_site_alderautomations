import 'dart:developer';
import 'package:alderautomationsdotcom/widgets/footer/footer.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '../../globals.dart';
import 'package:validators/validators.dart';

validSnack(context) =>
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        backgroundColor: brandWhite,
        content: Text(
          'Thank you. Your request has been sent.',
          style: TextStyle(color: brandBlack),
        )));

invalidSnack(context) =>
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        backgroundColor: Colors.red,
        content: Text(
          'The submit function has not yet been implemented\nto contact, please email alex.alder1@gmail.com',
          style: TextStyle(color: brandBlack),
        )));

class TextContactForm extends StatefulWidget {
  const TextContactForm({
    Key? key,
  }) : super(key: key);

  @override
  State<TextContactForm> createState() => _TextContactFormState();
}

class _TextContactFormState extends State<TextContactForm> {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          FormattedTextField(
              initial: '',
              length: 30,
              label: 'First Name',
              helper: 'First Name'),
          FormattedTextField(
            initial: '',
            length: 30,
            label: 'Last Name',
            helper: 'Last Name',
          ),
          FormattedTextField(
            initial: '',
            length: 30,
            label: 'Buisness Name',
            helper: 'Business Name',
          ),
          FormattedPhoneField(
            initial: '',
          ),
          FormattedEmailField(
            initial: '',
          ),
          FormattedTextField(
            initial: '',
            length: 30,
            label: 'Project Type',
            helper: 'Project Type',
          ),
          ElevatedButton(
            //submit button
            style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(brandBlack)),
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                log('valid inputs');
                invalidSnack(context);
                //validSnack(context);
                //TODO submit data
                _formKey.currentState!.reset();
              } else {
                log('invalid inputs');
                invalidSnack(context);
              }
            },
            child: const Text(
              'Submit',
              style: TextStyle(color: brandWhite),
            ),
          ),
        ],
      ),
    );
  }
}

class FormattedTextField extends StatelessWidget {
  String initial;
  int length;
  String label;
  String helper;

  FormattedTextField({
    Key? key,
    required this.initial,
    required this.length,
    required this.label,
    required this.helper,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 350,
      height: 100,
      child: TextFormField(
        validator: (value) {
          if (value!.isNotEmpty) {
            return null;
          } else {
            return value;
          }
        },
        initialValue: initial,
        maxLength: length,
        onChanged: (String value) {
          helper = value + " is invalid";
        },
        textCapitalization: TextCapitalization.characters,
        style: const TextStyle(
          color: brandWhite,
        ),
        decoration: InputDecoration(
          labelText: label,
          counterStyle: const TextStyle(
            color: brandWhite,
          ),
          labelStyle: const TextStyle(
            color: brandWhite,
          ),
          helperText: helper,
          helperStyle: const TextStyle(
            color: brandWhite,
          ),
          hoverColor: brandWhite,
          enabledBorder: const UnderlineInputBorder(
            borderSide: BorderSide(color: brandWhite),
          ),
        ),
      ),
    );
  }
}

class FormattedPhoneField extends StatelessWidget {
  String initial;
  String label;
  String helper;
  int length;

  FormattedPhoneField({
    Key? key,
    required this.initial,
    this.label = "Phone",
    this.helper = "Phone",
    this.length = 10,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 350,
      height: 100,
      child: TextFormField(
        validator: (value) {
          if (value!.isNotEmpty) {
            if (isNumeric(value)) {
              return null;
            }
          } else {
            return value;
          }
        },
        initialValue: initial,
        maxLength: length,
        onChanged: (String value) {
          //log(value);
          helper = value + " is an invalid phone number";
        },
        textCapitalization: TextCapitalization.characters,
        style: const TextStyle(
          color: brandWhite,
        ),
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.fromLTRB(0, 16, 0, 12),
          floatingLabelAlignment: FloatingLabelAlignment.center,
          labelText: label,
          focusColor: brandBlack,
          counterStyle: const TextStyle(
            color: brandWhite,
          ),
          labelStyle: const TextStyle(
            color: brandWhite,
          ),
          helperText: helper,
          helperStyle: const TextStyle(
            color: brandWhite,
          ),
          fillColor: brandWhite,
          hoverColor: brandWhite,
          enabledBorder: const UnderlineInputBorder(
            borderSide: BorderSide(color: brandWhite),
          ),
        ),
      ),
    );
  }
}

class FormattedEmailField extends StatelessWidget {
  String initial;
  String label;
  String helper;
  int length;

  FormattedEmailField({
    Key? key,
    required this.initial,
    this.label = "Email",
    this.helper = "Email",
    this.length = 50,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 350,
      height: 100,
      child: TextFormField(
        validator: (value) {
          if (value!.isNotEmpty) {
            if (isEmail(value)) {
              return null;
            }
          } else {
            return value;
          }
        },
        initialValue: initial,
        maxLength: length,
        onChanged: (String value) {
          //log(value);
          helper = value + " is an invalid email";
        },
        textCapitalization: TextCapitalization.characters,
        style: const TextStyle(
          color: brandWhite,
        ),
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.fromLTRB(0, 16, 0, 12),
          floatingLabelAlignment: FloatingLabelAlignment.center,
          labelText: label,
          focusColor: brandBlack,
          counterStyle: const TextStyle(
            color: brandWhite,
          ),
          labelStyle: const TextStyle(
            color: brandWhite,
          ),
          helperText: helper,
          helperStyle: const TextStyle(
            color: brandWhite,
          ),
          fillColor: brandWhite,
          hoverColor: brandWhite,
          enabledBorder: const UnderlineInputBorder(
            borderSide: BorderSide(color: brandWhite),
          ),
        ),
      ),
    );
  }
}

class FormattedDateField extends StatelessWidget {
  String initial;
  String label;
  String helper;
  int length;

  FormattedDateField({
    Key? key,
    required this.initial,
    this.label = "Date",
    this.helper = "(Ex. April 9 2022)",
    this.length = 15,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 350,
      height: 100,
      child: TextFormField(
        validator: (value) {
          if (value!.isNotEmpty) {
            if (isDate(value)) {
              return value;
            }
          }
        },
        initialValue: initial,
        maxLength: length,
        onChanged: (String value) {
          //log(value);
        },
        textCapitalization: TextCapitalization.characters,
        style: const TextStyle(
          color: brandWhite,
        ),
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.fromLTRB(0, 16, 0, 12),
          floatingLabelAlignment: FloatingLabelAlignment.center,
          labelText: label,
          focusColor: brandBlack,
          counterStyle: const TextStyle(
            color: brandWhite,
          ),
          labelStyle: const TextStyle(
            color: brandWhite,
          ),
          helperText: helper,
          helperStyle: const TextStyle(
            color: brandWhite,
          ),
          fillColor: brandWhite,
          hoverColor: brandWhite,
          enabledBorder: const UnderlineInputBorder(
            borderSide: BorderSide(color: brandWhite),
          ),
        ),
      ),
    );
  }
}
