import 'package:ebotzz/controllers/product_controller.dart';
import 'package:ebotzz/widgets/app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class ViewMoreProduct extends StatelessWidget {
  const ViewMoreProduct({super.key});

  @override
  Widget build(BuildContext context) {
    ProductController productController = Get.put(ProductController());
    return Scaffold(
      body: Container(
        color: Colors.grey.shade900,
        child: SafeArea(
          child: Column(
            children: [
              const CustomAppBar(),
              15.verticalSpace,
              ListView.builder(itemBuilder: (context,index){
                // Container(c)
              })

            ],
          ),
        ),
      ),
    );
  }
}
