import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:instagram_clone/app/Controller/getxController.dart';
import 'package:instagram_clone/app/Model/routes/app_routes.dart';
 class CustomerNavigation extends StatelessWidget{
   final PostController postController = Get.find<PostController>();
   @override
  Widget build(BuildContext context) {
    return Obx(() =>
    BottomNavigationBar(
      currentIndex: postController.selectedIndex.value,
      onTap: (index){
        postController.changeIndex(index);
        switch(index){
          case 0:
            Get.toNamed(AppRoutes.home);
            break;
          case 1:
            Get.toNamed(AppRoutes.search);
            break;
          case 2:
            Get.toNamed(AppRoutes.add);
            break;
          case 3:
            Get.toNamed(AppRoutes.like);
            break;
          case 4:
            Get.toNamed(AppRoutes.profile);
            break;
        }
      },
      type: BottomNavigationBarType.fixed,
      selectedItemColor: Colors.black,
      unselectedItemColor: Colors.grey,
      showUnselectedLabels: true,
      backgroundColor: Colors.white,
      items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.home_outlined),
          label: "Home",

        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.search),
          label: "Search",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.add_box_outlined),
          label: 'Add',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.favorite),
          label: 'Like',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person_outline),
          label: 'Profile'
        )
      ],
    )
    );
  }
 }