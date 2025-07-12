import 'package:facebook/appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'icons.dart';

class Friend_request extends StatefulWidget {
  const Friend_request({super.key});

  Friend_request_state createState() => Friend_request_state();
}

class Friend_request_state extends State<Friend_request> {
  final List<Map<String, dynamic>> peoples = [
    {
      'Picture': 'assets/images/CR7.jpg',
      'Name': 'Cristiano Ronaldo',
      'Confirm': 'Confirm',
      'Delete': 'Delete',
      'Time': '27 w',
      'isConfirmed':false,
      'isDeleted':false,
    },
    {
      'Picture': 'assets/images/Ronaldo.webp',
      'Name': 'Cristiano Ronaldo',
      'Confirm': 'Confirm',
      'Delete': 'Delete',
      'Time': '15 w',
      'isConfirmed':false,
      'isDeleted':false,
    },
    {
      'Picture': 'assets/images/Lewa.webp',
      'Name': 'Lewa',
      'Confirm': 'Confirm',
      'Delete': 'Delete',
      'Time': '10 w',
      'isConfirmed':false,
      'isDeleted':false,
    },
    {
      'Picture': 'assets/images/Pratik.png',
      'Name': 'Pratik',
      'Confirm': 'Confirm',
      'Delete': 'Delete',
      'Time': '5 w',
      'isConfirmed':false,
      'isDeleted':false,
    },
    {
      'Picture': 'assets/images/Mbappe.webp',
      'Name': 'Mbappe',
      'Confirm': 'Confirm',
      'Delete': 'Delete',
      'Time': '2 w',
      'isConfirmed':false,
      'isDeleted':false,
    },
    {
      'Picture': 'assets/images/Messi.webp',
      'Name': 'Messi',
      'Confirm': 'Confirm',
      'Delete': 'Delete',
      'Time': '1 w',
      'isConfirmed':false,
      'isDeleted':false,
    },
    {
      'Picture': 'assets/images/Neymar.jpg',
      'Name': 'Neymar',
      'Confirm': 'Confirm',
      'Delete': 'Delete',
      'Time': '3 d',
      'isConfirmed':false,
      'isDeleted':false,
    },
    {
      'Picture': 'assets/images/Vini.webp',
      'Name': 'Vini',
      'Confirm': 'Confirm',
      'Delete': 'Delete',
      'Time': '2 d',
      'isConfirmed':false,
      'isDeleted':false,
    },
    {
      'Picture': 'assets/images/Maldini.jpg',
      'Name': 'Maldini',
      'Confirm': 'Confirm',
      'Delete': 'Delete',
      'Time': '1 d',
      'isConfirmed':false,
      'isDeleted':false,
    },
    {
      'Picture': 'assets/images/Carlos.jpg',
      'Name': 'Carlos',
      'Confirm': 'Confirm',
      'Delete': 'Delete',
      'Time': '12 h',
      'isConfirmed':false,
      'isDeleted':false,
    },
    {
      'Picture': 'assets/images/Euro.webp',
      'Name': 'Cristiano Ronaldo',
      'Confirm': 'Confirm',
      'Delete': 'Delete',
      'Time': '5 h',
      'isConfirmed':false,
      'isDeleted':false,
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
                Text(
                  'Friends',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
                ),
              ],
            ),
            Align(
              alignment: Alignment.topLeft,
              child: Row(
                children: [
                  SizedBox(width: 15),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFFD6D6D6),
                    ),
                    onPressed: () {},
                    child: Text(
                      'Suggestions',
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                  SizedBox(width: 15),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFFD6D6D6),
                    ),
                    onPressed: () {},
                    child: Text(
                      'Your friends',
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            Row(
              children: [
                SizedBox(width: 5),
                Text(
                  'Friend requests',
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                ),
                Spacer(),
                TextButton(
                  onPressed: () {},
                  child: Text(
                    'See all',
                    style: TextStyle(color: Colors.blueAccent),
                  ),
                ),
              ],
            ),
            Expanded(
              child: ListView.builder(
                scrollDirection: Axis.vertical,
                itemCount: peoples.length,
                itemBuilder: (context, index) {
                  final peoples_index = peoples[index];
                  return Row(
                    children: [
                      SizedBox(width: 15),
                      CircleAvatar(
                        radius: 39,
                        backgroundImage: AssetImage(peoples_index['Picture']),
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(left: 6),
                                  child: Text(
                                    peoples_index['Name'],
                                    style: TextStyle(fontSize: 15),
                                  ),
                                ),
                                Spacer(),
                                Padding(
                                  padding: EdgeInsets.only(bottom: 10),
                                  child: Text(
                                    peoples_index['Time'],
                                    style: TextStyle(color: Colors.grey),
                                  ),
                                ),
                                SizedBox(width: 15),
                              ],
                            ),

                            if(peoples_index['isConfirmed'])
                              Padding(padding: EdgeInsets.only(left: 10),child:
                              SizedBox(
                            height: 15,
                              width: 200,
                              child:
                              Text('You are now friends'),
                              ),
                              )
                            else if(peoples_index['isDeleted'])
                              Padding(padding: EdgeInsets.only(left: 10),child:
                              SizedBox(
                                height: 15,
                                width: 200,
                                child:
                                Text('Friend request deleted'),
                              ),
                              )
                            else
                            Row(
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(
                                    left: 10,
                                    bottom: 15,
                                  ),
                                  child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      minimumSize: Size(140, 35),
                                      backgroundColor: Colors.blueAccent,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(7),
                                      ),
                                    ),
                                    onPressed: () {
                                      setState(() {
                                        peoples_index['isConfirmed']=true;
                                      });
                                    },
                                    child: Text(
                                      peoples_index['Confirm'],
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(width: 17),
                                Padding(
                                  padding: EdgeInsets.only(bottom: 15),
                                  child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: Color(0xFFD6D6D6),
                                      minimumSize: Size(140, 35),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(7),
                                      ),
                                    ),
                                    onPressed: () {
                                      setState(() {
                                        peoples_index['isDeleted']=true;
                                      });
                                    },
                                    child: Text(
                                      peoples_index['Delete'],
                                      style: TextStyle(color: Colors.black),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
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
