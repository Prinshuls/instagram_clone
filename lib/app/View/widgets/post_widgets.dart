import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get/get.dart';
import 'package:instagram_clone/app/Controller/getxController.dart';

class Posts extends StatelessWidget {
  final String profileImage;
  final String username;
  final List<String>? images;
  final String? image;
  final String caption;
  final int height;
  final int postIndex;
  final VoidCallback? onProfileTap;

  Posts({
    required this.profileImage,
    required this.username,
    this.images,
    this.image,
    required this.caption,
    required this.height,
    required this.postIndex,
    required this.onProfileTap,
  });
  final PostController controller = Get.put(PostController());
  final PageController pageController = PageController();
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (controller.ishidde(postIndex)) {
        return ListTile(
          title: Text(
            "This Post is Hidde",
            style: TextStyle(color: Colors.grey),
          ),
          trailing: TextButton(
            onPressed: () {
              controller.undoPost(postIndex);
            },
            child: Text("Undo"),
          ),
        );
      }

      Widget postImage;
      if (images != null && images!.isNotEmpty) {
        postImage = Column(
          children: [
            Stack(
              alignment: Alignment.topRight,
              children: [
                SizedBox(
                  height: height.toDouble(),
                  child: PageView.builder(
                    controller: pageController,
                    itemCount: images!.length,
                    onPageChanged: (index) =>
                        controller.currentIndex.value = index,
                    itemBuilder: (context, index) {
                      return Image.network(images![index], fit: BoxFit.cover);
                    },
                  ),
                ),
                Obx(
                  () => Container(
                    margin: EdgeInsets.all(12),
                    padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text(
                      "${controller.currentIndex.value + 1} /${images!.length}",
                      style: TextStyle(color: Colors.white, fontSize: 12),
                    ),
                  ),
                ),
              ],
            ),

            Obx(
              () => Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(images!.length, (index) {
                  return Container(
                    margin: EdgeInsets.all(3),
                    width: controller.currentIndex.value == index ? 10 : 6,
                    height: controller.currentIndex.value == index ? 10 : 6,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: controller.currentIndex.value == index
                          ? Colors.blue
                          : Colors.grey,
                    ),
                  );
                }),
              ),
            ),
          ],
        );
      } else if (image != null) {
        postImage = Image.network(
          image!,
          fit: BoxFit.cover,
          width: double.infinity,
          height: height.toDouble(),
        );
      } else {
        postImage = SizedBox();
      }
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ListTile(
            leading: GestureDetector(
              onTap: () {
                controller.openProfile(
                  username: username,
                  profileImage: profileImage,
                );
              },
              child: CircleAvatar(backgroundImage: NetworkImage(profileImage)),
            ),
            title: GestureDetector(
              onTap: () {
                controller.openProfile(
                  username: username,
                  profileImage: profileImage,
                );
              },
              child: Text(username, style: GoogleFonts.acme(fontSize: 20)),
            ),
            subtitle: Text("India", style: TextStyle(color: Colors.grey)),
            trailing: GestureDetector(
              onTap: () {
                showBottomSheet(context);
              },
              child: Icon(Icons.more_vert_sharp),
            ),
          ),
          postImage,
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 1, vertical: 4),
            child: Row(
              children: [
                Obx(
                  () => IconButton(
                    onPressed: () {
                      controller.toogle(postIndex);
                    },
                    icon: Icon(
                      controller.isLiked(postIndex)
                          ? Icons.favorite
                          : Icons.favorite_border,
                      color: controller.isLiked(postIndex)
                          ? Colors.red
                          : Colors.black,
                    ),
                  ),
                ),
                CircleAvatar(
                  radius: 10,
                  backgroundColor: Colors.white,
                  child: InkWell(
                    onTap: () {
                      showModalBottomSheet(
                        context: context,
                        isScrollControlled: true,
                        builder: (context) {
                          return Padding(
                            padding: MediaQuery.of(context).viewInsets,
                            child: Container(
                              height: 300,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Divider(height: 1),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Row(
                                      children: [
                                        Expanded(
                                          child: TextField(
                                            decoration: InputDecoration(
                                              hintText: "Comment",
                                              suffixIcon: IconButton(
                                                onPressed: () {
                                                  Get.back();
                                                },
                                                icon: Icon(
                                                  Icons.send,
                                                  color: Colors.blue,
                                                ),
                                              ),
                                              border: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(20),
                                              ),
                                              contentPadding:
                                                  EdgeInsets.symmetric(
                                                    horizontal: 16,
                                                  ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      );
                    },
                    child: Image.asset(
                      'assets/images/Shape.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                SizedBox(width: 15),
                CircleAvatar(
                  radius: 10,
                  backgroundColor: Colors.white,
                  child: Image.asset(
                    'assets/images/send.png',
                    fit: BoxFit.cover,
                  ),
                ),
                SizedBox(width: 225),
                Obx(
                  () => IconButton(
                    onPressed: () {
                      controller.saveToogle(postIndex);
                    },
                    icon: controller.isSave(postIndex)
                        ? Icon(Icons.bookmark, color: Colors.black)
                        : Icon(Icons.bookmark_border, color: Colors.black),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 12),
            child: Text(
              "Liked by user123 and 1,024 others",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 5),
            child: RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: "$username ",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  TextSpan(
                    text: caption,
                    style: TextStyle(color: Colors.black),
                  ),
                ],
              ),
            ),
          ),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Text(
              "View all 245 comments",
              style: TextStyle(color: Colors.grey),
            ),
          ),
          SizedBox(height: 10),
        ],
      );
    });
  }

  void showBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) {
        return ListView(
          children: [
            ListTile(
              leading: Icon(Icons.hide_source,color: Colors.red,),
              title: Text("Hide"),
              onTap: () {
                controller.hiddePost(postIndex);
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.person_remove, color: Colors.pink),
              title: Text("UnFollow"),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.link,color: Colors.blue,),
              title: Text("Copy Link"),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.share,color: Colors.purple),
              title: Text("Share"),
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ],
        );
      },
    );
  }
}

/*
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get/get.dart';
import 'package:instagram_clone/app/Controller/getxController.dart';

class Posts extends StatelessWidget {
  final String profileImage;
  final String username;
  final List<String>? images;
  final String? image;
  final String caption;
  final int height;
  final int postIndex;
  final VoidCallback? onProfileTap;

  Posts({
    Key? key,
    required this.profileImage,
    required this.username,
    this.images,
    this.image,
    required this.caption,
    required this.height,
    required this.postIndex,
    required this.onProfileTap,
  }) : super(key: key);

  final PostController controller = Get.find<PostController>();
  final PageController pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (controller.ishidde(postIndex)) {
        return ListTile(
          title: Text(
            "This post is Hidde", style: TextStyle(color: Colors.grey),),
          trailing: TextButton(
            onPressed: () {
              controller.undoPost(postIndex);
            },
            child: Text("Undo"),
          ),
        );
      }

      /// Image widget logic
      Widget postImage;
      if (images != null && images!.isNotEmpty) {
        postImage = Column(
          children: [
            Stack(
              alignment: Alignment.topRight,
              children: [
                SizedBox(
                  height: height.toDouble(),
                  child: PageView.builder(
                    controller: pageController,
                    itemCount: images!.length,
                    onPageChanged: (index) =>
                    controller.currentIndex.value = index,
                    itemBuilder: (context, index) {
                      return Image.network(images![index], fit: BoxFit.cover);
                    },
                  ),
                ),
                Obx(
                      () =>
                      Container(
                        margin: const EdgeInsets.all(12),
                        padding:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                        decoration: BoxDecoration(
                          color: Colors.black.withOpacity(0.6),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Text(
                          "${controller.currentIndex.value + 1}/${images!
                              .length}",
                          style: const TextStyle(
                              color: Colors.white, fontSize: 12),
                        ),
                      ),
                ),
              ],
            ),
            Obx(
                  () =>
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(images!.length, (index) {
                      return Container(
                        margin: const EdgeInsets.all(3),
                        width: controller.currentIndex.value == index ? 10 : 6,
                        height: controller.currentIndex.value == index ? 10 : 6,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: controller.currentIndex.value == index
                              ? Colors.blue
                              : Colors.grey,
                        ),
                      );
                    }),
                  ),
            ),
          ],
        );
      } else if (image != null) {
        postImage = Image.network(
          image!,
          fit: BoxFit.cover,
          width: double.infinity,
          height: height.toDouble(),
        );
      } else {
        postImage = const SizedBox();
      }

      /// Main return widget
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // 🔹 Post Header
          ListTile(
            leading: GestureDetector(
              onTap: () =>
                  controller.openProfile(
                      username: username, profileImage: profileImage),
              child: CircleAvatar(backgroundImage: NetworkImage(profileImage)),
            ),
            title: GestureDetector(
              onTap: () =>
                  controller.openProfile(
                      username: username, profileImage: profileImage),
              child: Text(username, style: GoogleFonts.acme(fontSize: 20)),
            ),
            trailing: IconButton(
              icon: const Icon(Icons.more_vert_sharp),
              onPressed: () => _showPostOptions(context),
            ),
          ),

          // 🔹 Post Image(s)
          postImage,

          // 🔹 Action Buttons
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            child: Row(
              children: [
                // Like button
                Obx(
                      () =>
                      IconButton(
                        onPressed: () => controller.toogle(postIndex),
                        icon: Icon(
                          controller.isLiked(postIndex)
                              ? Icons.favorite
                              : Icons.favorite_border,
                          color: controller.isLiked(postIndex)
                              ? Colors.red
                              : Colors.black,
                        ),
                      ),
                ),
                // Comment button
                IconButton(
                  icon: Image.asset('assets/images/Shape.png', height: 20),
                  onPressed: () => _showCommentSheet(context),
                ),
                // Share button
                IconButton(
                  icon: Image.asset('assets/images/send.png', height: 20),
                  onPressed: () {},
                ),
                const Spacer(),
                // Save button
                IconButton(
                  icon: Image.asset('assets/images/Save.png', height: 20),
                  onPressed: () {},
                ),
              ],
            ),
          ),

          // 🔹 Likes
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Text(
              "Liked by user123 and 1,024 others",
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
          ),

          // 🔹 Caption
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 5),
            child: RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: "$username ",
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.black),
                  ),
                  TextSpan(
                    text: caption,
                    style: const TextStyle(color: Colors.black),
                  ),
                ],
              ),
            ),
          ),

          // 🔹 Comments preview
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 12),
            child: Text(
              "View all 245 comments",
              style: TextStyle(color: Colors.grey),
            ),
          ),
          const SizedBox(height: 10),
        ],
      );
    });
  }

  /// Post Options Sheet
  void _showPostOptions(BuildContext context) {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(12)),
      ),
      builder: (context) {
        return Wrap(
          children: [
            ListTile(
              leading: const Icon(Icons.hide_source),
              title: const Text("Hide"),
              onTap: () {
                controller.hiddePost(postIndex);
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.person_remove, color: Colors.red),
              title: const Text("UnFollow"),
              onTap: () => Navigator.pop(context),
            ),
            ListTile(
              leading: const Icon(Icons.link),
              title: const Text("Copy Link"),
              onTap: () => Navigator.pop(context),
            ),
            ListTile(
              leading: const Icon(Icons.share),
              title: const Text("Share"),
              onTap: () => Navigator.pop(context),
            ),
          ],
        );
      },
    );
  }

  /// Comment Bottom Sheet
  void _showCommentSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (context) {
        return Padding(
          padding: MediaQuery.of(context).viewInsets,
          child: Container(
            height: 300,
            padding: const EdgeInsets.all(12),
            child: Column(
              children: [
                const Divider(),
                Row(
                  children: [
                    Expanded(
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: "Add a comment...",
                          suffixIcon: IconButton(
                            icon: const Icon(Icons.send, color: Colors.blue),
                            onPressed: () => Get.back(),
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          contentPadding:
                          const EdgeInsets.symmetric(horizontal: 16),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
 */
