import 'package:flutter/material.dart';
import 'plus_icon.dart';

class stories extends StatefulWidget {
  const stories({super.key});

  @override
  stories_state createState() => stories_state();
}
class stories_state extends State<stories> {
  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> storydata = [
      {
        'isCreate': true,
        'image': 'assets/images/CR7.jpg',
        'name': 'Create story',
        'StoryCount': '',
      },
      {
        'image': 'assets/images/Ronaldo.webp',
        'name': 'Cristiano Ronaldo',
        'StoryCount': '1',
      },
      {'image': 'assets/images/Messi.webp', 'name': 'Messi', 'StoryCount': '2'},
      {'image': 'assets/images/Maldini.jpg', 'name': 'Maldini', 'StoryCount': '2'},
      {'image': 'assets/images/Carlos.jpg', 'name': 'Carlos', 'StoryCount': '2'},
      {'image': 'assets/images/Lewa.webp', 'name': 'Lewandowski', 'StoryCount': '2'},
      {'image': 'assets/images/Mbappe.webp', 'name': 'Mbappe', 'StoryCount': '2'},
      {'image': 'assets/images/Neymar.jpg', 'name': 'Neymar', 'StoryCount': '2'},
      {'image': 'assets/images/Vini.webp', 'name': 'Vinicius', 'StoryCount': '2'},
    ];
    return Column(
      children: [
        SizedBox(height: 5),
        SizedBox(
          height: 180,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: storydata.length,
            padding: EdgeInsets.symmetric(horizontal: 10),
            itemBuilder: (context, index) {
              final story = storydata[index];

              if (story.containsKey('isCreate') && story['isCreate']) {
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => plus_icon()),
                    );
                  },
                  child: Container(
                    margin: EdgeInsets.only(right: 10),
                    width: 120,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black12,
                          blurRadius: 4,
                          offset: Offset(2, 2),
                        ),
                      ],
                    ),
                    child: Column(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20),
                            topRight: Radius.circular(20),
                          ),
                          child: Image.asset(
                            story['image'],
                            height: 100,
                            width: 120,
                            fit: BoxFit.cover,
                          ),
                        ),
                        Container(
                          height: 80,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.vertical(
                              bottom: Radius.circular(20),
                            ),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              CircleAvatar(
                                backgroundColor: Colors.blue,
                                radius: 14,
                                child: Icon(
                                  Icons.add,
                                  color: Colors.white,
                                  size: 25,
                                ),
                              ),
                              SizedBox(height: 8),
                              Text(
                                'Create story',
                                style: TextStyle(
                                  color: Colors.blue,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 12,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              } else {
                return Container(
                  margin: EdgeInsets.only(right: 10),
                  width: 120,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black12,
                        blurRadius: 4,
                        offset: Offset(2, 2),
                      ),
                    ],
                  ),
                  child: Stack(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Image.asset(
                          story['image'],
                          height: 180,
                          width: 120,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Positioned(
                        left: 10,
                        bottom:0.5,
                        child: Container(
                          width: 70,
                          child: Text(
                            story['name'],
                            style: TextStyle(
                              overflow: TextOverflow.ellipsis,
                              color: Colors.white,
                              fontSize: 13,
                              fontWeight: FontWeight.bold,
                              shadows: [
                                Shadow(
                                  offset: Offset(0, 0),
                                  blurRadius: 3,
                                  color: Colors.black87,
                                ),
                              ],
                            ),
                            softWrap: true,
                            overflow: TextOverflow.visible,
                          ),
                        ),
                      ),
                      Positioned(
                        top: 5,
                        right: 14,
                        child: Container(
                          height: 22,
                          width: 20,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(3)),
                            color: Colors.blue,
                          ),
                          child: Center(
                            child: Text(
                              story['StoryCount'],
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              }
            },
          ),
        ),
      ],
    );
  }
}
