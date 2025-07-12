import 'package:facebook/Videos.dart';
import 'package:flutter/material.dart' hide Notification;
import 'package:flutter/widgets.dart' hide Notification;
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'status.dart';
import 'Friend_request.dart';
import 'messages.dart';
import 'Notifactions.dart';

class icons extends StatefulWidget{
   const icons({super.key});
  icons_state createState()=> icons_state();

}
class icons_state extends State<icons> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(body:
    SafeArea(
        child:
        Column(
          children: [
            Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    onPressed: () {
                      setState(() {
                        selectedIndex = 0;
                      });
                    },
                    icon: Icon(
                      Icons.home,
                      color: selectedIndex == 0 ? Colors.blue : Colors.grey,
                      size: 30,
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      setState(() {
                        Navigator.push(context, MaterialPageRoute(builder: (context) {return Friend_request();}));
                        selectedIndex = 1;
                      });
                    },
                    icon: Icon(
                      Icons.group_outlined,
                      color: selectedIndex == 1 ? Colors.blue : Colors.grey,
                      size: 30,
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      Navigator.push(context,MaterialPageRoute(builder: (context)=>messages()));
                      setState(() {
                        selectedIndex = 2;
                      });
                    },
                    icon: Icon(
                      FontAwesomeIcons.facebookMessenger,
                      color: selectedIndex == 2 ? Colors.blue : Colors.grey,
                      size: 24,
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>Videos()));
                      setState(() {
                        selectedIndex = 3;
                      });
                    },
                    icon: Icon(
                      Icons.ondemand_video,
                      color: selectedIndex == 3 ? Colors.blue : Colors.grey,
                      size: 24,
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>Notification()));
                      setState(() {
                        selectedIndex = 4;
                      });
                    },
                    icon: Icon(
                      Icons.notifications,
                      color: selectedIndex == 4 ? Colors.blue : Colors.grey,
                      size: 30,
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      setState(() {
                        selectedIndex = 5;
                      });
                    },
                    icon: Icon(
                      Icons.local_convenience_store_rounded,
                      color: selectedIndex == 5 ? Colors.blue : Colors.grey,
                      size: 30,
                    ),
                  ),
                ]
            ),
            Divider(
              color: Colors.grey,
              thickness: 0.4,
            ),
            Expanded(
              child: Status()
            )
          ],
        )
    )
    );
  }
}