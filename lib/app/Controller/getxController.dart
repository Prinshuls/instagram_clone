import 'dart:io';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:instagram_clone/app/View/Screens/UserProfile.dart';
 class PostController extends GetxController{
   var currentIndex  = 0.obs;
   //var isLiked = false.obs;
   var selectedIndex = 0.obs;
   var likePageIndex = 0.obs;
   var likePost = <int>[].obs;
   var savePost = <int>[].obs;
   var capturedImage = Rx<File?>(null);
   final ImagePicker picker = ImagePicker();
   var post = <Map<String , String>>[].obs;
   var isLoading  = false.obs;
   var page = 0.obs;
   final int limit = 5;
   var hiddePosts = <int>{}.obs;

   @override
   void onInit(){
     super.onInit();
loadPost();
   }

   void hiddePost(int index){
     hiddePosts.add(index);
   }
   void undoPost(int index){
     hiddePosts.remove(index);
   }

   bool ishidde(int index){
     return hiddePosts.contains(index);
   }

   void loadPost()async{
    if(isLoading.value) return;
    isLoading.value = true;
    await Future.delayed(Duration(seconds: 3));
    List<Map<String, String>> newPost = List.generate(
      limit,
          (index) => {
        "username": "User ${(page.value * limit) + index + 1}",
        "profileImage":
        "https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_960_720.png",
        "postImage":
        "https://picsum.photos/400/300?random=${(page.value * limit) + index + 1}",
        "caption": "Caption ${(page.value * limit) + index + 1}",
      },
    );
    post.addAll(newPost);
    page.value++;
    isLoading.value = false;
   }


   CameraController? cameraController;
   var isCameraInitialized = false.obs;

   void toogle(int index){
     if(likePost.contains(index)){
       likePost.remove(index);
     }else{
       likePost.add(index);
     }
   }
   bool isLiked(int index){
     return likePost.contains(index);
   }

   void saveToogle(int index){
     if(savePost.contains(index)){
       savePost.remove(index);
     }else{
       savePost.add(index);
     }
   }
   bool isSave(int index){
     return savePost.contains(index);
   }

   void changeIndex(int index){
     selectedIndex.value = index;
   }
   void changeLikeIndex(int index){
     likePageIndex.value = index;
   }

Future<void> openCamera()async{
     final XFile? image = await picker.pickImage(source: ImageSource.camera);

     if(image != null){
       capturedImage.value = File(image.path);
       Get.snackbar("Camera", "Image Selected");
     } else{
       Get.snackbar("Camera", "No Image Selected");
     }

}
Future<void> initLiveCamera()async {
  final cameras = await availableCameras();
  if (cameras.isEmpty) {
    Get.snackbar("Alert", "No Camera Found");
    return;
  }
  final firstCamera = cameras.first;
  cameraController = CameraController(firstCamera, ResolutionPreset.high);
  try {
    await cameraController!.initialize();
    isCameraInitialized.value = true;
  } catch (e){
    Get.snackbar("Alert", "Camera Initialized Failed ");
}
}
void openProfile({
     required String username,
  required String profileImage,
 }) {
     Get.to(() =>
     UserProfile(username: username, profileImage: profileImage)
     );
}


 }