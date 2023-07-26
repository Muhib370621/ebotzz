import 'package:ebotzz/utils/imports.dart';
import 'package:ebotzz/widgets/customActionButton.dart';
import 'package:ebotzz/widgets/customInput.dart';
import 'package:ebotzz/widgets/jobFilterContainer.dart';
import 'package:flutter/material.dart';

class AddProduct extends StatelessWidget {
  const AddProduct({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController controller = TextEditingController();
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 20.h,),
          Padding(
            padding: const EdgeInsets.only(left: 12),
            child: Text("Add New Products",
              style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black,fontSize: 24.sp),),
          ),
          CustomInputField(controller: controller,label:"Search Products",),
          SizedBox(height: 15.h,),
          Padding(
            padding: const EdgeInsets.only(left: 12),
            child: Text("Filter your search:",style: TextStyle(color: Colors.black38,fontSize: 20),),
          ),
          SizedBox(height: 17.h,),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5),
              child: Row(
                // mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Icon(Icons.filter_list_off_outlined,color: Colors.black54,),
                  SizedBox(width: 5.w,),
                  JobFilterContainer(label: "All Dates"),
                  SizedBox(width: 5.w,),
                  JobFilterContainer(label: "Select Category"),
                  SizedBox(width: 5.w,),
                  JobFilterContainer(label: "Product type"),
                  SizedBox(width: 5.w,),
                  JobFilterContainer(label: "Bulk Actions"),
                ],
              ),
            ),
          ),
          SizedBox(height: 25.h,),
          Center(child: CustomActionButton(buttonText: "Apply",isIcon: false,))

        ],
      ),
    );
  }
}
