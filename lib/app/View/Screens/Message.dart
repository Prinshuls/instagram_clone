import 'package:flutter/material.dart';


class ChatListScreen extends StatelessWidget {
  final List<Map<String, String>> chatList = [
    {
      'name': 'joshua_l',
      'message': 'Have a nice day, bro!',
      'time': 'now',
      'image': 'https://i.pravatar.cc/150?img=1'
    },
    {
      'name': 'karenne',
      'message': 'I heard this is a good movie, s...',
      'time': 'now',
      'image': 'https://i.pravatar.cc/150?img=2'
    },
    {
      'name': 'martini_rond',
      'message': 'See you on the next meeting!',
      'time': '15m',
      'image': 'https://i.pravatar.cc/150?img=3'
    },
    {
      'name': 'andrewww_',
      'message': 'Sounds good ',
      'time': '20m',
      'image': 'https://i.pravatar.cc/150?img=4'
    },
    {
      'name': 'kiero_d',
      'message': 'The new design looks cool, b...',
      'time': '1m',
      'image': 'https://i.pravatar.cc/150?img=5'
    },
    {
      'name': 'maxjacobson',
      'message': 'Thank you, bro!',
      'time': '2h',
      'image': 'https://i.pravatar.cc/150?img=6'
    },
    {
      'name': 'jamie.franco',
      'message': 'Yeap, I\'m going to travel in To...',
      'time': '4h',
      'image': 'https://i.pravatar.cc/150?img=7'
    },
    {
      'name': 'm_humphrey',
      'message': 'Instagram UI is pretty good',
      'time': '5h',
      'image': 'https://i.pravatar.cc/150?img=8'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('King', style: TextStyle(color: Colors.black)),
        centerTitle: false,
        backgroundColor: Colors.white,
        elevation: 0.5,
        actions: [
          IconButton(
            icon: Icon(Icons.add, color: Colors.black),
            onPressed: () {},
          ),
        ],
      ),
      body: Column(
        children: [
          // Search Bar
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Search',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
          ),
          // Chat List
          Expanded(
            child: ListView.builder(
              itemCount: chatList.length,
              itemBuilder: (context, index) {
                final chat = chatList[index];
                return ListTile(
                  leading: CircleAvatar(
                    backgroundImage: NetworkImage(chat['image']!),
                  ),
                  title: Text(chat['name']!),
                  subtitle: Text(chat['message']!,
                      maxLines: 1, overflow: TextOverflow.ellipsis),
                  trailing: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(chat['time']!),
                      SizedBox(height: 4),
                      Icon(Icons.camera_alt_outlined, size: 18),
                    ],
                  ),
                );
              },
            ),
          ),
          // Bottom camera text
          Padding(
            padding: const EdgeInsets.only(bottom: 12.0),
            child: Text("📷 Camera", style: TextStyle(color: Colors.blue)),
          ),
        ],
      ),
    );
  }
}
