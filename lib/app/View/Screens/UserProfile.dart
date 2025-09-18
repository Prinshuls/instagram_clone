import 'package:flutter/material.dart';
 class UserProfile extends StatelessWidget{
   final String username;
   final String profileImage;
   UserProfile({
    required this.username,
    required this.profileImage
 });
   @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(username),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 20,),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                 children: [
                   CircleAvatar(
                     radius: 40,
                     backgroundImage: NetworkImage(profileImage),
                   ),
                   SizedBox(width: 20,),
                   Expanded(
                     child: Row(
                       mainAxisAlignment: MainAxisAlignment.spaceAround,
                       children: [
                         Column(
                           children: [
                             Text("34",style: TextStyle(fontWeight: FontWeight.bold),),
                             Text("Post"),
                           ],
                         ),

                         Column(
                           children: [
                             Text("1.23k",style: TextStyle(fontWeight: FontWeight.bold,),),
                             Text("Followers"),
                           ],
                         ),
                         Column(
                           children: [
                             Text("500",style: TextStyle(fontWeight: FontWeight.bold),),
                             Text("Following"),
                           ],
                         )

                       ],
                     ),
                   )
                 ],
              ),
            ),
            SizedBox(height: 15,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {},
                      child: Text("Edit Profile"),
                    ),
                  ),
                  SizedBox(width: 10),
                  ElevatedButton(
                    onPressed: () {},
                    child: Icon(Icons.add),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            Container(
              height: 80,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: List.generate(10, (index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: Column(
                      children: [
                        CircleAvatar(
                          radius: 30,
                          backgroundImage: NetworkImage("https://picsum.photos/200?random=$index"),
                        ),
                      ],
                    ),
                  );
                }),
              ),
            ),

            GridView.builder(
              shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: 50,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3,
                crossAxisSpacing: 2,
                mainAxisSpacing: 2) ,
                itemBuilder: (context , index){
                return Image.network("https://picsum.photos/200?random=$index",fit: BoxFit.cover,);
                })

          ],
        ),
      )
    );
  }
 }