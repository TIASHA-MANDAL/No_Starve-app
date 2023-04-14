import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  final uid = FirebaseAuth.instance.currentUser!.uid;
  final email = FirebaseAuth.instance.currentUser!.email;
  final creationTime = FirebaseAuth.instance.currentUser!.metadata.creationTime;
  // final uri = FirebaseAuth.instance.currentUser!.photoURL;
  User? user = FirebaseAuth.instance.currentUser;
  verifyEmail() async {
    if (user != null && !user!.emailVerified) {
      await user!.sendEmailVerification();
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          backgroundColor: Colors.orangeAccent,
          content: Text(
            "Verification email has been sent!",
            style: TextStyle(fontSize: 18.0, color: Colors.black),
          )));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/icons/back2.jpeg'),
                fit: BoxFit.cover)),
        // margin: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            title: Text("User Profile"),
          ),
          body: Container(
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 20, horizontal: 30),
              child: ListView(
                children: [
                  Image(
                    image: AssetImage('assets/icons/logo.png'),
                    width: 100,
                    height: 100,
                  ),
                  Lottie.network(
                      "https://assets8.lottiefiles.com/packages/lf20_FqsM4u.json",
                      height: 150,
                      width: 150),
                  SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text('User ID: $uid',
                        style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.w600,
                          color: Colors.black,
                          // backgroundColor: Colors.white
                        ),
                        textAlign: TextAlign.center),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text('Email: $email',
                            style: TextStyle(
                              fontSize: 20.0,
                              fontWeight: FontWeight.w600,
                              color: Colors.black,
                              // backgroundColor: Colors.white
                            ),
                            textAlign: TextAlign.center),
                      ),
                    ],
                  ),
                  user!.emailVerified
                      ? Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text("Verified",
                              style: TextStyle(
                                fontSize: 20.0,
                                fontWeight: FontWeight.w600,
                                color: Colors.black,
                                // backgroundColor: Colors.white
                              ),
                              textAlign: TextAlign.center),
                        )
                      : TextButton(
                          onPressed: () => {
                                verifyEmail(),
                              },
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text('Verify Email',
                                style: TextStyle(
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.w600,
                                  color: Color.fromARGB(255, 13, 34, 153),
                                  // backgroundColor: Colors.white
                                ),
                                textAlign: TextAlign.center),
                          )),
                  SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text('Created: $creationTime',
                        style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.w600,
                          color: Colors.black,
                          // backgroundColor: Colors.white
                        ),
                        textAlign: TextAlign.center),
                  )
                ],
              ),
            ),
          ),
        ));
  }
}
