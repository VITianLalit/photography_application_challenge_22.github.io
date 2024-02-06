import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:photography_application_challenge_22/animation/FadeAnimation.dart';
import 'package:photography_application_challenge_22/data/Sample.dart';
import 'package:photography_application_challenge_22/helper/Colorsys.dart';
import 'package:photography_application_challenge_22/models/Post.dart';
import 'package:photography_application_challenge_22/pages/SingleUser.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(statusBarColor: Colors.transparent));
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: HomePage(),
  ));
}

class HomePage extends StatefulWidget {

  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colorsys.lightGrey,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colorsys.lightGrey,
        leading: Icon(Icons.menu, color: Colorsys.darkGray,),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            FadeAnimation(
                time: Duration(seconds: 1),
                wid: searchBox()),
            const SizedBox(height: 40,),
            FadeAnimation(
              time: Duration(seconds: 1),
              wid: Container(
                padding: const EdgeInsets.all(20),
                width: double.infinity,
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(20),
                      topLeft: Radius.circular(20),
                    )
                ),
                child: FadeAnimation(
                  time: Duration(seconds: 1),
                  wid: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("For you", style: TextStyle(
                        color: Colorsys.darkGray,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),),
                      const SizedBox(height: 20,),
                      Container(
                        decoration: BoxDecoration(
                          border: Border(bottom: BorderSide(
                            color: Colorsys.lightGrey,
                          )),
                        ),
                        child: FadeAnimation(
                          time: Duration(seconds: 2),
                          wid: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("Recommend", style: TextStyle(
                                    color: Colorsys.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15,
                                  ),),
                                  Container(
                                    width: 50,
                                    padding: const EdgeInsets.only(bottom: 10),
                                    decoration: BoxDecoration(
                                        border: Border(bottom: BorderSide(
                                          color: Colorsys.ornage,
                                          width: 3,
                                        ))
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(width: 20,),
                              Text("Liked", style: TextStyle(
                                color: Colorsys.grey,
                                fontWeight: FontWeight.w500,
                                fontSize: 15,
                              ),)
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 30,),
                      makePost(Sample.postOne),
                      makePost(Sample.postTwo),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      )
    );
  }
  Widget makePost(Post post){
    return Container(
      margin: EdgeInsets.only(bottom: 30),
      child: Column(
        children: [
          InkWell(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=> SingleUser(user: post.user,)));
            },
            child: Row(
              children: [
                Hero(
                  transitionOnUserGestures: true,
                  tag: post.user!.username,
                  child: CircleAvatar(
                    maxRadius: 20,
                    backgroundImage: AssetImage(post.user!.profilePicture),
                  ),
                ),
                SizedBox(width: 20,),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(post.user!.name, style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                      ),),
                      SizedBox(height: 5,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(post.location, style: TextStyle(
                            fontSize: 13,
                            color: Colorsys.grey,
                          ),),
                          Text(post.dateAgo, style: TextStyle(
                            fontSize: 13,
                            color: Colorsys.grey,
                          ),)
                        ],
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
          Container(
            height: 300,
            padding: EdgeInsets.only(top: 20),
            child: FadeAnimation(
              time: Duration(seconds: 1),
              wid: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: post.photos.length,
                itemBuilder: (context, index){
                  return AspectRatio(
                    aspectRatio: 1.2/1,
                    child: Container(
                      margin: EdgeInsets.only(right: 20),
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(post.photos[index]),
                          fit: BoxFit.cover,
                        ),
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.orange,
                      ),
                      child: Stack(
                        children: [
                          Align(
                            alignment: Alignment.bottomRight,
                            child: Container(
                              margin: EdgeInsets.all(20),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  ClipRRect(
                                    child: BackdropFilter(
                                      filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                                      child: Container(
                                        width: 30.0,
                                        height: 30.0,
                                        padding: EdgeInsets.all(5),
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(4),
                                          color: Colors.grey.shade600.withOpacity(0.1),
                                        ),
                                        child: Center(
                                          child: Image.asset('assets/icons/link.png'),
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(width: 10,),
                                  ClipRRect(
                                    child: BackdropFilter(
                                      filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                                      child: Container(
                                        width: 30.0,
                                        height: 30.0,
                                        padding: EdgeInsets.all(5),
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(4),
                                          color: Colors.grey.shade600.withOpacity(0.1),
                                        ),
                                        child: Center(
                                          child: Image.asset('assets/icons/heart.png'),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget searchBox(){
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 20,),
          Text("Best place ot \nFind awesome photos", style: TextStyle(
            fontSize: 22,
            color: Colorsys.darkGray,
            fontWeight: FontWeight.bold,
          ),),
          const SizedBox(height: 20,),
          Container(
            padding: const EdgeInsets.only(left: 20, right: 3, top: 2,  bottom: 3),
            height: 50,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: Colors.white,
            ),
            child: Row(
              children: [
                const Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: "Search for photo",
                      hintStyle: TextStyle(color: Colors.grey),
                      border: InputBorder.none,
                    ),
                  ),
                ),
                MaterialButton(
                  onPressed: (){},
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                  height: double.infinity,
                  minWidth: 50,
                  elevation: 0,
                  color: Colorsys.ornage,
                  child: const Icon(Icons.search, color: Colors.white,),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
