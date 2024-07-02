import 'package:flashlight/util/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

void main(){
  WidgetsFlutterBinding.ensureInitialized();
  MobileAds.instance.initialize();
  
  runApp(
      GetMaterialApp(
        debugShowCheckedModeBanner: false,
        routes: app_routes,
      ),
  );
}