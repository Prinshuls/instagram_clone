import 'package:flutter/material.dart';
import 'package:instagram_clone/app/Controller/getxController.dart';
import 'package:get/get.dart';
import 'package:instagram_clone/app/View/Screens/AddScreen.dart';
import 'package:instagram_clone/app/View/Screens/Search_Page.dart';
import 'package:instagram_clone/app/View/Screens/cameraScreen.dart';
import 'package:instagram_clone/app/View/Screens/home_screen.dart';
import 'package:instagram_clone/app/View/Screens/like_Page.dart';

import 'Profile.dart';

final List<Widget> pages = [
  HomePage(),
  SearchPage(),
  AddScreen(),
  LikePage(),
  ProfileScreen(),
];

 class MainScreen extends StatelessWidget{
   final PostController postController = Get.put(PostController());
   @override
  Widget build(BuildContext context) {
    return Obx(() =>
    Scaffold(
      resizeToAvoidBottomInset: false,
      body: IndexedStack(
        index: postController.selectedIndex.value,
        children: pages,
      ),
      bottomNavigationBar:
      Container(
        alignment: Alignment.topLeft,
        height: 100,
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border(
            top: BorderSide(color: Colors.grey.shade300, width: 0.5),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
              onPressed: () => postController.changeIndex(0),
              icon: Image.asset(
                "assets/images/Icon.png",
                height: 22,

              ),
            ),
            IconButton(
              onPressed: () => postController.changeIndex(1),
              icon: Image.asset(
                "assets/images/search.png",
                height: 22,

              ),
            ),
            IconButton(
              onPressed: () async {
                await postController.initLiveCamera();
                Get.to(() => CameraScreen());
              },
              icon: Image.asset(
                "assets/images/Add.png",
                height: 22,

              ),
            ),
            IconButton(
              onPressed: () => postController.changeIndex(3),
              icon: Image.asset(
                "assets/images/like.png",
                height: 22,

              ),
            ),
            GestureDetector(
              onTap: () => postController.changeIndex(4),
              child: CircleAvatar(
                radius: 14,
                backgroundImage: NetworkImage("https://i.pravatar.cc/150?img=11"),
              ),
            ),
          ],
        ),
      ),

    ),
    );
  }
 }