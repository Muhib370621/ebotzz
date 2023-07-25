// ignore_for_file: prefer_const_constructors, prefer_const_constructors_in_immutables, use_key_in_widget_constructors

import 'package:ebotzz/utils/imports.dart';

class DrawercustomHeader extends StatelessWidget {
  DrawercustomHeader({required this.icon});
  final Widget icon;

  @override
  Widget build(BuildContext context) {
    return UserAccountsDrawerHeader(
        decoration: BoxDecoration(color: Color(0xffE41E5C)),
        accountName: Text('Talha Rana'),
        accountEmail: Text('mtalharana@gmail.com'),
        arrowColor: Colors.black,
        currentAccountPicture: CircleAvatar(
          backgroundColor: Colors.white,
          child: icon,
        ));
  }
}
