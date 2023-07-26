import 'package:ebotzz/utils/imports.dart';
import 'package:ebotzz/widgets/customActionButton.dart';
import 'package:ebotzz/widgets/customInput.dart';
import 'package:ebotzz/widgets/vendorWidgets/vendorTabBar.dart';
import 'package:flutter/material.dart';

class VendorOrders extends StatelessWidget {
  const VendorOrders({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TextEditingController controller = TextEditingController()
    TextEditingController controller = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black54,
        title: Text("Vendor Orders "),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 10.h,),
            CustomInputField(controller: controller,label: "Search orders",),
            Row(
              children: [
                Expanded(child: CustomInputField(controller: controller,label: "Start Date (YY-MM-DD)",)),
                Expanded(child: CustomInputField(controller: controller,label: "End Date (YY-MM-DD)",)),
              ],
            ),
            SizedBox(height: 30.h,),

            CustomActionButton(buttonText: "Apply",isIcon: false,),
            SizedBox(height: 30.h,),

            Container(
              width: 350.w,
              height: 800.h,
              decoration: BoxDecoration(
                  color: Colors.grey.shade400,
                borderRadius: BorderRadius.circular(20)
              ),
              child: Center(child: Text("No orders till now"))

            )
          ],
        ),
      ),



    );
  }
}



