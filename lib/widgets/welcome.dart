import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '/firebase_authentication/firebase_auth.dart';

class MyWelcome extends StatelessWidget {

  FirebaseAuthService _auth = FirebaseAuthService();

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("images/images2.jpg"),
              fit: BoxFit.cover,
            ),
          ),

          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 0.2,sigmaY: 0.2),
            child: Container(
              color: Colors.black.withOpacity(0.4),
              child: Padding(
                padding: const EdgeInsets.only(top:10),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Welcome to",
                        style: TextStyle(
                          fontSize: 33,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        "Recipes.",
                        style: TextStyle(
                          fontSize: 55,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(height: 50,),
                      Container(
                        width: screenWidth * 0.7,
                        height: 60,
                        decoration: BoxDecoration(
                          color: Colors.yellow,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: ElevatedButton(
                          onPressed: () async {
                            await _auth.signOut();
                            Navigator.of(context).popAndPushNamed("/home_page");
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.transparent,
                            elevation: 0,
                          ),
                          child: Text(
                            "Start Cooking",
                            style: TextStyle(
                              fontSize: 30,
                              color:Colors.redAccent,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        )
    );
  }
}
