import 'package:facebook/icons.dart';
import 'package:facebook/status.dart';
import 'package:flutter/material.dart';
import 'plus_icon.dart';

class fb_appbar extends StatefulWidget{
  const fb_appbar({super.key});
  appbar_state createState()=> appbar_state();
}
class appbar_state extends State<fb_appbar>{
  @override
  Widget build (BuildContext context){
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title:
        TextButton(onPressed: (){}, child: Text('Facebook'
          ,style: TextStyle(
            fontSize: 22,
            color: Colors.blue,
            fontWeight: FontWeight.bold,
          ),
        )

        ),
        actions: [
          Padding(padding: EdgeInsets.all(12),
            child: GestureDetector(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context){return plus_icon();}
                )
                );
              },
              child: CircleAvatar(
                backgroundColor: Color(0xFFD6D6D6),
                child: Icon(Icons.add,color: Colors.black),
              ),
            ),
          ),
          Padding(padding: EdgeInsets.all(12),
            child: GestureDetector(
              onTap: (){},
              child: CircleAvatar(
                backgroundColor: Color(0xFFD6D6D6),
                child: Icon(Icons.search,color: Colors.black,),
              ),
            ),
          ),
          Padding(padding: EdgeInsets.all(12),
            child: GestureDetector(
              onTap: (){},
              child: CircleAvatar(
                backgroundColor: Color(0xFFD6D6D6),
                child: Icon(Icons.menu,color: Colors.black),
              ),
            ),
          )
        ],
      ),
      body: icons(),
    );
  }
}