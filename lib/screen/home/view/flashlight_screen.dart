// import 'package:flashlight/screen/color/controller/color_controller.dart';
// import 'package:flashlight/screen/home/controller/controller.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:get/get_core/src/get_main.dart';
//
// class FlashlightScreen extends StatefulWidget {
//   @override
//   _FlashlightScreenState createState() => _FlashlightScreenState();
// }
//
// class _FlashlightScreenState extends State<FlashlightScreen> {
//   final FlashlightController flashlightController =
//       Get.put(FlashlightController());
//   final ColorController colorController = Get.put(ColorController());
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Flashlight'),
//         centerTitle: true,
//       ),
//       body: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           Obx(
//             () => ElevatedButton(
//               onPressed: flashlightController.toggleFlashlight,
//               child: Text(flashlightController.isFlashlightOn.value
//                   ? 'Turn Off Flashlight'
//                   : 'Turn On Flashlight'),
//             ),
//           ),
//           const SizedBox(height: 20),
//           Obx(
//             () => ElevatedButton(
//               onPressed: flashlightController.toggleStrobe,
//               child: Text(flashlightController.strobeActive.value
//                   ? 'Stop Strobe'
//                   : 'Start Strobe'),
//             ),
//           ),
//           const SizedBox(height: 20),
//           const Text('Strobe Speed'),
//           Obx(
//             () => Slider(
//               value: flashlightController.strobeInterval.value.toDouble(),
//               onChanged: (value) =>
//                   flashlightController.updateStrobeInterval(value),
//               min: 100,
//               max: 1000,
//               divisions: 18,
//               label: '${flashlightController.strobeInterval.value} ms',
//             ),
//           ),
//           const SizedBox(height: 20),
//           ElevatedButton(
//             onPressed: () {
//               Get.toNamed('color');
//             },
//             child: const Text('Pick Color'),
//           ),
//         ],
//       ),
//     );
//   }
// }

import 'package:flashlight/screen/color/controller/color_controller.dart';
import 'package:flashlight/screen/home/controller/controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FlashlightScreen extends StatefulWidget {
  @override
  _FlashlightScreenState createState() => _FlashlightScreenState();
}

class _FlashlightScreenState extends State<FlashlightScreen> {
  final FlashlightController flashlightController = Get.put(FlashlightController());
  final ColorController colorController = Get.put(ColorController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flashlight'),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Obx(
                () => ElevatedButton(
              onPressed: flashlightController.toggleFlashlight,
              child: Text(
                flashlightController.isFlashlightOn.value
                    ? 'Turn Off Flashlight'
                    : 'Turn On Flashlight',
              ),
            ),
          ),
          const SizedBox(height: 20),
          Obx(
                () => ElevatedButton(
              onPressed: flashlightController.toggleStrobe,
              child: Text(
                flashlightController.strobeActive.value
                    ? 'Stop Strobe'
                    : 'Start Strobe',
              ),
            ),
          ),
          const SizedBox(height: 20),
          const Text('Strobe Speed'),
          Obx(
                () => Slider(
              value: flashlightController.strobeInterval.value.toDouble(),
              onChanged: (value) => flashlightController.updateStrobeInterval(value),
              min: 100,
              max: 1000,
              divisions: 10,
              label: '${flashlightController.strobeInterval.value} ms',
            ),
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              Get.toNamed('color');
            },
            child: const Text('Pick Color'),
          ),
        ],
      ),
    );
  }
}
