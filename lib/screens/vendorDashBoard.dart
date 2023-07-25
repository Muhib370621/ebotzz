import 'package:flutter/material.dart';

class VendorDashBoard extends StatelessWidget {
  const VendorDashBoard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Vendor Dashboard"
        ),
      ),
    );
  }
}
