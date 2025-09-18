import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class StoryWidgets extends StatelessWidget{
  final String imageUrl;
  final String username;
  StoryWidgets({
   required this.imageUrl,
   required this.username,
});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
onTap: (){
  Get.to(
      () =>
   StoryDetailPage(imageUrl: imageUrl, username: username),
   transition: Transition.zoom,
    duration: Duration(milliseconds: 400),
  );
},
      child: Column(
         children: [
           Hero(
             tag: imageUrl,
             child: CircleAvatar(
               radius:  40,
               backgroundColor: Colors.red,
               child: CircleAvatar(
                 radius: 38,
                 backgroundImage: NetworkImage(imageUrl),
               ),
             ),
           ),
           SizedBox(height: 5,),
           SizedBox(
             width: 80,
             child: Text(username,
             overflow: TextOverflow.ellipsis,
             textAlign: TextAlign.center,),

           )
         ],
      ),
    );
  }
}

class StoryDetailPage extends StatelessWidget {
  final String imageUrl;
  final String username;

  const StoryDetailPage({
    super.key,
    required this.imageUrl,
    required this.username,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Hero(
          tag: imageUrl,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: Image.network(
              imageUrl,
              fit: BoxFit.contain,
            ),
          ),
        ),
      ),
    );
  }
}