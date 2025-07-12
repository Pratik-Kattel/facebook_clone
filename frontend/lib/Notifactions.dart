import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'appbar.dart';

class Notification extends StatefulWidget{
  const Notification({super.key});
  Notification_state createState()=>Notification_state();
}
class Notification_state extends State<Notification>{
  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: SafeArea(
          child: Column(
            children: [
              Align(
                alignment: Alignment.topLeft,
                child: IconButton(onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>fb_appbar()));
                }, icon: Icon(Icons.arrow_back_ios_new)),
              ),
              SizedBox(
                height: 350,
              ),
              Padding(padding: EdgeInsets.only(left: 15),child:
              Text('Currently No any notifications, come up later !!',style: TextStyle(fontSize: 20),)
              )
            ],
          )
      ),
    );
  }
}