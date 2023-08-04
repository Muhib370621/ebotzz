import 'package:ebotzz/widgets/textswidget.dart';
import 'package:flutter/material.dart';

class CustomInputField extends StatelessWidget {
  final TextEditingController controller;
  final label;
  var suffixIcon;
   CustomInputField({Key? key, required this.controller, this.label,this.suffixIcon}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        controller: controller,
        // validator: (value) {
        //   if (value!.isEmpty) {
        //     return "$label is Required";
        //   } else if (!RegExp(r'\S+@\S+\.\S+')
        //       .hasMatch(value)) {
        //     return "Please enter a valid $label";
        //   }
        // },
        // autovalidateMode:
        // AutovalidateMode.onUserInteraction,
        decoration: InputDecoration(
          suffixIcon: suffixIcon,
          contentPadding: EdgeInsets.all(16),
          labelText: label,
          labelStyle: TextStyle(color: Colors.black45),
          enabledBorder: textFieldStyle,
          focusedBorder: textFieldStyle,
          focusedErrorBorder: textFieldStyle,
          errorBorder: errorTextFieldStyle,
        ),
      ),
    );
  }
}
