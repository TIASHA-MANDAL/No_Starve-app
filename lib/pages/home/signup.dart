import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:no_starve/pages/home/register.dart';
import 'package:no_starve/pages/home/user/user_main.dart';
import 'package:no_starve/pages/home/verification.dart';

import 'home_screen.dart';

class Signup extends StatefulWidget {
  Signup({Key? key}) : super(key: key);

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  final _formKey = GlobalKey<FormState>();
  var email = "";
  var password = "";
  var confirmpassword = "";
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmpasswordController = TextEditingController();
  final Color firstColor = const Color.fromARGB(133, 30, 62, 1);
  final Color secondColor = const Color.fromARGB(5, 30, 62, 1);

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    confirmpasswordController.dispose();

    super.dispose();
  }

  registration() async {
    if (password == confirmpassword) {
      try {
        UserCredential userCredential = await FirebaseAuth.instance
            .createUserWithEmailAndPassword(email: email, password: password);
        print(userCredential);
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            backgroundColor: Colors.redAccent,
            content: Text(
              // "Register Successfully. Logged In..",
              "Registered Successfully Please Log in",
              style: TextStyle(fontSize: 20.0),
            )));
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
              builder: (context) =>
                  //  UserMain()),
                  Register()),
        );
      } on FirebaseAuthException catch (e) {
        if (e.code == 'weak-password') {
          print("Password provided is too weak");
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              backgroundColor: Colors.orangeAccent,
              content: Text(
                "Password provided is too weak",
                style: TextStyle(fontSize: 18.0, color: Colors.black),
              )));
        } else if (e.code == 'email-already-in-use') {
          print("Account Already Exists");
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              backgroundColor: Colors.orangeAccent,
              content: Text(
                "Account Already Exists",
                style: TextStyle(fontSize: 18.0, color: Colors.black),
              )));
        }
      }
    } else {
      print("Password doesn't match with confirm Password!");
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          backgroundColor: Colors.orangeAccent,
          content: Text(
            "Password doesn't match with confirm Password!",
            style: TextStyle(fontSize: 16.0, color: Colors.black),
          )));
    }
  }

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
              image: AssetImage('assets/images/child2.jpg'),
              fit: BoxFit.cover)),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          title: Text("User SignUp"),
        ),
        body: Container(
          child: Form(
            key: _formKey,
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 20, horizontal: 30),
              child: ListView(
                children: [
                  Image(
                    image: ResizeImage(
                      AssetImage('assets/icons/logo1.png'),
                      width: 100,
                      height: 100,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 10.0),
                    child: TextFormField(
                        autofocus: false,
                        decoration: InputDecoration(
                          labelText: 'Email: ',
                          labelStyle: TextStyle(
                              fontSize: 20.0,
                              color: Colors.black,
                              backgroundColor: Colors.white),
                          border: OutlineInputBorder(),
                          filled: true,
                          fillColor: Colors.white60,
                          errorStyle:
                              TextStyle(color: Colors.redAccent, fontSize: 15),
                        ),
                        controller: emailController,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please Enter Email';
                          } else if (!value.contains('@')) {
                            return 'Please Enter Valid Email';
                          }
                          return null;
                        }),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 10.0),
                    child: TextFormField(
                      autofocus: false,
                      obscureText: true,
                      decoration: InputDecoration(
                          labelText: 'Password: ',
                          labelStyle: TextStyle(
                              fontSize: 20.0,
                              color: Colors.black,
                              backgroundColor: Colors.white),
                          border: OutlineInputBorder(),
                          filled: true,
                          fillColor: Colors.white60,
                          errorStyle:
                              TextStyle(color: Colors.redAccent, fontSize: 15)),
                      controller: passwordController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please Enter Password';
                        }

                        return null;
                      },
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 10.0),
                    child: TextFormField(
                      autofocus: false,
                      obscureText: true,
                      decoration: InputDecoration(
                          labelText: 'Confirm Password: ',
                          labelStyle: TextStyle(
                              fontSize: 20.0,
                              color: Colors.black,
                              backgroundColor: Colors.white),
                          border: OutlineInputBorder(),
                          filled: true,
                          fillColor: Colors.white60,
                          errorStyle:
                              TextStyle(color: Colors.redAccent, fontSize: 15)),
                      controller: confirmpasswordController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please Enter Password';
                        }

                        return null;
                      },
                    ),
                  ),
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              setState(() {
                                email = emailController.text;
                                password = passwordController.text;
                                confirmpassword =
                                    confirmpasswordController.text;
                                password = passwordController.text;
                                // Navigator.push(context, MaterialPageRoute(
                                //   builder: (context) {
                                //     return MainScreenPage();
                              });
                              registration();
                            }
                          },
                          child: Text(
                            'Sign Up',
                            style:
                                TextStyle(fontSize: 18.0, color: Colors.indigo),
                          ),
                        ),
                        // user!.emailVerified
                        //     ? Padding(
                        //         padding: const EdgeInsets.all(8.0),
                        //         child: ElevatedButton(
                        //           child: Text("Login",
                        //               style: TextStyle(
                        //                 fontSize: 20.0,
                        //                 fontWeight: FontWeight.w600,
                        //                 color:
                        //                     Color.fromARGB(255, 143, 16, 165),
                        //                 // backgroundColor: Colors.white
                        //               ),
                        //               textAlign: TextAlign.center),
                        //           onPressed: () {
                        //             Navigator.push(context, MaterialPageRoute(
                        //               builder: (context) {
                        //                 return Register();
                        //               },
                        //             ));
                        //           },
                        //         ),
                        //       )
                        //     : ElevatedButton(
                        //         onPressed: () => {
                        //               verifyEmail(),
                        //               Register(),
                        //             },
                        //         child: Padding(
                        //           padding: const EdgeInsets.all(8.0),
                        //           child: Text('Verify Email',
                        //               style: TextStyle(
                        //                 fontSize: 20.0,
                        //                 fontWeight: FontWeight.w600,
                        //                 color: Color.fromARGB(255, 13, 34, 153),
                        //                 // backgroundColor: Colors.white
                        //               ),
                        //               textAlign: TextAlign.center),
                        //         )),
                      ],
                    ),
                  ),
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Already have an Account? ",
                          style: TextStyle(
                              fontSize: 16.0,
                              fontWeight: FontWeight.w600,
                              color: Colors.indigo,
                              backgroundColor: Colors.white),
                        ),
                        ElevatedButton(
                            onPressed: () {
                              Navigator.push(context, MaterialPageRoute(
                                builder: (context) {
                                  return Register();
                                },
                              ));
                            },
                            child: Text(
                              'Login',
                              style: TextStyle(
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.indigo,
                                  backgroundColor: Colors.white),
                            ))
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
