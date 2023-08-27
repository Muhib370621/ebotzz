import 'package:ebotzz/screens/home_screen/HomeScreen2.dart';
import 'package:ebotzz/utils/imports.dart';
import 'package:ebotzz/utils/prompts.dart';

class OfferController extends GetxController{


  RxBool isLoading = false.obs;
  var paymentMethod = 10.obs;
  RxString paymentName="".obs;

  void makeLoading() {

    isLoading.value=true;
    Future.delayed(Duration(seconds: 2),(){
      Get.off(()=> HomeScreen2());
      Prompts.showSuccess("Done!", "Successfully Made an Offer");
      isLoading.value=false;
    });
  }
}