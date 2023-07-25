import '../utils/imports.dart';

class BottomNavigationController extends GetxController {
  static BottomNavigationController get find => Get.find();

  RxInt currentIndex = 0.obs;

  void changeIndex(int index) {
    currentIndex.value = index;
  }
}
