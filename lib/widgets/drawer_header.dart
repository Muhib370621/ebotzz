// ignore_for_file: prefer_const_constructors, prefer_const_constructors_in_immutables, use_key_in_widget_constructors

import 'package:ebotzz/controllers/signUpController.dart';
import 'package:ebotzz/utils/imports.dart';

class DrawercustomHeader extends StatelessWidget {
  DrawercustomHeader({required this.icon});
  final Widget icon;

  @override
  Widget build(BuildContext context) {
    final SignUpController signUpController = Get.put(SignUpController());

    return UserAccountsDrawerHeader(
        decoration: BoxDecoration(color: Color(0xffE41E5C)),
        accountName: Text(signUpController.nameController.value.text),
        accountEmail: Text(signUpController.emailController.value.text),
        arrowColor: Colors.black,
        currentAccountPicture: CircleAvatar(
          backgroundColor: Colors.white,
          child: icon,
        ));
  }
}
