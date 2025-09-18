import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:instagram_clone/app/Controller/getxController.dart';
import 'app/Model/routes/app_page.dart';
import 'app/Model/routes/app_routes.dart';
 void main(){
   Get.put(PostController());
   runApp(MyApp());
 }
 class MyApp extends StatelessWidget{
   @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: AppRoutes.splash,
      getPages: AppPages.pages,
    );
  }
 }