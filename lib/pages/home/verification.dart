import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:no_starve/pages/home/register.dart';
import 'package:no_starve/pages/home/user/user_main.dart';

class Verification extends StatefulWidget {
  const Verification({super.key});

  @override
  _VerificationState createState() => _VerificationState();
}

class _VerificationState extends State<Verification> {
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
            title: Text("Welcome!"),
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
                      "https://assets2.lottiefiles.com/packages/lf20_jrpzvtqz.json",
                      height: 200,
                      width: 200),
                  SizedBox(
                    height: 20,
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
                      ? Column(
                          children: [
                            Text(
                              "Verified User",
                              style: TextStyle(
                                fontSize: 20.0,
                                fontWeight: FontWeight.w600,
                                color: Colors.black,
                                // backgroundColor: Colors.white
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: ElevatedButton(
                                child: Text("Click Here",
                                    style: TextStyle(
                                      fontSize: 20.0,
                                      fontWeight: FontWeight.w600,
                                      color: Color.fromARGB(255, 143, 16, 165),
                                      // backgroundColor: Colors.white
                                    ),
                                    textAlign: TextAlign.center),
                                onPressed: () {
                                  Navigator.push(context, MaterialPageRoute(
                                    builder: (context) {
                                      return UserMain();
                                    },
                                  ));
                                },
                              ),
                            ),
                          ],
                        )
                      : ElevatedButton(
                          onPressed: () => {
                                verifyEmail(),
                                Register(),
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
                  Column(
                    children: [
                      ElevatedButton.icon(
                          style: ElevatedButton.styleFrom(
                              padding: EdgeInsets.symmetric(horizontal: 8),
                              textStyle: TextStyle(fontSize: 20)),
                          icon: Icon(
                            Icons.arrow_back_ios,
                            size: 30,
                            color: Colors.black,
                          ),
                          onPressed: () {
                            Navigator.push(context, MaterialPageRoute(
                              builder: (context) {
                                return Register();
                              },
                            ));
                          },
                          label: Text(
                            'Login',
                            style: TextStyle(
                                fontSize: 20.0,
                                color: Colors.indigoAccent,
                                fontWeight: FontWeight.w600),
                          )),
                      // ElevatedButton(
                      //     onPressed: () {
                      //       Navigator.push(context, MaterialPageRoute(
                      //         builder: (context) {
                      //           return Register();
                      //         },
                      //       ));
                      //     },
                      //     child: Text(
                      //       'Login',
                      //       style: TextStyle(
                      //           fontSize: 16.0,
                      //           fontWeight: FontWeight.w600,
                      //           color: Colors.indigo,
                      //           backgroundColor: Colors.white),
                      //     )),
                    ],
                  )
                ],
              ),
            ),
          ),
        ));
  }
}
