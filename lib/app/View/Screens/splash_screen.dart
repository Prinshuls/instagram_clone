import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../Model/routes/app_routes.dart';
class SplashScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(seconds: 3),(){
      Get.offNamed(AppRoutes.register);
    });
    return Scaffold(
backgroundColor: Colors.white,
      body: Center(
        child:
         CircleAvatar
         (
             radius: 110,

             backgroundImage: AssetImage('assets/images/logo.png'),

         ),

      ),
    );
  }
}