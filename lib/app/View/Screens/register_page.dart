import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:instagram_clone/app/View/widgets/button_widgets.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../Model/routes/app_routes.dart';
class Register extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
     SingleChildScrollView(
       child: Padding(
       padding: EdgeInsets.all(10),
         child: Column(
           mainAxisAlignment: MainAxisAlignment.spaceBetween,
           children: [
              Column(
                 mainAxisSize: MainAxisSize.min,
                 children: [
                   SizedBox(height: 150,),
                   Image.asset("assets/images/InstagramLogo.png",
                   height: 60,
                   fit: BoxFit.cover,),
       
                   SizedBox(height: 150,),
                   SizedBox(
                     width: double.infinity,
                     child:
                    Button(
                        text: "Login",
                        fontSize: 25,
                        onPressed: (){
                      Get.offNamed(AppRoutes.login);
                        },
                    ),
                   ),
                   SizedBox(height: 35),
                   TextButton(
                     onPressed: (){
               
                     },
                     child: Text("Switch Account",style: TextStyle(color: Colors.blue,fontWeight: FontWeight.bold,fontSize: 20),
                     ),
                   ),
       
                 ],
               ),
             Padding(
                 padding: EdgeInsets.all(10),
             child: Column(
               children: [
                 Divider(color: Colors.grey,),
       
                 Row(
                   mainAxisAlignment: MainAxisAlignment.center,
                   children: [
                     Text("Don't have an account",style: TextStyle(color: Colors.grey),),
                     TextButton(
                         onPressed: (){
                           Get.offNamed(AppRoutes.signup);
                         },
                         child: Text("Sign Up",style: TextStyle(color: Colors.blue),)),
                     SizedBox(height: 50,)
                   ],
                 ),
                 SizedBox(height: 40,)
               ],
             ),)
             
           ],
         ),
       ),
     )
      
    );
  }
}