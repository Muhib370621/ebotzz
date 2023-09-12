import 'package:ebotzz/utils/imports.dart';
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
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
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
          hintStyle: TextStyle(color: Colors.white),
          focusColor: Colors.red,
          fillColor: Colors.red,
          alignLabelWithHint: true,
          suffixIcon: suffixIcon,
          contentPadding: EdgeInsets.only(left: 15,top: 5),
          labelText: label,
          labelStyle: TextStyle(color: Colors.white),
          enabledBorder: textFieldStyle,
          focusedBorder: textFieldStyle,
          focusedErrorBorder: textFieldStyle,
          errorBorder: errorTextFieldStyle,
        ),
      ),
    );
  }
}
