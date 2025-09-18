import 'package:flutter/material.dart';
import 'package:instagram_clone/app/Controller/getxController.dart';
import 'package:get/get.dart';
class LikePage extends StatelessWidget {
  final PostController postController = Get.put(PostController());

  final List<String> following = [
  "Rahul Like your photo",
  "Aman started following you",
  "Neha liked your reel",
  "Rohit commented: Nice!",
    "Rahul Like your photo",
    "Aman started following you",
    "Neha liked your reel",
    "Rohit commented: Nice!",
    "Rahul Like your photo",
    "Aman started following you",
    "Neha liked your reel",
    "Rohit commented: Nice!",
    "Rahul Like your photo",
    "Aman started following you",
    "Neha liked your reel",
    "Rohit commented: Nice!",
    "Rahul Like your photo",
    "Aman started following you",
    "Neha liked your reel",
    "Rohit commented: Nice!",
    "Rahul Like your photo",
    "Aman started following you",
    "Neha liked your reel",
    "Rohit commented: Nice!",
    "Rahul Like your photo",
    "Aman started following you",
    "Neha liked your reel",
    "Rohit commented: Nice!",
];

  final List<String> You = [
    "You liked Ankit's photo",
    "You followed Priya",
    "You commented: Nice",
    "You posted a new story",
    "You liked Ankit's photo",
    "You followed Priya",
    "You commented: Nice",
    "You posted a new story",
    "You liked Ankit's photo",
    "You followed Priya",
    "You commented: Nice",
    "You posted a new story",
    "You liked Ankit's photo",
    "You followed Priya",
    "You commented: Nice",
    "You posted a new story",
    "You liked Ankit's photo",
    "You followed Priya",
    "You commented: Nice",
    "You posted a new story",
    "You liked Ankit's photo",
    "You followed Priya",
    "You commented: Nice",
    "You posted a new story",
    "You liked Ankit's photo",
    "You followed Priya",
    "You commented: Nice",
    "You posted a new story",
    "You liked Ankit's photo",
    "You followed Priya",
    "You commented: Nice",
    "You posted a new story",
    "You liked Ankit's photo",
    "You followed Priya",
    "You commented: Nice",
    "You posted a new story",
    "You liked Ankit's photo",
    "You followed Priya",
    "You commented: Nice",
    "You posted a new story",
    "You liked Ankit's photo",
    "You followed Priya",
    "You commented: Nice",
    "You posted a new story",



  ];

  @override
  Widget build(BuildContext context) {
return Scaffold(

  appBar: AppBar(
  backgroundColor: Colors.grey.shade50,
    title: Padding(
      padding: const EdgeInsets.all(20),
      child: Obx(() =>
         Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TextButton(
              onPressed: (){
        postController.changeLikeIndex(0);
              },
              child: Text("Following",style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold,
              color: postController.likePageIndex.value == 0 ? Colors.black : Colors.grey),),
            ),
            TextButton(
              onPressed: (){
        postController.changeLikeIndex(1);
              },
              child: Text("You",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25,
                color: postController.likePageIndex.value  == 1 ? Colors.black : Colors.grey
              ),),
            )
          ],
        ),
      ),
    ),
  ),
  body: Obx(() {
    if(postController.likePageIndex.value == 0){
      return ListView.builder(
        itemCount: following.length,
        itemBuilder: (context , index){
          return ListTile(
            leading: CircleAvatar(
              radius: 20,
              backgroundImage: NetworkImage("https://as1.ftcdn.net/jpg/01/41/37/76/1000_F_141377601_iJDxiNfFlz7tnXt3Ms14nVzFCBXuFPgn.jpg"),
            ),
            title: Text(following[index],style: TextStyle(fontWeight: FontWeight.bold),),
            subtitle: Text(following[index],style: TextStyle(color: Colors.grey),),
            trailing: CircleAvatar(
              radius: 30,
              child: Image(image: NetworkImage("https://as2.ftcdn.net/jpg/03/27/91/77/1000_F_327917723_Hgvkn0diXZ53cesV84KqvU2AW77kOAxV.jpg"),
              fit: BoxFit.cover,
                width: 60,
              height: 60,),
            ),
          );
        },
      );
    }else{
      return ListView.builder(
        itemCount: You.length,
        itemBuilder: (context, index){
          return ListTile(
            leading: CircleAvatar(
              radius: 22,
              backgroundImage: NetworkImage("https://as1.ftcdn.net/jpg/00/88/56/98/1000_F_88569880_CXwvdWVUJ52sR5E80hh4kpSiPSOv6yI9.jpg"),
            ),
            title: Text(You[index], style: TextStyle(fontWeight: FontWeight.bold),),
            subtitle: Text(You[index],style: TextStyle(color: Colors.grey),),
            trailing: CircleAvatar(
              radius: 30,
              child: Image(image: NetworkImage("https://as2.ftcdn.net/jpg/00/27/81/25/1000_F_27812571_ntnqtpnCDmohiWgSsCSkeEjDwChrLipz.jpg"),
              fit: BoxFit.cover,
              width: 70,
              height: 60,),
            ),
          );
        },
      );
    }
  }
  ),


);
  }
}
