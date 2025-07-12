import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:facebook/Login.dart';
class change_password extends StatefulWidget{
     final String email;
   change_password({super.key,required this.email});
  change_password_state createState()=> change_password_state();
}
class change_password_state extends State<change_password>{
  final password=new TextEditingController();
  final confirm_password=new TextEditingController();
  Future<void> new_password() async{
    if(password.text!=confirm_password.text){
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Password did\'t match')));
      password.clear();
      confirm_password.clear();
      return;
    }
    final url=Uri.parse('http://10.0.2.2:3000/update_password/update_password');
    final response=await http.post(url,
    headers: {'Content-Type' :'application/json'},
      body: jsonEncode(
      {
        'email':widget.email,
        'newpassword':confirm_password.text,
      }
      )
    );
    print('Response Status: ${response.statusCode}');
    print('Response Body: ${response.body}');
    final body=jsonDecode(response.body);
     if(response.statusCode==411){
      showDialog(context: context, builder: (BuildContext context){
        return AlertDialog(
          title: Text('Error'),
          content: Text(body['message']),
          actions: [
            TextButton(onPressed: (){
              Navigator.pop(context);
            }, child: Text('Ok'))
          ],
        );
      });

    }
    else if(response.statusCode==469){
      showDialog(context: context, builder: (BuildContext context){
        return AlertDialog(
          title: Text('Successful'),
          content: Text(body['message']),
          actions: [
            TextButton(onPressed: (){
              Navigator.pop(context);
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>Login()));
              password.clear();
              confirm_password.clear();
            }, child: Text('OK'))
          ]
        );
      });
    }
    else if(response.statusCode==412){
      showDialog(context: context, builder: (BuildContext context){
        return AlertDialog(
          title: Text('Error'),
          content: Text(body['message']),
          actions: [
            TextButton(onPressed: (){
              Navigator.pop(context);
              password.clear();
              confirm_password.clear();
            }, child: Text('Ok'))
          ],
        );
      });
    }
  }
  @override
  Widget build (BuildContext context){
    return Scaffold(
      body:SafeArea(child:
      Column(
        children: [
          Align(
          alignment: Alignment.topLeft,
           child:
          IconButton(onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context)=>Login()));
          }, icon: Icon(Icons.arrow_back_ios_new)),
          ),
          Text('Change your password',style: TextStyle(fontSize: 25,fontWeight:FontWeight.bold),),
          SizedBox(
            height: 30,
          ),
          Container(
            height: 67,
            width: 350,
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.grey,
                width: 1.5,
              ),
              borderRadius: BorderRadius.circular(20)
            ),
            child: Padding(padding: EdgeInsets.only(left: 80,top: 10),child: TextField(
              controller: password,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: 'Enter the new password'
              ),
            )
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Container(
            height: 67,
            width: 350,
            decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.grey,
                  width: 1.5,
                ),
                borderRadius: BorderRadius.circular(20)
            ),
            child: Padding(padding: EdgeInsets.only(left: 80,top: 10),child: TextField(
              controller: confirm_password,
              decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Re-enter the new password'
              ),
            )
            ),
          ),
          SizedBox(
            height: 40,
          ),
          ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blueAccent,
                minimumSize: Size(320, 40)
              ),
              onPressed: (){
                new_password();
              }, child: Text('Confirm',style: TextStyle(color: Colors.white),)),
        ],
      )
      ),
    );
  }
}