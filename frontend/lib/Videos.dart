import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'appbar.dart';

class Videos extends StatefulWidget{
  const Videos({super.key});
  Videos_state createState()=>Videos_state();
}
class Videos_state extends State<Videos>{
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
            Text('Currently No videos available, please try again later!!',style: TextStyle(fontSize: 20),)
            )
          ],
        )
      ),
    );
  }
}