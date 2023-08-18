import 'package:flutter/material.dart';

import '../../core/utils/appColors.dart';

class VendorSetting extends StatelessWidget {
  const VendorSetting({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.vendorAppBarColor,
        title: Text("Vendor settings "),
      ),
    );
  }
}
