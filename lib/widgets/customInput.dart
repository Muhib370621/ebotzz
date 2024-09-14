import 'package:ebotzz/utils/imports.dart';

class CustomInputField extends StatelessWidget {
  final TextEditingController controller;
  final label;
  bool? isblack;
  var suffixIcon;
   CustomInputField({Key? key, required this.controller, this.label,this.suffixIcon, this.isblack}) : super(key: key);

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
          hintStyle: TextStyle(color: Colors.grey),
          focusColor: Colors.red,
          fillColor: Colors.red,
          alignLabelWithHint: true,
          suffixIcon: suffixIcon,
          contentPadding: EdgeInsets.only(left: 15,top: 5),
          labelText: label,
          labelStyle: TextStyle(color: isblack==null?Colors.black:Colors.white),
          enabledBorder: textFieldStyle,
          focusedBorder: textFieldStyle,
          focusedErrorBorder: textFieldStyle,
          errorBorder: errorTextFieldStyle,
        ),
      ),
    );
  }
}
