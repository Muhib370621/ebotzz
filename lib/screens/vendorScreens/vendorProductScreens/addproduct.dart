import 'dart:io';

import 'package:dotted_border/dotted_border.dart';
import 'package:ebotzz/utils/imports.dart';
import 'package:ebotzz/utils/prompts.dart';
import 'package:ebotzz/widgets/customActionButton.dart';
import 'package:ebotzz/widgets/customInput.dart';
import 'package:ebotzz/widgets/jobFilterContainer.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class AddProduct extends StatefulWidget {
  const AddProduct({Key? key}) : super(key: key);

  @override
  State<AddProduct> createState() => _AddProductState();
}

class _AddProductState extends State<AddProduct> {

  pickImageFromCamera() async {
    // final RiggerController riggerController = Get.put(RiggerController());
    final imagePicker = ImagePicker();
    final image = await imagePicker.pickImage(
      source: ImageSource.camera,
      preferredCameraDevice: CameraDevice.front,
    );
    // String userID = LocalStorage.readString(
    //     key: LocalStorageKeys.userID)
    //     .toString();
    _uploadImage(File(image!.path));
    setState(() {
      selectedImages.add(File(image!.path));
      // riggerController.uploadImage(
      //   userID,
      //   File(image.path),
      // );
      // _image1 = File(image!.path);
      // imageController.image.value = _image;
    });
  }

  List<File> selectedImages = [];
  List<String> imagePaths = [];
  final picker = ImagePicker();

  Future getImages() async {
    // final RiggerController riggerController = Get.put(RiggerController());
    String uniqueFileName = DateTime.now().millisecondsSinceEpoch.toString();

    /*Step 2: Upload to Firebase storage*/
    //Install firebase_storage
    //Import the library

    //Get a reference to storage root
    Reference referenceRoot = FirebaseStorage.instance.ref();
    Reference referenceDirImages = referenceRoot.child('images');

    //Create a reference for the image to be stored
    Reference referenceImageToUpload = referenceDirImages.child(uniqueFileName);
    final pickedFile = await picker.pickMultiImage(
        imageQuality: 100, maxHeight: 1000, maxWidth: 1000);
    List<XFile> xfilePick = pickedFile;
    // String userID = LocalStorage.readString(
    //     key: LocalStorageKeys.userID)
    //     .toString();

    setState(
          () async {
        if (xfilePick.isNotEmpty) {
          for (var i = 0; i < xfilePick.length; i++) {
            await referenceImageToUpload.putFile(
              File(
                xfilePick[i].path,
              ),
            );
            //Success: get the download URL
            setState(() async {
              imageUrl = await referenceImageToUpload.getDownloadURL();
              imagePaths.add(imageUrl!);
              print(imageUrl);
            });
            // riggerController.uploadImage(
            //   userID,
            //   File(xfilePick[i].path),
            // );
            selectedImages.add(File(xfilePick[i].path));
          }
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Nothing is selected')));
        }
      },
    );
  }

  String? imageUrl;
  Future<void> _uploadImage(File file) async {
    if (selectedImages.isNotEmpty) {
      try {
        String uniqueFileName = DateTime.now().millisecondsSinceEpoch.toString();

        /*Step 2: Upload to Firebase storage*/
        //Install firebase_storage
        //Import the library

        //Get a reference to storage root
        Reference referenceRoot = FirebaseStorage.instance.ref();
        Reference referenceDirImages = referenceRoot.child('images');

        //Create a reference for the image to be stored
        Reference referenceImageToUpload = referenceDirImages.child(uniqueFileName);
        await referenceImageToUpload.putFile(
          File(
            file.path,
          ),
        );
        //Success: get the download URL
        setState(() async {
          imageUrl = await referenceImageToUpload.getDownloadURL();
          print(imageUrl);
        });
        // final Reference ref =
        // FirebaseStorage.instance.ref().child('images/${DateTime.now().toString()}');
        // await ref.putFile(file);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Image uploaded to Firebase Storage')),
        );
      } catch (e) {
        print(e.toString());
      }
    }
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
                            Prompts.uploadPicPopup(() {
                              Get.back();
                              pickImageFromCamera();
                            }, () {
                              Get.back();
                              getImages();
                            });
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
                      SizedBox(height: 10.h,),
                      Visibility(
                        visible: selectedImages.isNotEmpty,
                        child: DottedBorder(
                            padding: EdgeInsets.all(10.sp),
                            borderType: BorderType.RRect,
                            radius: Radius.circular(15.sp),
                            dashPattern: const [10, 10],
                            color: Colors.redAccent,
                            strokeWidth: 2,
                            child: SizedBox(
                              // height: 8.h,
                              width: 280.w,
                              child: GridView.builder(
                                physics: NeverScrollableScrollPhysics(),
                                shrinkWrap: true,
                                itemCount:
                                selectedImages.length,
                                gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 3),
                                itemBuilder:
                                    (BuildContext context,
                                    int index) {
                                  return Center(
                                      child:
                                      Image.file(
                                          selectedImages[
                                          index]));
                                },
                              ),
                            )),
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
                            imageUrl
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
