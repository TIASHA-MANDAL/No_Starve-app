import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:no_starve/pages/home/signup.dart';

import 'package:no_starve/pages/home/user/user_main.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:no_starve/pages/home/verification.dart';

import 'forgot_password.dart';
import 'home_body.dart';
import 'home_screen.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final _formKey = GlobalKey<FormState>();

  var email = "";
  var password = "";
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  userLogin() async {
    try {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => Verification()));
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print("No User Found for that Email!");
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            backgroundColor: Colors.orangeAccent,
            content: Text(
              // "Register Successfully. Logged In..",
              "No User Found for that Email!",
              style: TextStyle(fontSize: 18.0, color: Colors.black),
            )));
      } else if (e.code == 'wrong-password') {
        print("Wrong Password Provided by User");
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            backgroundColor: Colors.orangeAccent,
            content: Text(
              // "Register Successfully. Logged In..",
              "Wrong Password Provided by User",
              style: TextStyle(fontSize: 18.0, color: Colors.black),
            )));
      }
    }
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
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
            title: Text("User Login"),
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
                            errorStyle: TextStyle(
                                color: Colors.redAccent, fontSize: 15),
                          ),
                          controller: emailController,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please Enter Email';
                            } else if (!value.contains('@')) {
                              return 'Please Enter Valid Email';
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
                            labelText: 'Password: ',
                            labelStyle: TextStyle(
                                fontSize: 20.0,
                                color: Colors.black,
                                backgroundColor: Colors.white),
                            border: OutlineInputBorder(),
                            filled: true,
                            fillColor: Colors.white60,
                            errorStyle: TextStyle(
                                color: Colors.redAccent, fontSize: 15),
                          ),
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
                        margin: EdgeInsets.only(left: 60.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            ElevatedButton(
                                onPressed: () {
                                  if (_formKey.currentState!.validate()) {
                                    setState(() {
                                      email = emailController.text;
                                      password = passwordController.text;
                                      // Navigator.push(context, MaterialPageRoute(
                                      //   builder: (context) {
                                      //     return MainScreenPage();
                                      //   },
                                      // ));
                                      userLogin();
                                    });
                                  }
                                },
                                child: Text(
                                  'Login',
                                  style: TextStyle(
                                      fontSize: 18.0, color: Colors.indigo),
                                )),
                            TextButton(
                                onPressed: () => {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                ForgotPassword(),
                                          ))
                                    },
                                child: Text(
                                  'Forgot Password?',
                                  style: TextStyle(
                                      fontSize: 16.0,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.indigo,
                                      backgroundColor: Colors.white),
                                ))
                          ],
                        ),
                      ),
                      Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Don't have an Account?",
                              style: TextStyle(
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.black,
                                  backgroundColor: Colors.white60),
                            ),
                            TextButton(
                              onPressed: () => {
                                Navigator.pushAndRemoveUntil(
                                    context,
                                    PageRouteBuilder(
                                      pageBuilder: (context, a, b) => Signup(),
                                      transitionDuration: Duration(seconds: 0),
                                    ),
                                    (route) => false)
                              },
                              child: Text(
                                'Signup',
                                style: TextStyle(
                                    color: Colors.indigo,
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.w600,
                                    backgroundColor: Colors.white),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                )),
          )),
    );
  }
}
