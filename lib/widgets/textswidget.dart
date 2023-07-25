// ignore_for_file: prefer_const_constructors

import '../utils/imports.dart';

class BoldText extends StatelessWidget {
  const BoldText({Key? key, required this.text}) : super(key: key);
  final String text;
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: 25.sp,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}

class SimpleText extends StatelessWidget {
  const SimpleText({Key? key, required this.text}) : super(key: key);
  final String text;
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: TextAlign.center,
      style: TextStyle(fontSize: 16.sp, height: 1.5),
    );
  }
}

const h1Style = TextStyle(
    fontSize: 28,
    color: Colors.black,
    fontFamily: "Montserrat-VariableFont_wght.ttf",
    fontWeight: FontWeight.bold);

const h2Style = TextStyle(
    fontFamily: "Montserrat-VariableFont_wght.ttf",
    fontSize: 18,
    fontWeight: FontWeight.w500,
    color: Colors.black);

const h3Style = TextStyle(
    fontFamily: "Montserrat-VariableFont_wght.ttf",
    fontSize: 13,
    color: Colors.black);

const h4Style = TextStyle(
    fontFamily: "Montserrat-VariableFont_wght.ttf",
    fontSize: 13,
    color: Colors.black);

final textFieldStyle = OutlineInputBorder(
  borderRadius: BorderRadius.circular(25),
  borderSide: BorderSide(color: Colors.black, width: 1.0),
);
final errorTextFieldStyle = OutlineInputBorder(
    borderRadius: BorderRadius.circular(25),
    borderSide: BorderSide(color: Colors.red, width: 1));
