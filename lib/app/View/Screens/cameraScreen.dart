/*
import 'package:flutter/material.dart';
 import 'package:get/get.dart';
 import 'package:camera/camera.dart';
import 'package:instagram_clone/app/Controller/getxController.dart';

  class CameraScreen extends StatelessWidget{
    final PostController controller = Get.find<PostController>();
    @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() {
        if(!controller.isCameraInitialized.value){
          return Center(
            child: CircularProgressIndicator(),
          );
        }
        return  Stack(
            children: [
             Positioned.fill(
               child: CameraPreview(controller.cameraController!),
             ),
             Positioned(
             top: 50,
             left: 0,
             right: 0,
             child: Row(
             mainAxisAlignment: MainAxisAlignment.center,
             children: [
             Container(
             padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
             decoration: BoxDecoration(
             color: Colors.pink,
             borderRadius: BorderRadius.circular(20),
             ),
             child: Text(
             'LIVE',
             style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
             ),
             ),

              SafeArea(
                child: 
                  Padding(
                    padding: EdgeInsets.all(10),
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: IconButton(
                        onPressed: (){
                          controller.cameraController?.dispose();
                          controller.isCameraInitialized.value = false;
                          Get.back();
                        },
                        icon: Icon(Icons.close,color: Colors.white, size: 30,),
                      ),
                    ),
                  )
              ),
        Positioned(
        bottom: 0,
        left: 0,
        right: 0,
        child: Container(
        color: Colors.black.withOpacity(0.4),
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 8),
        child: Row(
        children: [
        Expanded(
        child: TextField(
        style: TextStyle(color: Colors.white),
        decoration: InputDecoration(
        hintText: 'Comment',
        hintStyle: TextStyle(color: Colors.white70),
        border: InputBorder.none,
        ),
        ),
        ),
        Icon(Icons.favorite_border, color: Colors.white),
        SizedBox(width: 10),
        Icon(Icons.send, color: Colors.white),
        ],

          ),
        ),

        ),
        ]
        ),
        )
        ]


        );


      }),
    );
  }
  }
 */

/*
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:camera/camera.dart';
import 'package:instagram_clone/app/Controller/getxController.dart';

class CameraScreen extends StatefulWidget {
  @override
  State<CameraScreen> createState() => _CameraScreenState();
}

class _CameraScreenState extends State<CameraScreen> {
  final PostController controller = Get.find<PostController>();

  @override
  void initState() {
    super.initState();
    controller.initLiveCamera(); // ✅ Only here
  }

  @override
  void dispose() {
    controller.cameraController?.dispose();
    controller.isCameraInitialized.value = false;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Obx(() {
        if (!controller.isCameraInitialized.value) {
          return Center(child: CircularProgressIndicator());
        }

        return Stack(
          children: [
            // ✅ Camera Preview
            Positioned.fill(
              child: CameraPreview(controller.cameraController!),
            ),

            // 🔴 LIVE tag & viewer count
            Positioned(
              top: 50,
              left: 0,
              right: 0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                    decoration: BoxDecoration(
                      color: Colors.pink,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text(
                      'LIVE',
                      style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                  ),
                  SizedBox(width: 10),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                    decoration: BoxDecoration(
                      color: Colors.black54,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text(
                      '1.2k watching',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),

            // ❌ Close button
            SafeArea(
              child: Padding(
                padding: EdgeInsets.all(10),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: IconButton(
                    onPressed: () {
                      controller.cameraController?.dispose();
                      controller.isCameraInitialized.value = false;
                      Get.back();
                    },
                    icon: Icon(Icons.close, color: Colors.white, size: 30),
                  ),
                ),
              ),
            ),

            // 💬 Comment input
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                color: Colors.black.withOpacity(0.4),
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                child: Row(
                  children: [
                    Expanded(
                      child: TextField(
                        style: TextStyle(color: Colors.white),
                        decoration: InputDecoration(
                          hintText: 'Comment',
                          hintStyle: TextStyle(color: Colors.white70),
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                    Icon(Icons.favorite_border, color: Colors.white),
                    SizedBox(width: 10),
                    Icon(Icons.send, color: Colors.white),
                  ],
                ),
              ),
            ),
          ],
        );
      }),
    );
  }
}
 */

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:camera/camera.dart';
import 'package:instagram_clone/app/Controller/getxController.dart';

class CameraScreen extends StatelessWidget {
  final PostController controller = Get.find<PostController>();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.black,
      body: Obx(() {
        if (!controller.isCameraInitialized.value) {
          return Center(child: CircularProgressIndicator());
        }

        // Scale camera preview to fit screen
        final deviceRatio = size.width / size.height;
        final scale = controller.cameraController!.value.aspectRatio / deviceRatio;

        return Stack(
          children: [
            // 🔴 Camera Preview Fullscreen
            Positioned.fill(
              child: Transform.scale(
                scale: scale,
                child: Center(child: CameraPreview(controller.cameraController!)),
              ),
            ),

            // ❌ Close button
            SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: IconButton(
                    onPressed: () {
                      controller.cameraController?.dispose();
                      controller.isCameraInitialized.value = false;
                      Get.back();
                    },
                    icon: Icon(Icons.close, color: Colors.white, size: 30),
                  ),
                ),
              ),
            ),

            // 🔴 LIVE tag & viewer count
            Positioned(
              top: 50,
              left: 0,
              right: 0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                    decoration: BoxDecoration(
                      color: Colors.pink,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text(
                      'LIVE',
                      style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                  ),
                  SizedBox(width: 10),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                    decoration: BoxDecoration(
                      color: Colors.black54,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text(
                      '1.2k watching',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),

            // 💬 Comment input at bottom
            Positioned(
              bottom: 40,
              left: 0,
              right: 0,
              child: Container(
                color: Colors.black.withOpacity(0.4),
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                child: Row(
                  children: [
                    Expanded(
                      child: TextField(
                        style: TextStyle(color: Colors.white),
                        decoration: InputDecoration(
                          hintText: 'Comment',
                          hintStyle: TextStyle(color: Colors.white70),
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                    Icon(Icons.favorite_border, color: Colors.white),
                    SizedBox(width: 10),
                    Icon(Icons.send, color: Colors.white),
                  ],
                ),
              ),
            ),
          ],
        );
      }),
    );
  }
}

