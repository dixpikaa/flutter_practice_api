import 'package:api_call/post.dart';
import 'package:flutter/material.dart';

class NextPage extends StatefulWidget {
  final GithubUser user;
  const NextPage({
    super.key,
    required this.user,
  });

  @override
  State<NextPage> createState() => _NextPageState();
}

class _NextPageState extends State<NextPage> {
  double height = 400;
  double size = 20;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.arrow_back_ios_new_rounded,),
        title: Text("My Profile"),
        actions: [Icon(Icons.settings)],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 40),
          child: Column(
            children: [
              Card(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    InkWell(
                      child: CircleAvatar(
                        radius: 70,
                        backgroundImage: NetworkImage(widget.user.avatarUrl),
                      ),
                    ),
                    Column(
                      children: [
                        MouseRegion(
                          onHover: (val){
                            setState(() {
                              size = 30;
                            });
                          },
                          child: Text(
                            widget.user.login,
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: size),
                          ),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        ElevatedButton(
                          onPressed: () {},
                          child: Text("Edit Profile"),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    MouseRegion(
                      onHover:(val){
                        setState(() {
                          height = 600;
                        });
                        print("on hover : $val");
                      } ,
                      child: Container(
                          // height: ,
                          width: 200,
                          child: Image.asset("assets/i.jpeg",height: height,)),
                    ),
                    SizedBox(
                      width: 30,
                    ),
                    Container(
                        height: 400,
                        width: 200,
                        child: Image.asset("assets/j.jpeg")),
                    SizedBox(
                      width: 30,
                    ),
                    Container(
                        height: 400,
                        width: 200,
                        child: Image.asset("assets/i.jpeg")),
                    SizedBox(
                      width: 30,
                    ),
                    Container(
                        height: 400,
                        width: 200,
                        child: Image.asset("assets/j.jpeg")),
                    SizedBox(
                      width: 30,
                    ),
                    Container(
                        height: 400,
                        width: 200,
                        child: Image.asset("assets/i.jpeg")),
                    SizedBox(
                      width: 30,
                    ),
                    Container(
                        height: 400,
                        width: 200,
                        child: Image.asset("assets/j.jpeg")),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
