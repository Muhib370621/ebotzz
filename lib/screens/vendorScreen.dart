import 'package:ebotzz/utils/imports.dart';
import 'package:ebotzz/widgets/vendorTabBar.dart';
import 'package:flutter/material.dart';

class VendorScreen extends StatelessWidget {
  const VendorScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child:Column(
          children: const [
            CustomAppBar(),
            SizedBox(height: 10,),
            Expanded(child: VendorTabBar())
          ],
        ),
      ),
    );
  }
}
