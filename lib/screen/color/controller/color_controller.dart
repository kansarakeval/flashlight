import 'package:get/get.dart';

class ColorController extends GetxController {
  var selectedColor = 0xff000000.obs;

  void changeColor(int color) {
    selectedColor.value = color;
  }
}
