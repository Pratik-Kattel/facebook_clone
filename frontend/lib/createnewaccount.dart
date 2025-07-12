import 'dart:convert';
import 'package:facebook/status.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'Login.dart';
import 'icons.dart';

class createnewaccount extends StatefulWidget{
  const createnewaccount({super.key});
  createnewaccountstate createState()=>createnewaccountstate();
}

class createnewaccountstate extends State<createnewaccount>{
  Future<void> register() async{
    final url=Uri.parse('http://10.0.2.2:3000/login/new_user');
    final response=await http.post(
      url,
      headers: {'Content-Type':'application/json'},
      body: jsonEncode({
        'email':email.text,
        'password':password.text,
        'name':name.text,
      })
    );
    final body=jsonDecode(response.body);
    if(response.statusCode==404){
      showDialog(context: context, builder: (BuildContext context){
        return AlertDialog(
         title: Text('Registration Error'),
         content: Text(body['message']),
          actions: [
            TextButton(onPressed: (){
              Navigator.pop(context);
            }, child: Text('OK'))
          ],
        );
      });
    }
    else if(response.statusCode==201){
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Registration successful')));
      Navigator.push(context, MaterialPageRoute(builder: (context)=>icons()));
    }
    else if(response.statusCode==405){
      showDialog(context: context, builder: (BuildContext context){
        return AlertDialog(
         title: Text('Registration error'),
          content: Text(body['message']),
          actions: [
            TextButton(onPressed: (){
              Navigator.pop(context);
            }, child: Text('OK'))
          ],
        );
      });
    }
    else if(response.statusCode==406) {
      showDialog(context: context, builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Registration error'),
          content: Text(body['message']),
        );
      });
    }
  }
  final email=new TextEditingController();
  final password=new TextEditingController();
  final name=new TextEditingController();
  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Align(
              alignment: Alignment.topLeft,
            child:
            IconButton(onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>Login()));
            }, icon: Icon(Icons.arrow_back_ios_new_rounded)),
            ),
            SizedBox(height: 20),
            Padding(
              padding: EdgeInsets.only(right: 200),
            child: Text('Join Facebook',style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),),
            ),
            SizedBox(
              height: 20,
            ),
            ClipRRect(
              borderRadius: BorderRadius.circular(30),
              child:Container(
                height: 200,
                width: 385,
            child:   Image.asset('assets/images/newaccount.png',fit: BoxFit.cover,),
            )
            ),
            SizedBox(
              height: 30,
            ),
            Container(
              height: 65,
              width: 370,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                border: Border.all(
                  color: Colors.grey,
                  width: 1.3
                )
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20,vertical: 20),
                child: TextField(
                  controller: name,
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Enter your full name',
                    hintStyle: TextStyle(color: Colors.grey),
                  ),
                ),
              )
            ),
            SizedBox(
              height: 30,
            ),
            Container(
              height: 65,
              width: 370,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                border: Border.all(
                  color: Colors.grey,
                  width: 1.3,
                ),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20,vertical: 20),
                child: TextField(
                  controller: email,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Mobile number or email',
                    hintStyle: TextStyle(color: Colors.grey),
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),
            Container(
              height: 65,
              width: 370,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                border: Border.all(
                  color: Colors.grey,
                  width: 1.3,
                ),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20,vertical: 20),
                child: TextField(
                  controller: password,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Password',
                    hintStyle: TextStyle(color: Colors.grey),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 50,
            ),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                  minimumSize: Size(300, 50),
                  backgroundColor: Colors.blueAccent
                ),
                onPressed: (){
                  register();
                  email.clear();
                  password.clear();
                  name.clear();
                }, child:
              Text('Register',style: TextStyle(color: Colors.white),)
            ),
          ],
        ),
      ),

    );
  }
}