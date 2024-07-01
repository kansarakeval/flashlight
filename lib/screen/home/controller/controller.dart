import 'package:get/get.dart';
import 'package:torch_light/torch_light.dart';
import 'dart:async';

class FlashlightController extends GetxController {
  var isFlashlightOn = false.obs;
  var strobeActive = false.obs;
  var strobeInterval = 500.obs;
  Timer? strobeTimer;

  void toggleFlashlight() async {
    if (isFlashlightOn.value) {
      await TorchLight.disableTorch();
    } else {
      await TorchLight.enableTorch();
    }
    isFlashlightOn.value = !isFlashlightOn.value;
  }

  void toggleStrobe() {
    if (strobeActive.value) {
      strobeTimer?.cancel();
      strobeTimer = null;
      TorchLight.disableTorch();
      isFlashlightOn.value = false;
    } else {
      startStrobe();
    }
    strobeActive.value = !strobeActive.value;
  }

  void startStrobe() {
    strobeTimer = Timer.periodic(Duration(milliseconds: strobeInterval.value), (timer) async {
      if (isFlashlightOn.value) {
        await TorchLight.disableTorch();
      } else {
        await TorchLight.enableTorch();
      }
      isFlashlightOn.value = !isFlashlightOn.value;
    });
  }

  void updateStrobeInterval(double value) {
    strobeInterval.value = value.toInt();
    if (strobeActive.value) {
      strobeTimer?.cancel();
      startStrobe();
    }
  }

  @override
  void onClose() {
    strobeTimer?.cancel();
    super.onClose();
  }
}
