import 'package:facebook/appbar.dart';
import 'package:facebook/splash_screen.dart';
import 'package:flutter/material.dart';
void main()=>runApp(const facebook());
class facebook extends StatelessWidget{
  const facebook({super.key});
  @override
  Widget build(BuildContext context){
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.light,
      ),
      home: splash_screen(),
    );

  }
}