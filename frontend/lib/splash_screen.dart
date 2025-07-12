import 'dart:async';
import 'package:facebook/appbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'Login.dart';

class splash_screen extends StatefulWidget {
  const splash_screen({super.key});
  @override
  splash_screenState createState() => splash_screenState();
}

class splash_screenState extends State<splash_screen> {
  @override
  void initState(){
    super.initState();
    Timer(Duration(seconds: 2),() {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>Login()));
    }
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xFF2C2C2C), // Dark grey
              Color(0xFF000000), // Black
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Center(
          child: Column(
            children: [
              SizedBox(
                height: 400,
              ),
              const Text(
                'Welcome to facebook',
                style: TextStyle(
                  color: Colors.blue,
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              Container(
                height: 60,
                width: 60,
                child: ClipOval(
                  child: Image.asset(
                    'assets/images/facebook.png',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(
                height: 270,
              ),
              Text('from',style: TextStyle(
                  color: Colors.blue,
                  fontSize: 25
              ),
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  SizedBox(
                    width: 105,
                  ),
                  Icon(
                    Icons.person,color: Colors.white,
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Text('Pratik kattel',style: TextStyle(
                      color: Colors.blue,
                      fontSize: 25
                  ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
