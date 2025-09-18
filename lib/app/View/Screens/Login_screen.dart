import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:instagram_clone/app/Model/routes/app_routes.dart';
import 'package:instagram_clone/app/View/widgets/button_widgets.dart';
import 'package:get/get.dart';
import 'package:text_divider/text_divider.dart';
 class LoginPage extends StatelessWidget{
   final TextEditingController emailController = TextEditingController();
   final TextEditingController passwordController = TextEditingController();
   final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
   @override
  Widget build(BuildContext context) {
    return Scaffold(
body: Form(
  key: _formKey,
  child: SingleChildScrollView(
    scrollDirection: Axis.vertical,
    child: Padding(
      padding: EdgeInsets.all(15),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
          SizedBox(height: 120,),
              Image.asset("assets/images/InstagramLogo.png",
                height: 60,
                fit: BoxFit.cover,),

          SizedBox(height: 60,),
          TextFormField(
            controller: emailController,
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
              labelText: "Enter a Email",
              prefixIcon: Icon(Icons.person,color: Colors.blue,),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              )
            ),
            validator: (value){
              if(value == null || value.isEmpty){
                return "Enter a Email";
              }
              if(!value.contains("@")){
                return "Enter a Valid Email";
              }
              return null;
            },
          ),
          SizedBox(height: 20,),
          TextFormField(
            controller: passwordController,
            obscureText: true,
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
                return "Enter a Correct Password Must be 6 Digits";
              }
              return null;
            },
          ),
          SizedBox(height: 10,),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              TextButton(
                  onPressed: (){

                  },
                child: Text("Forget Password?",style: TextStyle(color: Colors.blue,fontWeight: FontWeight.bold,fontSize: 18),),
              ),
            ],
          ),
          SizedBox(height: 30,),
          Button(
              text: "Log In",
              fontSize: 25,
              onPressed: (){
                if(_formKey.currentState!.validate()) {
                  Get.offNamed(AppRoutes.main);
                }
              },
          ),
              SizedBox(height: 40,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
    CircleAvatar(
    radius: 15,
    backgroundImage: NetworkImage("https://store-images.s-microsoft.com/image/apps.37935.9007199266245907.b029bd80-381a-4869-854f-bac6f359c5c9.91f8693c-c75b-4050-a796-63e1314d18c9?h=307"),
    ),
                  SizedBox(width: 10,),
                  Text("Log in with Facebook",style: TextStyle(color: Colors.blue,fontWeight: FontWeight.bold,fontSize: 17),)
                ],
              ),
    SizedBox(height: 40,),
    TextDivider.horizontal(
      text: Text("OR",style: TextStyle(color: Colors.grey),),
    ),
              SizedBox(height: 40,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Don't have an Account?",style: TextStyle(color: Colors.grey),),
    TextButton(
      onPressed: (){
        Get.offNamed(AppRoutes.signup);
      },
    child: Text("Sign Up",style: TextStyle(color: Colors.blue),),)
                ],
              )
          ]
      ),
          Padding(
            padding: EdgeInsets.all(10),
            child: Column(
              children: [
                Divider(color: Colors.grey,),
                SizedBox(height: 15,),
                Text("Instagram or Facebook",style: TextStyle(color: Colors.grey),)
              ],
            ),
          )
        ],
      ),
    ),
  ),
),
    );
  }
 }