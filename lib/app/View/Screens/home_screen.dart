
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:instagram_clone/app/Controller/getxController.dart';
import 'package:instagram_clone/app/Model/routes/app_routes.dart';
import 'package:instagram_clone/app/View/Screens/AddScreen.dart';
import 'package:instagram_clone/app/View/Screens/Search_Page.dart';
import 'package:instagram_clone/app/View/Screens/UserProfile.dart';
import 'package:instagram_clone/app/View/Screens/like_Page.dart';
import 'package:instagram_clone/app/View/widgets/NavigationBar.dart';
import 'package:instagram_clone/app/View/widgets/post_widgets.dart';
import 'package:get/get.dart';
import 'package:instagram_clone/app/View/widgets/Story_Widgets.dart';

class HomePage extends StatelessWidget {
  final PostController postController = Get.find<PostController>();

  final List<Map<String, String>> stories = [
    {
      "imageUrl":
      "https://t4.ftcdn.net/jpg/07/75/56/21/240_F_775562125_67MX9SMeQbEuteBXODJniw0gqQ4VNISq.jpg",
      "username": "Your Story"
    },
    {
      "imageUrl":
      "https://t3.ftcdn.net/jpg/14/91/33/18/240_F_1491331880_pLo1VkKmLlMNMaQEklPXuSvTQPAVTrGV.jpg",
      "username": "Sharma"
    },
    {
      "imageUrl":
      "https://t3.ftcdn.net/jpg/09/36/32/36/240_F_936323620_mpIqx9HOhY8iH2UsojlNRf0C2UaWn3rp.jpg",
      "username": "King"
    },
    {
      "imageUrl":
      "https://t4.ftcdn.net/jpg/05/38/47/07/240_F_538470757_z2XhiCuRyU8LX8hs1TVKkqp3tUNtIMd2.jpg",
      "username": "Vikram"
    },
    {
      "imageUrl":
      "https://as2.ftcdn.net/jpg/07/74/34/39/1000_F_774343920_YDqJjPL8DE6wyefhFSIQH263bUkZ52tA.webp",
      "username": "Ram"
    },
    {
      "imageUrl":
      "https://images.unsplash.com/photo-1587402092301-725e37c70fd8?q=80&w=764&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
      "username": "Dogesh"
    },
    {
      "imageUrl":
      "https://images.unsplash.com/photo-1673439785262-91453f24dab1?q=80&w=687&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
      "username": "Dogesh"
    },
    {
      "imageUrl":
      "https://plus.unsplash.com/premium_photo-1667727016915-baae2be5564e?q=80&w=688&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
      "username": "Dogesh"
    },
    {
      "imageUrl":
      "https://images.unsplash.com/photo-1587402092301-725e37c70fd8?q=80&w=764&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
      "username": "Dogesh"
    },

  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        IconButton(
                          onPressed: () {
                            postController.openCamera();
                          },
                          icon: Icon(
                            Icons.camera_alt_outlined,
                            color: Colors.black,
                            size: 25,
                          ),
                        ),
                        SizedBox(width: 50),
                       Image.asset(
                         'assets/images/InstagramLogo.png',
                         height: 40,
                         fit: BoxFit.cover,
                       ),
                        SizedBox(width: 40),
                        CircleAvatar(
                          radius: 12,
                          backgroundColor: Colors.white,
                          child: InkWell(
                            onTap: () {
                              Get.toNamed(AppRoutes.chat);
                            },
                            child: Image(
                              image: AssetImage('assets/images/IGTV.png'),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),

                        SizedBox(width: 15),
                        CircleAvatar(
                          radius: 12,
                          backgroundColor: Colors.white,
                          child: Image(
                            image: AssetImage('assets/images/send.png'),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Divider(color: Colors.grey),
                  SizedBox(
                    height: 110,
                    child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      padding: EdgeInsets.only(left: 8),
                      itemCount: stories.length,
                      separatorBuilder: (_, __) => const SizedBox(width: 13),
                      itemBuilder: (context, index) {
                        final story = stories[index];
                        return StoryWidgets(
                          imageUrl: story["imageUrl"]!,
                          username: story["username"]!,
                        );
                      },
                    ),
                  ),
                  Divider(color: Colors.grey),
                ],
              ),
            ),
            SliverList(
              delegate: SliverChildListDelegate([
                Posts(
                  profileImage:
                      "https://cdn.pixabay.com/photo/2016/05/02/12/58/tiger-1367197_1280.jpg",
                  username: "King",
                  caption: "Kangra",
                  onProfileTap: (){

                  },

                  images: [
                    "https://images.pexels.com/photos/45853/grey-crowned-crane-bird-crane-animal-45853.jpeg?_gl=1*1x6d2wq*_ga*MTU0NzE5MjI5My4xNzQxNTgxNTc0*_ga_8JE65Q40S6*czE3NTgxNzg3NTgkbzEwJGcxJHQxNzU4MTc4ODU4JGo0NyRsMCRoMA..",
                    "https://images.pexels.com/photos/1659438/pexels-photo-1659438.jpeg?_gl=1*10cvq34*_ga*MTU0NzE5MjI5My4xNzQxNTgxNTc0*_ga_8JE65Q40S6*czE3NTgxNzg3NTgkbzEwJGcxJHQxNzU4MTc5MDY5JGo2MCRsMCRoMA..",
                    "https://images.pexels.com/photos/1366919/pexels-photo-1366919.jpeg?_gl=1*pay0zb*_ga*MTU0NzE5MjI5My4xNzQxNTgxNTc0*_ga_8JE65Q40S6*czE3NTgxNzg3NTgkbzEwJGcxJHQxNzU4MTc5MTU3JGo2MCRsMCRoMA..",
                    "https://images.pexels.com/photos/1624496/pexels-photo-1624496.jpeg?_gl=1*1sz56j2*_ga*MTU0NzE5MjI5My4xNzQxNTgxNTc0*_ga_8JE65Q40S6*czE3NTgxNzg3NTgkbzEwJGcxJHQxNzU4MTc5MjI5JGo1NSRsMCRoMA..",
                    "https://images.pexels.com/photos/2559941/pexels-photo-2559941.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2",
                  ],
                  height: 400,
                  postIndex: 0,

                ),
                Divider(color: Colors.grey),
                Posts(
                  profileImage:
                      "https://images.pexels.com/photos/1535162/pexels-photo-1535162.jpeg?_gl=1*y9p5ch*_ga*MTU0NzE5MjI5My4xNzQxNTgxNTc0*_ga_8JE65Q40S6*czE3NTgxNzg3NTgkbzEwJGcxJHQxNzU4MTc5NjIwJGo0OCRsMCRoMA..",
                  username: "Sharma",
                  image:
                      "https://images.pexels.com/photos/1535162/pexels-photo-1535162.jpeg?_gl=1*y9p5ch*_ga*MTU0NzE5MjI5My4xNzQxNTgxNTc0*_ga_8JE65Q40S6*czE3NTgxNzg3NTgkbzEwJGcxJHQxNzU4MTc5NjIwJGo0OCRsMCRoMA..",
                  caption: "Jawala",
                  height: 400,
                  postIndex: 1,
                  onProfileTap: (){

                  },
                ),
                Divider(color: Colors.grey),
                Posts(
                  profileImage:
                      "https://t4.ftcdn.net/jpg/13/80/17/21/240_F_1380172171_SypnkQXqS3nIsDFH7bxIjOFYCL8TIYYD.jpg",
                  username: "Arun",
                  image:
                      "https://images.pexels.com/photos/3536235/pexels-photo-3536235.jpeg?_gl=1*1cg9phe*_ga*MTU0NzE5MjI5My4xNzQxNTgxNTc0*_ga_8JE65Q40S6*czE3NTgxNzg3NTgkbzEwJGcxJHQxNzU4MTc5OTU0JGo2MCRsMCRoMA..",
                  caption: "Manali",
                  height: 400,
                  postIndex: 2,
                  onProfileTap: (){

                  },
                ),
                Divider(color: Colors.grey),
                Posts(
                  profileImage:
                      "https://t3.ftcdn.net/jpg/11/53/85/36/240_F_1153853654_nE7lYRm3wm3kikIXHPKbGriCm16wky0p.jpg",
                  username: "Gourav",
                  image:
                      "https://images.pexels.com/photos/4062200/pexels-photo-4062200.jpeg?_gl=1*15knuq4*_ga*MTU0NzE5MjI5My4xNzQxNTgxNTc0*_ga_8JE65Q40S6*czE3NTgxNzg3NTgkbzEwJGcxJHQxNzU4MTgwMjA0JGo1MyRsMCRoMA..",
                  caption: "Jawali",
                  height: 400,
                  postIndex: 3,
                  onProfileTap: (){

                  },
                ),
                Divider(color: Colors.grey),
                Posts(
                  profileImage:
                      "https://t3.ftcdn.net/jpg/14/86/56/68/240_F_1486566899_ApvKO4AFB51NUtE7R9yxROERzxCZwAN1.jpg",
                  username: "Vikram",
                  image:
                      "https://images.pexels.com/photos/18699398/pexels-photo-18699398.jpeg?_gl=1*1577t2g*_ga*MTU0NzE5MjI5My4xNzQxNTgxNTc0*_ga_8JE65Q40S6*czE3NTgxNzg3NTgkbzEwJGcxJHQxNzU4MTgwMzE3JGoxOSRsMCRoMA..",
                  caption: "Palampur",
                  height: 400,
                  postIndex: 4,
                  onProfileTap: (){

                  },
                ),
                Divider(color: Colors.grey),
                Posts(
                  profileImage:
                      "https://t3.ftcdn.net/jpg/09/48/23/44/240_F_948234435_ztemZs0URuuNXiLFovR9TwWnfEYL23nv.jpg",
                  username: "Sahil",
                  image:
                      "https://images.pexels.com/photos/883630/pexels-photo-883630.jpeg?_gl=1*1yzba8o*_ga*MTU0NzE5MjI5My4xNzQxNTgxNTc0*_ga_8JE65Q40S6*czE3NTgxNzg3NTgkbzEwJGcxJHQxNzU4MTgwNDUyJGo2MCRsMCRoMA..",
                  caption: "Iran",
                  height: 400,
                  postIndex: 5,
                  onProfileTap: (){

                  },
                ),
                Divider(color: Colors.grey),
                Posts(
                  profileImage:
                  "https://images.pexels.com/photos/674010/pexels-photo-674010.jpeg?_gl=1*1rph6yu*_ga*MTU0NzE5MjI5My4xNzQxNTgxNTc0*_ga_8JE65Q40S6*czE3NTgxNzg3NTgkbzEwJGcxJHQxNzU4MTc4NzY2JGo1MiRsMCRoMA..",
                  username: "Vikram",
                  image:
                  "https://images.pexels.com/photos/674010/pexels-photo-674010.jpeg?_gl=1*1rph6yu*_ga*MTU0NzE5MjI5My4xNzQxNTgxNTc0*_ga_8JE65Q40S6*czE3NTgxNzg3NTgkbzEwJGcxJHQxNzU4MTc4NzY2JGo1MiRsMCRoMA..",
                  caption: "Palampur",
                  height: 400,
                  postIndex: 6,
                  onProfileTap: (){

                  },
                ),
                Divider(color: Colors.grey),
                Posts(
                  profileImage:
                  "https://images.pexels.com/photos/45853/grey-crowned-crane-bird-crane-animal-45853.jpeg?_gl=1*1x6d2wq*_ga*MTU0NzE5MjI5My4xNzQxNTgxNTc0*_ga_8JE65Q40S6*czE3NTgxNzg3NTgkbzEwJGcxJHQxNzU4MTc4ODU4JGo0NyRsMCRoMA..",
                  username: "Ankush",
                  image:
                  "https://images.pexels.com/photos/45853/grey-crowned-crane-bird-crane-animal-45853.jpeg?_gl=1*1x6d2wq*_ga*MTU0NzE5MjI5My4xNzQxNTgxNTc0*_ga_8JE65Q40S6*czE3NTgxNzg3NTgkbzEwJGcxJHQxNzU4MTc4ODU4JGo0NyRsMCRoMA..",
                  caption: "Palampur",
                  height: 400,
                  postIndex: 7,
                  onProfileTap: (){

                  },
                ),
                Divider(color: Colors.grey),
                Posts(
                  profileImage:
                  "https://t3.ftcdn.net/jpg/09/48/23/44/240_F_948234435_ztemZs0URuuNXiLFovR9TwWnfEYL23nv.jpg",
                  username: "Rakesh",
                  image:
                  "https://images.pexels.com/photos/887845/pexels-photo-887845.jpeg?_gl=1*s7kp26*_ga*MTU0NzE5MjI5My4xNzQxNTgxNTc0*_ga_8JE65Q40S6*czE3NTgxNzg3NTgkbzEwJGcxJHQxNzU4MTgwNjE0JGoyMSRsMCRoMA..",
                  caption: "Iran",
                  height: 400,
                  postIndex: 8,
                  onProfileTap: (){

                  },
                ),
                Divider(color: Colors.grey),
                Posts(
                  profileImage:
                  "https://cdn.pixabay.com/photo/2016/05/02/12/58/tiger-1367197_1280.jpg",
                  username: "Chaman",
                  //image: "https://cdn.pixabay.com/photo/2018/01/21/09/56/tiger-3096211_1280.jpg",
                  caption: "Kangra",
                  onProfileTap: (){

                  },

                  images: [
                    "https://images.pexels.com/photos/45853/grey-crowned-crane-bird-crane-animal-45853.jpeg?_gl=1*1x6d2wq*_ga*MTU0NzE5MjI5My4xNzQxNTgxNTc0*_ga_8JE65Q40S6*czE3NTgxNzg3NTgkbzEwJGcxJHQxNzU4MTc4ODU4JGo0NyRsMCRoMA..",
                    "https://images.pexels.com/photos/1659438/pexels-photo-1659438.jpeg?_gl=1*10cvq34*_ga*MTU0NzE5MjI5My4xNzQxNTgxNTc0*_ga_8JE65Q40S6*czE3NTgxNzg3NTgkbzEwJGcxJHQxNzU4MTc5MDY5JGo2MCRsMCRoMA..",
                    "https://images.pexels.com/photos/1366919/pexels-photo-1366919.jpeg?_gl=1*pay0zb*_ga*MTU0NzE5MjI5My4xNzQxNTgxNTc0*_ga_8JE65Q40S6*czE3NTgxNzg3NTgkbzEwJGcxJHQxNzU4MTc5MTU3JGo2MCRsMCRoMA..",
                    "https://images.pexels.com/photos/1624496/pexels-photo-1624496.jpeg?_gl=1*1sz56j2*_ga*MTU0NzE5MjI5My4xNzQxNTgxNTc0*_ga_8JE65Q40S6*czE3NTgxNzg3NTgkbzEwJGcxJHQxNzU4MTc5MjI5JGo1NSRsMCRoMA..",
                    "https://images.pexels.com/photos/2559941/pexels-photo-2559941.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2",
                  ],
                  height: 400,
                  postIndex: 9,

                ),
                Divider(color: Colors.grey),
                Posts(
                  profileImage:
                  "https://images.pexels.com/photos/1535162/pexels-photo-1535162.jpeg?_gl=1*y9p5ch*_ga*MTU0NzE5MjI5My4xNzQxNTgxNTc0*_ga_8JE65Q40S6*czE3NTgxNzg3NTgkbzEwJGcxJHQxNzU4MTc5NjIwJGo0OCRsMCRoMA..",
                  username: "Sharma",
                  image:
                  "https://images.pexels.com/photos/1535162/pexels-photo-1535162.jpeg?_gl=1*y9p5ch*_ga*MTU0NzE5MjI5My4xNzQxNTgxNTc0*_ga_8JE65Q40S6*czE3NTgxNzg3NTgkbzEwJGcxJHQxNzU4MTc5NjIwJGo0OCRsMCRoMA..",
                  caption: "Jawala",
                  height: 400,
                  postIndex: 10,
                  onProfileTap: (){

                  },
                ),
                Divider(color: Colors.grey),
                Posts(
                  profileImage:
                  "https://t4.ftcdn.net/jpg/13/80/17/21/240_F_1380172171_SypnkQXqS3nIsDFH7bxIjOFYCL8TIYYD.jpg",
                  username: "Anil",
                  image:
                  "https://images.pexels.com/photos/3536235/pexels-photo-3536235.jpeg?_gl=1*1cg9phe*_ga*MTU0NzE5MjI5My4xNzQxNTgxNTc0*_ga_8JE65Q40S6*czE3NTgxNzg3NTgkbzEwJGcxJHQxNzU4MTc5OTU0JGo2MCRsMCRoMA..",
                  caption: "Manali",
                  height: 400,
                  postIndex: 11,
                  onProfileTap: (){

                  },
                ),
                Divider(color: Colors.grey),
                Posts(
                  profileImage:
                  "https://t3.ftcdn.net/jpg/11/53/85/36/240_F_1153853654_nE7lYRm3wm3kikIXHPKbGriCm16wky0p.jpg",
                  username: "Goldy",
                  image:
                  "https://images.pexels.com/photos/4062200/pexels-photo-4062200.jpeg?_gl=1*15knuq4*_ga*MTU0NzE5MjI5My4xNzQxNTgxNTc0*_ga_8JE65Q40S6*czE3NTgxNzg3NTgkbzEwJGcxJHQxNzU4MTgwMjA0JGo1MyRsMCRoMA..",
                  caption: "Jawali",
                  height: 400,
                  postIndex: 12,
                  onProfileTap: (){

                  },
                ),
                Divider(color: Colors.grey),
                Posts(
                  profileImage:
                  "https://t3.ftcdn.net/jpg/14/86/56/68/240_F_1486566899_ApvKO4AFB51NUtE7R9yxROERzxCZwAN1.jpg",
                  username: "Vikash",
                  image:
                  "https://images.pexels.com/photos/18699398/pexels-photo-18699398.jpeg?_gl=1*1577t2g*_ga*MTU0NzE5MjI5My4xNzQxNTgxNTc0*_ga_8JE65Q40S6*czE3NTgxNzg3NTgkbzEwJGcxJHQxNzU4MTgwMzE3JGoxOSRsMCRoMA..",
                  caption: "Palampur",
                  height: 400,
                  postIndex: 13,
                  onProfileTap: (){

                  },
                ),
                Divider(color: Colors.grey),
                Posts(
                  profileImage:
                  "https://t3.ftcdn.net/jpg/09/48/23/44/240_F_948234435_ztemZs0URuuNXiLFovR9TwWnfEYL23nv.jpg",
                  username: "Illa",
                  image:
                  "https://images.pexels.com/photos/883630/pexels-photo-883630.jpeg?_gl=1*1yzba8o*_ga*MTU0NzE5MjI5My4xNzQxNTgxNTc0*_ga_8JE65Q40S6*czE3NTgxNzg3NTgkbzEwJGcxJHQxNzU4MTgwNDUyJGo2MCRsMCRoMA..",
                  caption: "Iran",
                  height: 400,
                  postIndex: 14,
                  onProfileTap: (){

                  },
                ),
                Divider(color: Colors.grey),
                Posts(
                  profileImage:
                  "https://images.pexels.com/photos/674010/pexels-photo-674010.jpeg?_gl=1*1rph6yu*_ga*MTU0NzE5MjI5My4xNzQxNTgxNTc0*_ga_8JE65Q40S6*czE3NTgxNzg3NTgkbzEwJGcxJHQxNzU4MTc4NzY2JGo1MiRsMCRoMA..",
                  username: "Billa",
                  image:
                  "https://images.pexels.com/photos/674010/pexels-photo-674010.jpeg?_gl=1*1rph6yu*_ga*MTU0NzE5MjI5My4xNzQxNTgxNTc0*_ga_8JE65Q40S6*czE3NTgxNzg3NTgkbzEwJGcxJHQxNzU4MTc4NzY2JGo1MiRsMCRoMA..",
                  caption: "Palampur",
                  height: 400,
                  postIndex: 15,
                  onProfileTap: (){

                  },
                ),
                Divider(color: Colors.grey),
                Posts(
                  profileImage:
                  "https://images.pexels.com/photos/45853/grey-crowned-crane-bird-crane-animal-45853.jpeg?_gl=1*1x6d2wq*_ga*MTU0NzE5MjI5My4xNzQxNTgxNTc0*_ga_8JE65Q40S6*czE3NTgxNzg3NTgkbzEwJGcxJHQxNzU4MTc4ODU4JGo0NyRsMCRoMA..",
                  username: "Abshike",
                  image:
                  "https://images.pexels.com/photos/45853/grey-crowned-crane-bird-crane-animal-45853.jpeg?_gl=1*1x6d2wq*_ga*MTU0NzE5MjI5My4xNzQxNTgxNTc0*_ga_8JE65Q40S6*czE3NTgxNzg3NTgkbzEwJGcxJHQxNzU4MTc4ODU4JGo0NyRsMCRoMA..",
                  caption: "Palampur",
                  height: 400,
                  postIndex: 16,
                  onProfileTap: (){

                  },

                ),
                Divider(color: Colors.grey),
                Posts(
                  profileImage:
                  "https://t3.ftcdn.net/jpg/09/48/23/44/240_F_948234435_ztemZs0URuuNXiLFovR9TwWnfEYL23nv.jpg",
                  username: "Core",
                  image:
                  "https://images.pexels.com/photos/887845/pexels-photo-887845.jpeg?_gl=1*s7kp26*_ga*MTU0NzE5MjI5My4xNzQxNTgxNTc0*_ga_8JE65Q40S6*czE3NTgxNzg3NTgkbzEwJGcxJHQxNzU4MTgwNjE0JGoyMSRsMCRoMA..",
                  caption: "Iran",
                  height: 400,
                  postIndex: 17,
                  onProfileTap: (){

                  },
                ),
                Divider(color: Colors.grey),
              ]),
            ),
          ],
        ),
      ),
    );
  }
}
