import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:instagram_clone/app/Model/routes/app_routes.dart';
class ProfileScreen extends StatelessWidget {
  final TextEditingController nameController =
  TextEditingController(text: "Jacob West");
  final TextEditingController usernameController =
  TextEditingController(text: "jacob_w");
  final TextEditingController websiteController = TextEditingController();
  final TextEditingController bioController = TextEditingController(
      text: "Digital goodies designer @pixsellz\nEverything is designed.");
  final TextEditingController emailController =
  TextEditingController(text: "jacob.west@gmail.com");
  final TextEditingController phoneController =
  TextEditingController(text: "+91 987 654 4321");
  final TextEditingController genderController =
  TextEditingController(text: "Male");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TextButton(
              onPressed: (){
                Get.off(AppRoutes.home);
              },
              child: Text("Cancel",style: TextStyle(color: Colors.blue),),
            ),
            Text("Edit Profile",style: TextStyle(fontSize: 30),),
            TextButton(
              onPressed: (){

              },
              child: Text("Done",style: TextStyle(color: Colors.blue),),
            )
          ],
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            SizedBox(height: 20),

            // Profile photo
            Center(
              child: Column(
                children: [
                  CircleAvatar(
                    radius: 45,
                    backgroundImage: NetworkImage(
                      "https://i.pravatar.cc/150?img=11",
                    ),
                  ),
                  SizedBox(height: 10),
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      "Change Profile Photo",
                      style: TextStyle(color: Colors.blue),
                    ),
                  ),
                ],
              ),
            ),

            SizedBox(height: 20),

            _buildTextField("Name", nameController),
            _buildTextField("Username", usernameController),
            _buildTextField("Website", websiteController, hint: "Website"),
            _buildTextField("Bio", bioController, maxLines: 3),

            SizedBox(height: 10),

            Align(
              alignment: Alignment.centerLeft,
              child: TextButton(
                onPressed: () {},
                child: Text(
                  "Switch to Professional Account",
                  style: TextStyle(color: Colors.blue),
                ),
              ),
            ),

            Divider(height: 30),

            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Private Information",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
            ),
            SizedBox(height: 10),
            _buildTextField("Email", emailController),
            _buildTextField("Phone", phoneController),
            _buildTextField("Gender", genderController),
            SizedBox(height: 30),
          ],
        ),
      ),
    );
  }

  Widget _buildTextField(String label, TextEditingController controller,
      {int maxLines = 1, String? hint}) {
    return Padding(
      padding: const EdgeInsets.only(top: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(label,
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500)),
          TextField(
            controller: controller,
            maxLines: maxLines,
            decoration: InputDecoration(
              hintText: hint,
              isDense: true,
              contentPadding: EdgeInsets.symmetric(vertical: 10),
              border: UnderlineInputBorder(),
            ),
          ),
        ],
      ),
    );
  }
}
