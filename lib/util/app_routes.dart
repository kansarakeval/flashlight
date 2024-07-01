import 'package:flashlight/screen/color/view/color_screen.dart';
import 'package:flashlight/screen/home/view/flashlight_screen.dart';
import 'package:flutter/material.dart';

Map<String,WidgetBuilder> app_routes = {
  '/': (conext) => FlashlightScreen(),
  'color':(context) => ColorPickerScreen(),
};