import 'package:flashlight/screen/color/controller/color_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:get/get.dart';

class ColorPickerScreen extends StatefulWidget {
  @override
  _ColorPickerScreenState createState() => _ColorPickerScreenState();
}

class _ColorPickerScreenState extends State<ColorPickerScreen> {
  final ColorController colorController = Get.put(ColorController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pick a Color'),
        centerTitle: true,
      ),
      body: Stack(
        children: [
          Obx(
            () => Container(
              color: Color(colorController.selectedColor.value),
            ),
          ),
          Center(
            child: ElevatedButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: Text('Pick a color'),
                      content: SingleChildScrollView(
                        child: BlockPicker(
                          pickerColor:
                              Color(colorController.selectedColor.value),
                          onColorChanged: (color) {
                            colorController.changeColor(color.value);
                          },
                        ),
                      ),
                      actions:[
                        ElevatedButton(
                          child: Text('Got it'),
                          onPressed: () {
                            Get.back();
                          },
                        ),
                      ],
                    );
                  },
                );
              },
              child: Text('Pick a Color'),
            ),
          ),
        ],
      ),
    );
  }
}
