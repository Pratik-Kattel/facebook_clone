import 'package:facebook/appbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'Posts.dart';

class comments extends StatefulWidget{
  final int likes;
  final int shares;
  final String username;
  final String profile_picture;
  final List<String> comments_list;
  const comments ({super.key,required this.likes,required this.shares,required this.username,required this.profile_picture,required this.comments_list});

  comments_state createState()=> comments_state();
}
class comments_state extends State<comments>{
  bool is_liked=true;
  final String Name='Pratik Kattel';
  final String Image='assets/images/Pratik.png';
  // static int no_comments=0;
  int comment_likes=0;
  var user=posts_state.postData;
  Map<String,List<String>> user_comments={
    'comment':[],
  };
  final TextEditingController _commentcontroller=new TextEditingController();
  final FocusNode _commentfocus=new FocusNode();
  @override
  void dispose() {
    _commentcontroller.dispose();
    _commentfocus.dispose();
    // TODO: implement dispose
    super.dispose();
  }
  @override
  Widget build(BuildContext context){
    return Scaffold(
        backgroundColor: Color(0xFF333333),
        body:
        SafeArea(child:
        Column(
            children: [
              Row(
                  children: [
                    SizedBox(
                      width: 5,
                    ),
                    CircleAvatar(
                      radius: 10,
                      backgroundColor: Colors.blue,
                      child:
                      Icon(Icons.thumb_up,color: Colors.white,size: 15,),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text(widget.likes.toString(),style: TextStyle(color: Colors.white),),
                    IconButton(onPressed: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>fb_appbar()));
                    }, icon: Icon(Icons.arrow_back_rounded)
                    ),
                    Spacer(),
                    Text(widget.shares.toString(),style: TextStyle(color: Colors.white),),
                    SizedBox(width: 5,),
                    Text('shares',style: TextStyle(color: Colors.white),)
                  ]
              ),
              Expanded(
                  child: ListView.builder(
                      itemCount: widget.comments_list.length,
                      itemBuilder: (context, index) {
                        final post_comment = widget.comments_list[index];
                        return Column(
                          children: [
                            SizedBox(
                              height: 40,
                            ),
                            Row(
                              children: [
                                SizedBox(
                                  width: 5,
                                ),
                                CircleAvatar(
                                  backgroundImage: AssetImage(Image),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Container(
                                  padding:EdgeInsets.symmetric(horizontal:10),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.all(Radius.circular(10)),
                                      color: Colors.grey
                                  ),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Text(Name,style: TextStyle(color: Colors.white),),
                                      Text(post_comment,style: TextStyle(color: Colors.white),)
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                SizedBox(
                                  width: 58,
                                ),
                                Text('Now',style: TextStyle(color: Colors.white),),
                                TextButton(
                                  style: TextButton.styleFrom(padding: EdgeInsets.zero),
                                  onPressed: (){
                                    setState(() {
                                      is_liked=!is_liked;
                                      is_liked?comment_likes--:comment_likes++;
                                    });
                                  },
                                  child: Text('Like',style: TextStyle(color: Colors.white),),
                                ),
                                TextButton(
                                  style: TextButton.styleFrom(padding: EdgeInsets.zero),
                                  onPressed: (){},
                                  child: Text('Reply',style: TextStyle(color: Colors.white),),
                                ),
                                Spacer(),
                                Text(comment_likes.toString(),style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
                                SizedBox(
                                  width: 5,
                                ),
                                CircleAvatar(
                                  radius: 10,
                                  backgroundColor: Colors.blue,
                                  child:
                                  Icon(Icons.thumb_up,color: Colors.white,size: 15,),
                                )
                              ],
                            )
                          ],
                        );
                      })
              ),
              Divider(
                thickness: 3,
                color: Colors.grey,
              ),
              Container(
                height: 40,
                width: 370,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(50)),
                    color: Colors.grey
                ),
                child: Row(
                    children: [
                      SizedBox(
                        width: 7,
                      ),
                      Expanded(child:
                      TextField(
                        focusNode: _commentfocus,
                        controller: _commentcontroller,
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Write comment',
                            hintStyle:TextStyle(color: Colors.white,fontSize: 18)
                        ),
                      )
                      ),
                      Spacer(),
                      IconButton(onPressed: (){
                          if (_commentcontroller.text.trim().isNotEmpty) {
                            setState(() {
                              widget.comments_list.add(_commentcontroller.text.trim());
                              _commentcontroller.clear();
                            });
                          }
                      },
                          icon: Icon(Icons.send,color: Colors.blue,size: 20,))
                    ]
                ),
              ),
              SizedBox(
                height: 5,
              ),
            ]
        )
        )

    );
  }
}