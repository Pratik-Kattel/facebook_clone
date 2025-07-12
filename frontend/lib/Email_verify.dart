import 'dart:convert';
import 'forgotpassword.dart';
import 'package:facebook/appbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'Login.dart';
import 'mobile_number.dart';
import 'package:http/http.dart' as http;
class Email_verify extends StatefulWidget{
  const Email_verify({super.key});

  Email_verify_state createState()=>Email_verify_state();
}

class Email_verify_state extends State<Email_verify>{
  final email=new TextEditingController();
  final password=new TextEditingController();
    Future<void> forgotpassword() async{
      final url=Uri.parse('http://10.0.2.2:3000/update_password/email_verify');
      final response= await http.post(url,
      headers: {'Content-Type':'application/json'},
        body: jsonEncode({
         'email':email.text
        })
      );
      final body=jsonDecode(response.body);
      if(response.statusCode==409){
        showDialog(context: context, builder: (BuildContext context){
          return AlertDialog(
            title: Text('Error'),
            content: Text(body['message']),
            actions: [
              TextButton(onPressed: (){
                Navigator.pop(context);
              }, child: Text('OK'))
            ],
          )
          ;
        });
      }
        if(response.statusCode==406){
        showDialog(context: context, builder: (BuildContext context){
          return AlertDialog(
            title: Text('Error'),
            content: Text(body['message']),
            actions: [
              TextButton(onPressed: (){
                Navigator.pop(context);
              }, child: Text('OK'))
            ],
          )
          ;
        });
      }
       else if(response.statusCode==310) {
          Navigator.push(context, MaterialPageRoute(builder: (context)=>change_password(email: email.text,)));
          ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(body['message'])));
        }
     else if(response.statusCode==410){
        showDialog(context: context, builder: (BuildContext context){
          return AlertDialog(
            title: Text('Error'),
            content: Text(body['message']),
            actions: [
              TextButton(onPressed: (){
                Navigator.pop(context);
              }, child: Text('OK'))
            ],
          )
          ;
        });
      }
    }


  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: SafeArea(
        child:   Column(
          crossAxisAlignment:   CrossAxisAlignment.start,
            children: [
              Align(
            alignment: Alignment.topLeft,
        child:
              IconButton(onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>Login()));
              }, icon: Icon(Icons.arrow_back_ios_new)),
              ),
              Padding(padding: EdgeInsetsGeometry.only(left: 20,top: 20),
              child:
              Text('Find your account',style: TextStyle(fontWeight: FontWeight.bold,fontSize:20),),
              ),
              Padding(padding: EdgeInsetsGeometry.only(left: 20,top: 20),
                child:
                Text('Enter your email.',style: TextStyle(fontSize: 15),),
              ),
              SizedBox(
                height: 20,
              ),
              Align(
           alignment: Alignment.topCenter,
              child: Container(
                height: 70,
                width: 350,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(
                    color: Colors.grey,
                    width: 1.5,
                  )
                ),
                child:
                Padding(padding: EdgeInsets.only(left: 20,top: 10),
                child:
                TextField(
                  controller: email,
                 decoration: InputDecoration(
                   hintText: 'Email Address',
                   border: InputBorder.none,
                   hintStyle: TextStyle(color: Colors.grey)
                 ),
                )
              )
              )
              ),
              Padding(padding:EdgeInsets.only(left: 10,right: 10,top: 20),
              child:
              Text('You will be taken to the password change page once your email is verified.',style:TextStyle(color: Colors.grey))
              ),
              SizedBox(
                height: 20,
              ),
              Center(
                child:
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blueAccent,
                    minimumSize: Size(350, 40)
                  ),
                  onPressed: (){
                    forgotpassword();
                  }, child: Text('Verify email',style: TextStyle(color: Colors.white),)),
              ),
              Center(
                child:
                TextButton(onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>mobile_number()));
                }, child: Text('Search by mobile instead',style: TextStyle(color: Colors.grey),)),
              )
            ],
      )
      ),
    );
  }
}