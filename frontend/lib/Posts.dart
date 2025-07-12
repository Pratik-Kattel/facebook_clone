import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'comments.dart';

class posts extends StatefulWidget {
  const posts({super.key});

  @override
  posts_state createState() => posts_state();
}

class posts_state extends State<posts> {
  static final List<Map<String, dynamic>> postData = [
    {
      'profilepicture': 'assets/images/Ronaldo.webp',
      'name': 'Cristiano Ronaldo',
      'time': '1h',
      'caption': "Messi, your talent is truly inspiring. Happy Birthday!",
      'postImage': 'assets/images/Messi.webp',
      'icon': Icons.public,
      'isliked': false,
      'like': 0,
      'share': 0,
      'open_comment': false,
      'comments': <String>[],
      'no_comments':0,
    },
    {
      'profilepicture': 'assets/images/Messi.webp',
      'name': 'Lionel Messi',
      'time': '2h',
      'caption': "Cristiano, your dedication drives the game forward. Cheers to greatness!",
      'postImage': 'assets/images/Euro.webp',
      'icon': Icons.public,
      'isliked': false,
      'like': 0,
      'share': 0,
      'open_comment': false,
      'comments': <String>[],
      'no_comments':0,
    },
    {
      'profilepicture': 'assets/images/CR7.jpg',
      'name': 'Cristiano Ronaldo',
      'time': '3h',
      'caption': "Lewandowski, you're a goal machine. Always respect your finishing skills!",
      'postImage': 'assets/images/Lewa.webp',
      'icon': Icons.public,
      'isliked': false,
      'like': 0,
      'share': 0,
      'open_comment': false,
      'comments': <String>[],
      'no_comments':0,
    },
    {
      'profilepicture': 'assets/images/Lewa.webp',
      'name': 'Robert Lewandowski',
      'time': '3h',
      'caption': "Cristiano, your career is nothing short of legendary. True inspiration!",
      'postImage': 'assets/images/CR7.jpg',
      'icon': Icons.public,
      'isliked': false,
      'like': 0,
      'share': 0,
      'open_comment': false,
      'comments': <String>[],
      'no_comments':0,
    },
    {
      'profilepicture': 'assets/images/Mbappe.webp',
      'name': 'Kylian Mbappé',
      'time': '4h',
      'caption': "Neymar, you taught me flair and fearlessness. Grateful to play beside you.",
      'postImage': 'assets/images/Neymar.jpg',
      'icon': Icons.public,
      'isliked': false,
      'like': 0,
      'share': 0,
      'open_comment': false,
      'comments': <String>[],
      'no_comments':0,
    },
    {
      'profilepicture': 'assets/images/Neymar.jpg',
      'name': 'Neymar Jr.',
      'time': '4h',
      'caption': "Mbappé, your speed and hunger are next level. Proud of your growth!",
      'postImage': 'assets/images/Mbappe.webp',
      'icon': Icons.public,
      'isliked': false,
      'like': 0,
      'share': 0,
      'open_comment': false,
      'comments': <String>[],
      'no_comments':0,
    },
    {
      'profilepicture': 'assets/images/Vini.webp',
      'name': 'Vinicius Junior',
      'time': '5h',
      'caption': "Maldini, your defensive composure is timeless. True football royalty!",
      'postImage': 'assets/images/Maldini.jpg',
      'icon': Icons.public,
      'isliked': false,
      'like': 0,
      'share': 0,
      'open_comment': false,
      'comments': <String>[],
      'no_comments':0,
    },
    {
      'profilepicture': 'assets/images/Maldini.jpg',
      'name': 'Paolo Maldini',
      'time': '5h',
      'caption': "Vinícius, your energy is electric. Keep dazzling the world, young star!",
      'postImage': 'assets/images/Vini.webp',
      'icon': Icons.public,
      'isliked': false,
      'like': 0,
      'share': 0,
      'open_comment': false,
      'comments': <String>[],
      'no_comments':0,
    },
    {
      'profilepicture': 'assets/images/Carlos.jpg',
      'name': 'Roberto Carlos',
      'time': '6h',
      'caption': "Maldini, it was always an honor facing you. You redefined defending.",
      'postImage': 'assets/images/Maldini.jpg',
      'icon': Icons.public,
      'isliked': false,
      'like': 0,
      'share': 0,
      'open_comment': false,
      'comments': <String>[],
      'no_comments':0,
    },
    {
      'profilepicture': 'assets/images/Maldini.jpg',
      'name': 'Paolo Maldini',
      'time': '6h',
      'caption': "Carlos, your thunderous runs and free kicks are unforgettable. Respect!",
      'postImage': 'assets/images/Carlos.jpg',
      'icon': Icons.public,
      'isliked': false,

      'like': 0,
      'share': 0,
      'open_comment': false,
      'comments': <String>[],
      'no_comments':0,
    },


  ];
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: postData.length,
      itemBuilder: (context, index) {
        final post = postData[index];
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 10),
            Row(
              children: [
                SizedBox(width: 5),
                CircleAvatar(
                  backgroundImage: AssetImage(post['profilepicture']),
                ),
                SizedBox(width: 6),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                            post['name'],
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                            ),
                          ),
                          SizedBox(width: 6),
                          Icon(Icons.verified, color: Colors.blue, size: 15),
                          Spacer(),
                          Icon(Icons.more_horiz, color: Colors.grey, size: 25),
                          SizedBox(width: 10),
                          Icon(Icons.close, color: Colors.grey, size: 20),
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                            post['time'],
                            style: TextStyle(color: Colors.grey),
                          ),
                          SizedBox(width: 10),
                          Text(
                            '.',
                            style: TextStyle(
                              fontSize: 15,
                              color: Colors.grey,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(width: 10),
                          Icon(post['icon'], size: 13, color: Colors.grey),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              child: Text(post['caption'], style: TextStyle(fontSize: 14)),
            ),
            Image.asset(post['postImage']),
            SizedBox(height: 5),
            SizedBox(
              height: 40,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xFFFAFAFA),
                        minimumSize: Size(89, 65),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                        ),
                      ),
                      onPressed: () {
                        setState(() {
                          post['isliked'] = !post['isliked'];
                          post['isliked']
                              ? post['like'] += 1
                              : post['like'] -= 1;
                        });
                      },
                      child: Row(
                        children: [
                          Icon(
                            Icons.thumb_up_alt_outlined,
                            color: post['isliked'] == true
                                ? Colors.blue
                                : Colors.grey,
                          ),
                          SizedBox(width: 4),
                          Text(
                            post['like'].toString(),
                            style: TextStyle(color: Colors.grey),
                          ),
                        ],
                      ),
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xFFFAFAFA),
                        minimumSize: Size(82, 65),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                        ),
                      ),
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>comments(likes:post['like'],shares:post['share'],username: post['name'],profile_picture: post['profilepicture'],comments_list: post['comments'],),),);
                      },
                      child: Row(
                        children: [
                          Icon(Icons.comment, color: Colors.grey),
                          SizedBox(width: 4),
                          Text(post['comments'].length.toString()),

                        ],
                      ),
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xFFFAFAFA),
                        minimumSize: Size(82, 65),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                        ),
                      ),
                      onPressed: () {},
                      child: Icon(
                        FontAwesomeIcons.facebookMessenger,
                        color: Colors.grey,
                      ),
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xFFFAFAFA),
                        minimumSize: Size(82, 65),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                        ),
                      ),
                      onPressed: () {
                        setState(() {
                          post['share'] += 1;
                        });
                      },
                      child: Row(
                        children: [
                          Icon(FontAwesomeIcons.share, color: Colors.grey),
                          SizedBox(width: 4),
                          Text(post['share'].toString()),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 3),
            Divider(thickness: 3, color: Colors.grey),
          ],
        );

      },
    );
  }
}