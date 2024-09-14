import 'package:ebotzz/utils/imports.dart';
import 'package:ebotzz/widgets/customInput.dart';

import '../../../widgets/customActionButton.dart';

class ExportScreen extends StatelessWidget {
  const ExportScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController controller = TextEditingController();
    TextEditingController controller2 = TextEditingController();
    TextEditingController controller3= TextEditingController();
    return  Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 20.h,),
            Text(
              "Export Products",
              style: TextStyle(fontSize: 24.sp, color: Colors.black),
            ),
            SizedBox(height: 30.h,),
            Center(
              child: Container(
                width: 370,
                height: 800,

                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Export products to a CSV file",
                            style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20.sp,color: Colors.grey.shade600),),
                          SizedBox(
                            height: 20.h,
                          ),
                          Text(
                            "This tool allows you to generate and download a CSV file containing a list of all products",
                            style: TextStyle(color: Colors.grey, fontSize: 18.sp),
                          ),
                          SizedBox(
                            height: 5.h,
                          ),
                          Text(
                            "Click here to download sample file",
                            style: TextStyle(color: Colors.black),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 10.h,),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Container(
                        width: 350.w,
                        height: 200.h,
                        decoration: BoxDecoration(

                            border: Border.all(
                                color: Colors.black
                            )
                        ),
                        child: Row(
                          children: [
                            Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    children: [
                                      SizedBox(height: 10.h,),
                                      Text(
                                        "which columns should be exported",
                                        style: TextStyle(fontSize: 18.sp),
                                      )
                                    ],
                                  ),
                                )),
                            VerticalDivider(
                              color: Colors.grey,
                            ),
                            Expanded(
                              flex: 2,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(height: 10.h,),
                                    SizedBox(height: 10.h,),
                                    CustomInputField(controller: controller,label: "Export all columns",),
                                    SizedBox(width: 5.h,),

                                  ],
                                ))
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Container(
                        width: 350.w,
                        height: 200.h,
                        decoration: BoxDecoration(

                            border: Border.all(
                                color: Colors.black
                            )
                        ),
                        child: Row(
                          children: [
                            Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    children: [
                                      SizedBox(height: 10.h,),
                                      Text(
                                        "which product type should be exported",
                                        style: TextStyle(fontSize: 18.sp),
                                      )
                                    ],
                                  ),
                                )),
                            VerticalDivider(
                              color: Colors.grey,
                            ),
                            Expanded(
                              flex: 2,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(height: 10.h,),
                                    SizedBox(height: 10.h,),
                                    CustomInputField(controller: controller,label: "Export all products",),
                                    SizedBox(width: 5.h,),

                                  ],
                                ))
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Container(
                        width: 350.w,
                        height: 200.h,
                        decoration: BoxDecoration(

                            border: Border.all(
                                color: Colors.black
                            )
                        ),
                        child: Row(
                          children: [
                            Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    children: [
                                      SizedBox(height: 10.h,),
                                      Text(
                                        "Export custom meta",
                                        style: TextStyle(fontSize: 18.sp),
                                      )
                                    ],
                                  ),
                                )),
                            VerticalDivider(
                              color: Colors.grey,
                            ),
                            Expanded(
                              flex: 2,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(height: 10.h,),
                                    SizedBox(height: 10.h,),
                                    CustomInputField(controller: controller,label: "Yes export custom",),
                                  ],
                                ))
                          ],
                        ),
                      ),
                    ),

                  ],
                ),
              ),
            ),
            CustomActionButton(buttonText: "Next",isIcon: false, isLoading: false,),


          ],
        ),
      ),
    );
  }
}
