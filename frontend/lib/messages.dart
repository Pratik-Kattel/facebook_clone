import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'appbar.dart';

class messages extends StatefulWidget {
  const messages({super.key});

  messages_state createState() => messages_state();
}

class messages_state extends State<messages> {
  final List<Map<String, dynamic>> messages = [
    {
      'Profile picture': 'assets/images/Ronaldo.webp',
      'Name': 'Ronaldo',
      'Message': 'Hello I\'m Cristiano Ronaldo',
      'isStory': true,
      'message_count': 1,
    },
    {
      'Profile picture': 'assets/images/CR7.jpg',
      'Name': 'CR7',
      'Message': 'Another goal added to my legacy!',
      'isStory': true,
      'message_count': 3,
    },
    {
      'Profile picture': 'assets/images/Lewa.webp',
      'Name': 'Lewandowski',
      'Message': 'Scoring goals is an art.',
      'isStory': false,
      'message_count': 2,
    },
    {
      'Profile picture': 'assets/images/Pratik.png',
      'Name': 'Pratik',
      'Message': 'Let’s watch the Champions League tonight!',
      'isStory': false,
      'message_count': 5,
    },
    {
      'Profile picture': 'assets/images/Mbappe.webp',
      'Name': 'Mbappe',
      'Message': 'Speed is my weapon.',
      'isStory': true,
      'message_count': 4,
    },
    {
      'Profile picture': 'assets/images/Messi.webp',
      'Name': 'Messi',
      'Message': 'Passing is poetry in motion.',
      'isStory': true,
      'message_count': 2,
    },
    {
      'Profile picture': 'assets/images/Neymar.jpg',
      'Name': 'Neymar',
      'Message': 'Dribble, dance, repeat.',
      'isStory': false,
      'message_count': 1,
    },
    {
      'Profile picture': 'assets/images/Vini.webp',
      'Name': 'Vini.',
      'Message': 'Brazilian magic on the left wing!',
      'isStory': true,
      'message_count': 3,
    },
    {
      'Profile picture': 'assets/images/Maldini.jpg',
      'Name': 'Maldini',
      'Message': 'Defense wins championships.',
      'isStory': false,
      'message_count': 1,
    },
    {
      'Profile picture': 'assets/images/Carlos.jpg',
      'Name': 'Carlos',
      'Message': 'Left foot thunderbolt activated!',
      'isStory': false,
      'message_count': 2,
    },
    {
      'Profile picture': 'assets/images/Euro.webp',
      'Name': 'Ronaldo.C',
      'Message': 'Winning the Euros was unforgettable.',
      'isStory': true,
      'message_count': 1,
    },
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Row(
              children: [
                IconButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => fb_appbar()),
                    );
                  },
                  icon: Icon(Icons.arrow_back_ios_new),
                ),
                SizedBox(width: 10),
                Text(
                  'Messages',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                ),
                Spacer(),
                CircleAvatar(
                  radius: 20,
                  backgroundColor: Color(0xFFD6D6D6),
                  child: IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.settings, color: Colors.black),
                  ),
                ),
                SizedBox(width: 20),
                CircleAvatar(
                  radius: 20,
                  backgroundColor: Color(0xFFD6D6D6),
                  child: IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.search, color: Colors.black),
                  ),
                ),
                SizedBox(width: 15),
              ],
            ),
            SizedBox(
              height: 120,
              child: ListView.builder(
                itemCount: messages.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  final message_index = messages[index];
                  return Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: 10, top: 10),
                        child: Container(
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: message_index['isStory']
                                ? Border.all(
                                    color: Colors.blueAccent,
                                    width: 2.2,
                                  )
                                : Border.all(
                                    color: Colors.transparent,
                                    width: 2.2,
                                  ),
                          ),
                          child: Center(
                            child: Padding(
                              padding: EdgeInsets.all(2.2),
                              child: CircleAvatar(
                                radius: 30,
                                backgroundImage: AssetImage(
                                  message_index['Profile picture'],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 5, left: 10),
                        child: Text(message_index['Name']),
                      ),
                      SizedBox(height: 10),
                    ],
                  );
                },
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: messages.length,
                scrollDirection: Axis.vertical,
                itemBuilder: (context, index) {
                  final message_index = messages[index];
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 12),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CircleAvatar(
                          radius: 28,
                          backgroundImage: AssetImage(
                            message_index['Profile picture'],
                          ),
                        ),
                        SizedBox(width: 12),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                message_index['Name'],
                                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                              ),
                              SizedBox(height: 6),
                              Row(
                                children: [
                                  CircleAvatar(
                                    backgroundColor: Colors.red,
                                    radius: 7,
                                    child: Center(
                                      child: Text(
                                        message_index['message_count'].toString(),
                                        style: TextStyle(color: Colors.white, fontSize: 10),
                                      ),
                                    ),
                                  ),
                                  SizedBox(width: 6),
                                  Expanded(
                                    child: Text(
                                      message_index['Message'],
                                      style: TextStyle(color: Colors.black),
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
