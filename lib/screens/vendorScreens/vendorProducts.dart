import 'package:flutter/material.dart';

import '../../widgets/vendorWidgets/vendorTabBar.dart';

class VendorProducts extends StatelessWidget {
  const VendorProducts({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black54,
        title: Text("VendorProducts"),
      ),
      body: Column(
        children: const [
          Expanded(child: VendorTabBar()),
        ],
      ),
    );
  }
}
