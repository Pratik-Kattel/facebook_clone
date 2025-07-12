import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'appbar.dart';
class plus_icon extends StatelessWidget {
  const plus_icon({super.key});
  Widget build(BuildContext context) {
    final List<Map<String,dynamic>> images=
    [
      {'image': 'assets/images/Ronaldo.webp'},
      {'image': 'assets/images/Ronaldo.webp'},
      {'image': 'assets/images/CR7.jpg'},
      {'image': 'assets/images/CR7.jpg'},
      {'image': 'assets/images/Lewa.webp'},
      {'image': 'assets/images/Lewa.webp'},
      {'image': 'assets/images/Mbappe.webp'},
      {'image': 'assets/images/Mbappe.webp'},
      {'image': 'assets/images/Messi.webp'},
      {'image': 'assets/images/Messi.webp'},
      {'image': 'assets/images/Neymar.jpg'},
      {'image': 'assets/images/Neymar.jpg'},
      {'image': 'assets/images/Vini.webp'},
      {'image': 'assets/images/Vini.webp'},
      {'image': 'assets/images/Maldini.jpg'},
      {'image': 'assets/images/Maldini.jpg'},
      {'image': 'assets/images/Carlos.jpg'},
      {'image': 'assets/images/Carlos.jpg'},
      {'image': 'assets/images/Euro.webp'},
      {'image': 'assets/images/Euro.webp'},
      {'image': 'assets/images/Ronaldo.webp'},
      {'image': 'assets/images/Ronaldo.webp'},
      {'image': 'assets/images/CR7.jpg'},
      {'image': 'assets/images/CR7.jpg'},
      {'image': 'assets/images/Lewa.webp'},
      {'image': 'assets/images/Lewa.webp'},
      {'image': 'assets/images/Mbappe.webp'},
      {'image': 'assets/images/Mbappe.webp'},
      {'image': 'assets/images/Messi.webp'},
      {'image': 'assets/images/Messi.webp'},
      {'image': 'assets/images/Neymar.jpg'},
      {'image': 'assets/images/Neymar.jpg'},
      {'image': 'assets/images/Vini.webp'},
      {'image': 'assets/images/Vini.webp'},
      {'image': 'assets/images/Maldini.jpg'},
      {'image': 'assets/images/Maldini.jpg'},
      {'image': 'assets/images/Carlos.jpg'},
      {'image': 'assets/images/Carlos.jpg'},
      {'image': 'assets/images/Euro.webp'},
      {'image': 'assets/images/Euro.webp'},
    ];

    final List<Map<String,dynamic>> containers=[
      {
        'gradient':[Color(0xFFDD2A7B), Color(0xFF8134AF)],
        'icon':Icons.edit,
        'text':'Text'
      },
      {
        'gradient': [Color(0xFF00C6FB), Color(0xFF005BEA)],
        'icon': Icons.music_note,
        'text': 'Music'
      },
      {
        'gradient': [Color(0xFF4A00E0), Color(0xFF8E2DE2)],
        'icon': Icons.camera_alt,
        'text': 'Camera'
      }
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Create Story',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) {
                return fb_appbar();
              }),
            );
          },
          icon: Icon(Icons.close),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(
                        height: 160,
                        child: ListView.builder(
                          itemCount: containers.length,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context,index) {
                            final container_details=containers[index];
                            return Container(
                              margin: EdgeInsets.only(left: 16,right: 10),
                              width: 110,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.all(Radius.circular(10)),
                                  gradient: LinearGradient(
                                    colors: container_details['gradient'],
                                  )),
                              child: Column(
                                children: [
                                  SizedBox(height: 45),
                                  CircleAvatar(
                                    radius: 28,
                                    child: Center(
                                        child: Icon(container_details['icon'])
                                    ),
                                  ),
                                  SizedBox(height: 5),
                                  Text(
                                    container_details['text'],
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  )
                                ],
                              ),
                            );
                          },
                        )
                    ),
                    Divider(
                      color: Colors.grey,
                      thickness: 0.5,
                    ),
                    Row(
                      children: [
                        SizedBox(width: 5),
                        Text(
                          'Gallery',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                        SizedBox(width: 176),
                        Container(
                          height: 35,
                          child: ElevatedButton(
                            onPressed: () {},
                            child: Row(
                              children: [
                                Icon(Icons.check_circle_outline, color: Colors.black),
                                Text(
                                  'Select multiple',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                  ),
                                )
                              ],
                            ),
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Color(0xFFD6D6D6),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(5)
                                )
                            ),
                          ),
                        )
                      ],
                    ),
                    SizedBox(height: 10),
                    Container(
                      child: GridView.builder(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3,
                        ),
                        scrollDirection: Axis.vertical,
                        itemCount: images.length,
                        itemBuilder: (context,index){
                          final imagedata = images[index];
                          return Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Container(
                                  margin: EdgeInsets.only(top: 5),
                                  height: 170,
                                  width: 130,
                                  child: Image.asset(
                                      imagedata['image'],
                                      fit: BoxFit.cover
                                  ),
                                )
                              ]
                          );
                        },
                      ),
                    ),
                  ],
                )
            ),
          ),
          SizedBox(
            height: 45,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                    height: 20,
                    width: 80,
                    child: ElevatedButton(
                      onPressed: () {},
                      child: Text('Post',style: TextStyle(color: Colors.black)),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xFFD6D6D6),
                      ),
                    )
                ),
                SizedBox(width: 20),
                Container(
                    height: 20,
                    width: 83,
                    child: ElevatedButton(
                      onPressed: () {},
                      child: Text('Story',style: TextStyle(color: Colors.black)),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xFFD6D6D6),
                      ),
                    )
                ),
                SizedBox(width: 20),
                Container(
                    height: 20,
                    width: 80,
                    child: ElevatedButton(
                      onPressed: () {},
                      child: Text('Reel',style: TextStyle(color: Colors.black)),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xFFD6D6D6),
                      ),
                    )
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
