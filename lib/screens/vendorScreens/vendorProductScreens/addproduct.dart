import 'dart:io';

import 'package:ebotzz/utils/imports.dart';
import 'package:ebotzz/widgets/customActionButton.dart';
import 'package:ebotzz/widgets/customInput.dart';
import 'package:ebotzz/widgets/jobFilterContainer.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class AddProduct extends StatefulWidget {
  const AddProduct({Key? key}) : super(key: key);

  @override
  State<AddProduct> createState() => _AddProductState();
}

class _AddProductState extends State<AddProduct> {

  File? _image;
  _pickImageFromCamera() async {
    final imagePicker = ImagePicker();
    final image = await imagePicker.pickImage(
      source: ImageSource.camera,
      preferredCameraDevice: CameraDevice.front,
    );
    setState(() {
      _image = File(image!.path);
    });
  }
  @override
  Widget build(BuildContext context) {
    ProductController productController = Get.put(ProductController());
    TextEditingController controllerName = TextEditingController();
    TextEditingController controller = TextEditingController();
    TextEditingController controllerType = TextEditingController();
    TextEditingController controllerRegularPrice= TextEditingController();
    TextEditingController controllerDescription = TextEditingController();
    TextEditingController controllerShortDescription = TextEditingController();

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
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
            Center(child: CustomActionButton(buttonText: "Apply",isIcon: false, isLoading: false,)),
            SizedBox(height: 20.h,),


            SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      border: Border.all(color: Colors.black45)
                  ),
                  child: Column(
                    children: [
                      SizedBox(height: 50.h,),
                      Center(
                        child: InkWell(
                          onTap: (){
                            _pickImageFromCamera();
                          },
                          child: Container(
                            width: 200.w,
                            height: 200.h,
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.grey.shade800),
                                borderRadius: BorderRadius.circular(15)),
                            child: Center(
                              child: Column(
                                children: [
                                  SizedBox(
                                    height: 20.h,
                                  ),
                                  Text(
                                    "Add Image",
                                    style: TextStyle(fontSize: 24.sp),
                                  ),
                                  SizedBox(
                                    height: 20.h,
                                  ),
                                  Icon(
                                    Icons.image,
                                    size: 48.sp,
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      CustomInputField(
                        controller: controllerName,
                        label: "Enter the name of product",
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      CustomInputField(
                        controller: controllerType,
                        label: "Enter the type of product",
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      CustomInputField(
                        controller: controllerRegularPrice,
                        label: "Enter the price of product",
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      CustomInputField(
                        controller: controllerDescription,
                        label: "Enter the description of product",
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      CustomInputField(
                        controller: controllerShortDescription,
                        label: "Enter the short description of product",
                      ),
                      SizedBox(height: 20.h,),
                      CustomActionButton(buttonText: "Create", isLoading: false,isIcon: false,onTap: (){

                        productController.createProduct(controllerName.text, controllerType.text, controllerRegularPrice.text,
                            controllerDescription.text, controllerShortDescription.text,
                            "http://demo.woothemes.com/woocommerce/wp-content/uploads/sites/56/2013/06/T_2_front.jpg"
                        );
                      },),
                      SizedBox(height: 20.h,),

                    ],
                  ),
                ),
              ),
            ),

          ],
        ),
      ),
    );
  }
}
