import 'dart:convert';
import 'package:facebook/appbar.dart';
import 'package:facebook/status.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'icons.dart';
import 'package:http/http.dart' as http;
import 'createnewaccount.dart';
import 'Email_verify.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  Loginstate createState() => Loginstate();
}

class Loginstate extends State<Login> {
  final email=new TextEditingController();
  final password=new TextEditingController();
  bool clicked = true;
  String selected = 'English (US)';

  final List<String> languages = [
    'English (US)',
    'Nepali',
    'Hindi',
    'Spanish',
    'English (UK)'
  ];
  Future<void> login() async {
    final url=Uri.parse('http://10.0.2.2:3000/auth/login');
    final response= await http.post(url,
        headers: {'Content-Type':'application/json'},
        body:jsonEncode({
         'email':email.text.trim(),
          'password':password.text,
        })
    );
    final body=jsonDecode(response.body);
    if(response.statusCode==406){
      showDialog(context: context, builder: (BuildContext context){
        return AlertDialog(
          title: Text('Login Failed'),
          content: Text(body['message']),
          actions: [
            TextButton(onPressed: (){
              Navigator.pop(context);
            }, child: Text('Ok'))
          ],
        );
      });
    }
    else if(response.statusCode==401){
      showDialog(context: context, builder: (BuildContext context){
        return AlertDialog(
          title: Text('Login error'),
          content: Text(body['message']),
          actions: [
            TextButton(onPressed: (){
              Navigator.pop(context);
            }, child: Text('OK'))
          ],
        );
      });
    }
    else if(response.statusCode==402) {
      showDialog(context: context, builder: (BuildContext context){
        return AlertDialog(
          title: Text('Login Error'),
          content: Text(body['message']),
          actions: [
            TextButton(onPressed: (){
              Navigator.pop(context);
            }, child: Text('Ok'))
          ],
        );
      });
    }
    else if(response.statusCode==200){
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Login Successful')));
      Navigator.push(context, MaterialPageRoute(builder: (context)=>fb_appbar()));
    }
    else{
      showDialog(context: context, builder: (BuildContext context){
        return AlertDialog(
          title: Text('Login error'),
          content: Text("Internal Error occurred"),
          actions: [
            TextButton(onPressed: (){
              Navigator.pop(context);
            }, child: Text('Ok'))
          ],
        );
      });

    }

    }

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(height: 20),
            Center(
              child: DropdownButton<String>(
                underline: SizedBox.shrink(),
                value: selected,
                items: languages.map((String language) {
                  return DropdownMenuItem<String>(
                    value: language,
                    child: Text(language),
                  );
                }).toList(),
                onChanged: (String? value) {
                  setState(() {
                    selected = value!;
                  });
                },
              ),
            ),
            SizedBox(height: 50),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      width: 70,
                      height: 70,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: Colors.grey,
                          width: 2.0,
                        ),
                      ),
                      child: CircleAvatar(
                        backgroundImage:
                        AssetImage('assets/images/facebook.png'),
                        radius: 45,
                      ),
                    ),
                    SizedBox(height: 90),
                    if (!clicked)
                      Column(
                          children: [
                            Divider(
                              color: Colors.grey,
                              thickness: 0.5,
                            ),
                            Container(
                              height: 50,
                              width: 300,
                              child: Text(
                                'Facebook requests and receives your phone number from your mobile network',
                                style: TextStyle(color: Colors.black, fontSize: 15),
                              ),
                            ),
                            Divider(
                              color: Colors.grey,
                              thickness: 0.5,
                            ),
                          ]
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
                            suffixIcon: Transform.translate(
                              offset: Offset(0, -8),
                              child: IconButton(
                                color: clicked ? Colors.grey : Colors.black,
                                onPressed: () {
                                  setState(() {
                                    clicked = !clicked;
                                  });
                                },
                                icon: Icon(Icons.info_outline),
                              ),
                            ),
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
                    SizedBox(height: 10),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blueAccent,
                        minimumSize: Size(350, 45),
                      ),
                      onPressed: () {
                       login();
                        email.clear();
                        password.clear();
                      },
                      child: Text(
                        'Log in',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    SizedBox(height: 10),
                    TextButton(
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>Email_verify()));
                      },
                      child: Text(
                        'Forgot password?',
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                minimumSize: Size(350, 45),
                side: BorderSide(
                  color: Colors.blue,
                  width: 1,
                ),
              ),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context)=>createnewaccount()));
              },
              child: Text(
                'Create new account',
                style: TextStyle(color: Colors.blue),
              ),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.person,
                  size: 26,
                  color: Colors.grey,
                ),
                SizedBox(width: 10),
                Text(
                  'Pratik',
                  style: TextStyle(color: Colors.grey, fontSize: 17),
                ),
              ],
            ),
            SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
