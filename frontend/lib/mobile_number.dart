import 'package:facebook/Email_verify.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class mobile_number extends StatelessWidget{
  const mobile_number({super.key});
  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
         children: [
             IconButton(onPressed: (){
               Navigator.push(context, MaterialPageRoute(builder: (context)=>Email_verify()));
             }, icon: Icon(Icons.arrow_back_ios_new)),
           Padding(padding: EdgeInsets.only(left: 30,top: 300),
        child:
           Text('Sorry this option is not available at this moment. Please try again later !!!',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 30),)
           )
         ],
        ),
      )
    );
  }
}