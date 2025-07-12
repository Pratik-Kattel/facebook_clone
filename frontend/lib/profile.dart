import 'package:flutter/material.dart';

class FacebookProfilePage extends StatelessWidget {
  const FacebookProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cristiano Ronaldo'),
        actions: const [
          Icon(Icons.notifications),
          SizedBox(width: 10),
          Icon(Icons.search),
          SizedBox(width: 10),
        ],
        backgroundColor: Color(0xFF1877F2),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              alignment: Alignment.center,
              children: [
                Image.asset(
                  'assets/images/CR7.jpg',
                  width: double.infinity,
                  height: 220,
                  fit: BoxFit.cover,
                ),
                Positioned(
                  bottom: -50,
                  child: CircleAvatar(
                    radius: 60,
                    backgroundColor: Colors.white,
                    child: CircleAvatar(
                      radius: 56,
                      backgroundImage: AssetImage('assets/images/CR7.jpg'),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 60),

            // Name & Friend Count
            const Text(
              'Cristiano Ronaldo',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 4),
            const Text(
              '242 friends',
              style: TextStyle(color: Colors.grey),
            ),
            const SizedBox(height: 12),

            // Buttons
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                children: [
                  Expanded(
                    child: ElevatedButton.icon(
                      icon: const Icon(Icons.add),
                      label: const Text("Add to story"),
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xFF1877F2),
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: OutlinedButton.icon(
                      icon: const Icon(Icons.edit),
                      label: const Text("Edit profile"),
                      onPressed: () {},
                    ),
                  ),
                  const SizedBox(width: 10),
                  const Icon(Icons.more_horiz),
                ],
              ),
            ),
            const SizedBox(height: 12),

            // Tab Navigation
            const Divider(thickness: 0.8),
            DefaultTabController(
              length: 3,
              child: Column(
                children: const [
                  TabBar(
                    labelColor: Colors.blue,
                    unselectedLabelColor: Colors.black,
                    tabs: [
                      Tab(text: "Posts"),
                      Tab(text: "Photos"),
                      Tab(text: "Reels"),
                    ],
                  ),
                ],
              ),
            ),
            const Divider(thickness: 0.8),

            // Education Info
            ListTile(
              leading: const Icon(Icons.school),
              title: const Text.rich(TextSpan(children: [
                TextSpan(text: "Studied at "),
                TextSpan(
                    text: "Sporting Lisbon",
                    style: TextStyle(fontWeight: FontWeight.bold)),
              ])),
            ),
            ListTile(
              leading: const Icon(Icons.school),
              title: const Text.rich(TextSpan(children: [
                TextSpan(text: "Studied at "),
                TextSpan(
                    text: "Real Madrid",
                    style: TextStyle(fontWeight: FontWeight.bold)),
              ])),
            ),
            ListTile(
              leading: const Icon(Icons.school),
              title: const Text.rich(TextSpan(children: [
                TextSpan(text: "Studies at "),
                TextSpan(
                    text: "Al Nassr",
                    style: TextStyle(fontWeight: FontWeight.bold)),
              ])),
            ),
            ListTile(
              leading: const Icon(Icons.more_horiz),
              title: const Text("See more about yourself"),
            ),

            const Divider(),

            // Friends Section
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text("Friends", style: TextStyle(fontWeight: FontWeight.bold)),
                  Text("See all", style: TextStyle(color: Colors.blue)),
                ],
              ),
            ),
            const SizedBox(height: 10),
            SizedBox(
              height: 100,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 12),
                itemCount: 6,
                itemBuilder: (context, index) => friendCard('assets/images/Messi.webp'),
              ),
            ),
          ],
        ),
      ),
    );
  }

  static Widget friendCard(String imagePath) {
    return Container(
      width: 70,
      margin: const EdgeInsets.only(right: 10),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: Image.asset(imagePath, fit: BoxFit.cover),
      ),
    );
  }
}
