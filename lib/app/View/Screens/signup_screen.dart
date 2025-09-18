import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:text_divider/text_divider.dart';
import '../../Model/routes/app_routes.dart';
import '../widgets/button_widgets.dart';
 class SignupPage extends StatelessWidget{
   TextEditingController nameController = TextEditingController();
   TextEditingController emailController = TextEditingController();
   TextEditingController passwordController = TextEditingController();
   TextEditingController phoneController = TextEditingController();
   final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
   @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Form(
          key: _formKey,
          child: Padding(
            padding: EdgeInsets.all(10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
              mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(height: 80,),
                  Image.asset("assets/images/InstagramLogo.png",
                    height: 60,
                    fit: BoxFit.cover,),

                SizedBox(height: 40,),
                TextFormField(
                  controller: nameController,
                  decoration: InputDecoration(
                    labelText: "Enter a Name",
                    prefixIcon: Icon(Icons.person,color: Colors.blue,),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    )
                  ),
                  validator: (value){
                    if(value == null || value.isEmpty){
                      return "Enter a Name";
                    }
                    return null;
                  },
                ),
                SizedBox(height: 20,),
                TextFormField(
                  controller: emailController,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                      labelText: "Enter a Email",
                      prefixIcon: Icon(Icons.mail,color: Colors.blue,),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      )
                  ),
                  validator: (value){
                    if(value == null || value.isEmpty){
                      return "Enter a Email";
                    }
                    if(!value.contains('@')){
        return "Enter a valid Email";
                    }
                    return null;
                  },
                ),
                SizedBox(height: 20,),
                TextFormField(
                  controller: passwordController,
                  decoration: InputDecoration(
                      labelText: "Enter a Password",
                      prefixIcon: Icon(Icons.lock,color: Colors.blue,),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      )
                  ),
                  validator: (value){
                    if(value == null || value.isEmpty){
                      return "Enter a Password";
                    }
                    if(value.length < 6){
                      return "Password Must greater than 6 number";
                    }
                    return null;
                  },
                ),
                SizedBox(height: 20,),
                TextFormField(
                  controller: phoneController,
                  maxLength: 10,
                  keyboardType: TextInputType.phone,
                  decoration: InputDecoration(
                    labelText: "Enter a Phone Number",
                    prefixIcon: Icon(Icons.phone,color: Colors.blue,),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10)
                    )
                  ),
                  validator: (value){
                    if(value == null || value.isEmpty){
                      return "Enter a Phone Number";
                    }
                    if(value.length < 10){
                      return "Enter a Phone Number 10 Digits";
                    }
                    return null;
                  },
                ),
                SizedBox(height: 25,),
                SizedBox(
                  width: double.infinity,
                  child:
                  // ElevatedButton(
                  //   onPressed: (){
                  //     if(_formKey.currentState!.validate()) {
                  //       Get.offNamed(AppRoutes.login);
                  //     }
                  //   },
                  //   style: ElevatedButton.styleFrom(backgroundColor: Colors.blue,
                  //   padding: EdgeInsets.symmetric(vertical: 10),
                  //   shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20))),
                  //   child: Text("Login",style: TextStyle(color: Colors.white,fontSize: 30,fontWeight: FontWeight.bold),),
                  // ),
                  Button(
                    text: "Login",
                    onPressed: (){
                      if(_formKey.currentState!.validate()) {
                        Get.offNamed(AppRoutes.login);
                      }
                    },
                    fontSize: 25,
                  ),
                ),
                  SizedBox(height: 30,),
                  TextDivider(
                      text: Text("OR",style: TextStyle(color: Colors.grey),)),
                  SizedBox(height: 10,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("You Have Already Account?",style: TextStyle(color: Colors.grey),),
                      TextButton(
                        onPressed: (){
                          Get.offNamed(AppRoutes.login);
                        },
                         child: Text("LogIn",style: TextStyle(color: Colors.blue),),
                      )
                    ],
                  )
                  ],
                ),
                Padding(padding: EdgeInsets.all(10),
                child: Column(
                  children: [
                    Divider(color: Colors.grey,),
                    Text("Instagram or Facebook",style: TextStyle(color: Colors.grey),)
                  ],
                ),)
              ],
            ) ,
          ),
        ),
      ),
    );
  }
 }