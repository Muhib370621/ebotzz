import 'package:ebotzz/controllers/offerController.dart';
import 'package:ebotzz/utils/prompts.dart';
import 'package:ebotzz/widgets/customInput.dart';

import '../../utils/imports.dart';

// ignore: must_be_immutable
class MakeAnOfferPopup extends StatelessWidget {
  MakeAnOfferPopup({super.key});

  TextEditingController yourPrice = TextEditingController();
  TextEditingController yourEmail = TextEditingController();
  TextEditingController yourName = TextEditingController();
  TextEditingController yourMessage = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final OfferController offerController = Get.put(OfferController());

    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius:
            BorderRadius.circular(18.0), // set the border radius to 10.0
      ),
      child: Container(
        height: 600.h,
        // padding: EdgeInsets.all(),
        // width: 100.w,
        decoration: const BoxDecoration(
          color: Colors.black12,
          borderRadius: BorderRadius.all(
            Radius.circular(
              20,
            ),
          ),
        ),
        // padding: const EdgeInsets.only(
        //   top: 16,
        // ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              height: 50.h,
              width: 600.w,
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(
                    20,
                  ),
                  topRight: Radius.circular(
                    20,
                  ),
                ),
              ),
              child: Center(
                child: Text(
                  "Make an Offer",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 10.h,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 16.w),
                  child: Text(
                    "Your Price",
                    style: TextStyle(
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                CustomInputField(
                  controller: yourPrice,
                  label: "Enter Price",
                  // suffixIcon: Icon(Icons.search),
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 16.w),
                  child: Text(
                    "Your Email",
                    style: TextStyle(
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                CustomInputField(
                  controller: yourEmail,
                  label: "Enter Email",
                  // suffixIcon: Icon(Icons.search),
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 16.w),
                  child: Text(
                    "Your Name",
                    style: TextStyle(
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                CustomInputField(
                  controller: yourName,
                  label: "Enter Name",
                  // suffixIcon: Icon(Icons.search),
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 16.w),
                  child: Text(
                    "Your Message",
                    style: TextStyle(
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                CustomInputField(
                  controller: yourMessage,
                  label: "Enter Message",
                  // suffixIcon: Icon(Icons.search),
                ),
              ],
            ),
            Obx(() {
              return InkWell(
                onTap: () {
                  if(yourPrice.text==""|| yourEmail=="" || yourName=="" || yourMessage ==""){
                    Prompts.showError("Oops", "Fill all the fields");
                  }
                  final RegExp emailRegex = RegExp(r'^[\w-]+(\.[\w-]+)*@[\w-]+(\.[\w-]+)+$');
                  if (!emailRegex.hasMatch(yourEmail.text)) {
                    Prompts.showError("Oops", "Invalid Email");

                  }

                  else{
                  offerController.makeLoading();}
                },
                child: Container(
                  width:170.w,
                  height: 45.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.r),
                    color: blackColor,
                  ),
                  child: Center(
                    child: offerController.isLoading.value == true
                        ? SizedBox(
                      height: 25.h,
                          width: 25.w,
                          child: CircularProgressIndicator(
                              color: Colors.white,
                            ),
                        )
                        : Text(
                            "Send",
                            // style: Get.textTheme.bodyText1!
                            //     .copyWith(color: whiteColor, fontSize: 16.sp),
                          ),
                  ),
                ),
              );
            }),
            SizedBox(
              height: 10.h,
            ),
          ],
        ),
      ),
    );
  }
}
