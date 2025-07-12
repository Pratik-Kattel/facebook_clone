import 'package:facebook/icons.dart';
import 'package:flutter/material.dart';
import 'Stories.dart';
import 'Posts.dart';
import 'profile.dart';

class Status extends StatefulWidget {
  const Status({super.key});

  @override
  State<Status> createState() => _StatusState();
}

class _StatusState extends State<Status> {
  @override
  Widget build(BuildContext context) {
    return
      ListView(
      padding: EdgeInsets.zero,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child: Row(
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => FacebookProfilePage()));
                },
                child: CircleAvatar(
                  radius: 23,
                  backgroundImage: AssetImage('assets/images/CR7.jpg'),
                  backgroundColor: Colors.transparent,
                ),
              ),
              SizedBox(width: 20),
              Expanded(
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFFD6D6D6),
                  ),
                  child: Text(
                    'What\'s on your mind?',
                    style: TextStyle(
                      letterSpacing: 1.2,
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
              SizedBox(width: 10),
              IconButton(
                onPressed: () {},
                icon: Icon(Icons.photo_library_rounded),
                color: Colors.green,
              ),
            ],
          ),
        ),
        Divider(
          color: Colors.grey,
          thickness: 3,
        ),
        // Stories section - fixed height, horizontally scrollable
        SizedBox(
          height: 190,
          child: const stories(),
        ),
        Divider(
          color: Colors.grey,
          thickness: 3,
        ),
        // Posts section
        const posts(),
      ],
    );
  }
}