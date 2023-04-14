import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:no_starve/pages/home/register.dart';
import 'package:lottie/lottie.dart';

class ChangePassword extends StatefulWidget {
  const ChangePassword({super.key});

  @override
  _ChangePassword createState() => _ChangePassword();
}

class _ChangePassword extends State<ChangePassword> {
  final _formKey = GlobalKey<FormState>();
  var newPassword = "";
  final newPasswordController = TextEditingController();
  @override
  void dispose() {
    newPasswordController.dispose();
    super.dispose();
  }

  final currentUser = FirebaseAuth.instance.currentUser;
  ChangePassword() async {
    try {
      await currentUser!.updatePassword(newPassword);
      await FirebaseAuth.instance.signOut();
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => Register()),
      );
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          backgroundColor: Colors.orangeAccent,
          content: Text(
            "Your Password has been changed. Login Again !",
            style: TextStyle(fontSize: 18.0),
          )));
    } catch (e) {}
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/icons/back2.jpeg'), fit: BoxFit.cover)),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          title: Text("User Settings"),
        ),
        body: Container(
          child: Form(
              key: _formKey,
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 20, horizontal: 30),
                child: ListView(
                  children: [
                    Image(
                      image: AssetImage('assets/icons/logo.png'),
                      width: 130,
                      height: 130,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    // Lottie.network(
                    //     "https://assets10.lottiefiles.com/packages/lf20_wcdzldes.json",
                    //     height: 150,
                    //     width: 150),
                    // SizedBox(
                    //   height: 20,
                    // ),
                    Center(
                      child: Container(
                          margin: EdgeInsets.symmetric(vertical: 10.0),
                          child: TextFormField(
                            autofocus: false,
                            obscureText: true,
                            decoration: InputDecoration(
                              labelText: 'New Password: ',
                              hintText: 'Enter New Password',
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
                            controller: newPasswordController,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please Enter Password';
                              }
                              return null;
                            },
                          )),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          setState(() {
                            newPassword = newPasswordController.text;
                          });
                          ChangePassword();
                        }
                      },
                      child: Text(
                        'Change Password',
                        style: TextStyle(fontSize: 18.0),
                      ),
                    )
                  ],
                ),
              )),
        ),
      ),
    );
  }
}
