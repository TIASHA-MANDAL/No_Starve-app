import 'package:flutter/material.dart';
import 'package:no_starve/pages/home/otp.dart';
import 'package:firebase_auth/firebase_auth.dart';

class MyContact extends StatefulWidget {
  const MyContact({super.key});
  static String verify = "";

  @override
  State<MyContact> createState() => _MyContactState();
}

class _MyContactState extends State<MyContact> {
  TextEditingController countrycode = TextEditingController();
  var phone = "";

  @override
  void initState() {
    countrycode.text = "+91";
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.only(left: 25, right: 25),
        alignment: Alignment.center,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image(
                image: ResizeImage(
                  AssetImage('assets/icons/logo.png'),
                  width: 100,
                  height: 100,
                ),
              ),
              Image(
                image: AssetImage('assets/icons/otp.jpeg'),
                width: 150,
                height: 150,
              ),
              Text(
                "Phone Verification",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "We need to register your phone number",
                style: TextStyle(fontSize: 16),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 30,
              ),
              Container(
                height: 55,
                decoration: BoxDecoration(
                    border: Border.all(width: 1, color: Colors.grey),
                    borderRadius: BorderRadius.circular(10)),
                child: Row(
                  children: [
                    SizedBox(
                      width: 10,
                    ),
                    SizedBox(
                      width: 40,
                      child: TextField(
                        controller: countrycode,
                        decoration: InputDecoration(border: InputBorder.none),
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      "|",
                      style: TextStyle(fontSize: 33, color: Colors.grey),
                    ),
                    Expanded(
                      child: TextField(
                        keyboardType: TextInputType.phone,
                        onChanged: (value) {
                          phone = value;
                        },
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: "type your phone number"),
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              SizedBox(
                height: 45,
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () async {
                    await FirebaseAuth.instance.verifyPhoneNumber(
                        phoneNumber: '${countrycode.text + phone}',
                        verificationCompleted:
                            (PhoneAuthCredential credential) async {},
                        verificationFailed: (FirebaseException e) {},
                        codeSent:
                            (String verificationId, int? resendToken) async {
                          MyContact.verify = verificationId;
                          Navigator.pushNamed(context, "otp");
                        },
                        codeAutoRetrievalTimeout: (String verificationId) {});

                    // Navigator.push(context, MaterialPageRoute(
                    //   builder: (context) {
                    //     return MyOtp();
                    //   },
                    // ));
                  },
                  child: Text(
                    'Send the code',
                    style: TextStyle(color: Colors.white),
                  ),
                  style: ElevatedButton.styleFrom(
                      primary: Colors.green.shade600,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10))),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
