import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:instagram_clone/app/View/Screens/AddScreen.dart';
import 'package:instagram_clone/app/View/Screens/Login_screen.dart';
import 'package:instagram_clone/app/View/Screens/Mainscreen.dart';
import 'package:instagram_clone/app/View/Screens/Message.dart';
import 'package:instagram_clone/app/View/Screens/Profile.dart';
//import 'package:instagram_clone/app/View/Screens/home_screen.dart';
import 'package:instagram_clone/app/View/Screens/like_Page.dart';
import 'package:instagram_clone/app/View/Screens/register_page.dart';
import 'package:instagram_clone/app/View/Screens/signup_screen.dart';
import 'package:instagram_clone/app/View/Screens/splash_screen.dart';
import '../../View/Screens/Search_Page.dart';
import '../../View/Screens/home_screen.dart';
import 'app_routes.dart';

class AppPages{
  static final pages = [
    GetPage(name: AppRoutes.splash, page:() => SplashScreen()),
    GetPage(name: AppRoutes.login, page: () => LoginPage()),
    GetPage(name: AppRoutes.signup, page: () => SignupPage()),
    GetPage(name: AppRoutes.home, page: () => HomePage()),
    GetPage(name: AppRoutes.register, page: () => Register()),
    GetPage(name: AppRoutes.search, page: () => SearchPage()),
    GetPage(name: AppRoutes.like, page: () => LikePage()),
    GetPage(name: AppRoutes.profile, page: () => ProfileScreen()),
    GetPage(name: AppRoutes.add, page: () => AddScreen()),
    GetPage(name: AppRoutes.main, page: () => MainScreen()),
    GetPage(name: AppRoutes.chat, page: () => ChatListScreen()),
  ];
}