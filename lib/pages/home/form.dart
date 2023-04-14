import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:no_starve/pages/home/user/confirm.dart';
import 'package:no_starve/pages/home/user/user_main.dart';

import '../../widgets/dimensions.dart';
import 'package:intl/intl.dart';

class MyForm extends StatefulWidget {
  const MyForm({super.key});

  @override
  State<MyForm> createState() => _MyFormState();
}

class _MyFormState extends State<MyForm> {
  var _myFormKey = GlobalKey<FormState>();
  String name = "";
  // String dropdownValue = 'Daily';
  final Color firstColor = const Color.fromARGB(133, 30, 62, 1);
  final Color secondColor = const Color.fromARGB(5, 30, 62, 1);
  final nameController = TextEditingController();
  final addressController = TextEditingController();
  final numberController = TextEditingController();
  final pincodeController = TextEditingController();
  final dropdownvalue = TextEditingController();
  TextEditingController dateInput = TextEditingController();
  TextEditingController timeinput = TextEditingController();
  late DatabaseReference dbref;
  @override
  void initState() {
    super.initState();
    dbref = FirebaseDatabase.instance.ref().child('Daily');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("Please fill up the details")),
        body: SingleChildScrollView(
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Stack(
              children: [
                ClipPath(
                  clipper: MyClipper(),
                  child: Container(
                    width: double.infinity,
                    height: 350,
                    decoration: BoxDecoration(
                        gradient:
                            LinearGradient(colors: [firstColor, secondColor]),
                        boxShadow: const [
                          BoxShadow(
                              color: Color.fromARGB(255, 107, 126, 252),
                              blurRadius: 12,
                              offset: Offset(0, 0))
                        ]),
                  ),
                ),
                Positioned(
                    top: 50,
                    left: 25,
                    child: Text(
                      'Serve Your excess food to the hungry people',
                      style: TextStyle(color: Colors.white, fontSize: 15),
                    )),
                const Positioned(
                    top: 80,
                    left: 25,
                    child: Text(
                      'Your excess food can save a life',
                      style: TextStyle(fontSize: 15.0, color: Colors.white),
                    )),
                const Positioned(
                    top: 100,
                    left: 25,
                    child: Text(
                      'Share your special days with them',
                      style: TextStyle(fontSize: 15.0, color: Colors.white),
                    )),
                const Positioned(
                    top: 140,
                    left: 25,
                    child: CircleAvatar(
                        radius: 50,
                        backgroundColor: Colors.white60,
                        foregroundImage: AssetImage('assets/icons/logo.png'))),
              ],
            ),
            Container(
              // color: Color.fromARGB(153, 252, 226, 226),

              padding: EdgeInsets.symmetric(vertical: 25.0, horizontal: 25.0),
              child: Form(
                key: _myFormKey,
                child: Column(
                  children: <Widget>[
                    TextFormField(
                      controller: nameController,
                      decoration: InputDecoration(
                          labelText: "Name", hintText: "Enter your name"),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Enter Correct Name";
                        } else {
                          return null;
                        }
                      },
                    ),
                    SizedBox(
                      height: 3.0,
                    ),
                    TextFormField(
                      controller: addressController,
                      decoration: InputDecoration(
                        labelText: "Location",
                        hintText: "Enter your Address",
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Enter Correct Address";
                        } else {
                          return null;
                        }
                      },
                    ),
                    SizedBox(
                      height: 3.0,
                    ),
                    TextFormField(
                      controller: numberController,
                      decoration: InputDecoration(
                          labelText: "Phone number",
                          hintText: "Enter your contact number"),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Enter Correct phone number";
                        } else {
                          return null;
                        }
                      },
                    ),
                    // TextFormField(
                    //   controller: pincodeController,
                    //   decoration: InputDecoration(
                    //       labelText: "Pincode",
                    //       hintText: "Enter your pincode number"),
                    //   validator: (value) {
                    //     if (value!.isEmpty) {
                    //       return "Enter Correct pincode number";
                    //     } else {
                    //       return null;
                    //     }
                    //   },
                    // ),
                    TextField(
                      controller: dateInput,
                      //editing controller of this TextField
                      decoration: InputDecoration(
                          icon: Icon(Icons.calendar_today), //icon of text field
                          labelText: "Enter Date" //label text of field
                          ),
                      readOnly: true,
                      //set it true, so that user will not able to edit text
                      onTap: () async {
                        DateTime? pickedDate = await showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime(1950),
                            //DateTime.now() - not to allow to choose before today.
                            lastDate: DateTime(2100));

                        if (pickedDate != null) {
                          print(
                              pickedDate); //pickedDate output format => 2021-03-10 00:00:00.000
                          String formattedDate =
                              DateFormat('yyyy-MM-dd').format(pickedDate);
                          print(
                              formattedDate); //formatted date output using intl package =>  2021-03-16
                          setState(() {
                            dateInput.text =
                                formattedDate; //set output date to TextField value.
                          });
                        } else {}
                      },
                    ),
                    TextField(
                      controller:
                          timeinput, //editing controller of this TextField
                      decoration: InputDecoration(
                          icon: Icon(Icons.timer), //icon of text field
                          labelText: "Enter Time" //label text of field
                          ),
                      readOnly:
                          true, //set it true, so that user will not able to edit text
                      onTap: () async {
                        TimeOfDay? pickedTime = await showTimePicker(
                          initialTime: TimeOfDay.now(),
                          context: context,
                        );

                        if (pickedTime != null) {
                          print(pickedTime.format(context)); //output 10:51 PM
                          DateTime parsedTime = DateFormat.jm()
                              .parse(pickedTime.format(context).toString());
                          //converting to DateTime so that we can further format on different pattern.
                          print(parsedTime); //output 1970-01-01 22:53:00.000
                          String formattedTime =
                              DateFormat('HH:mm:ss').format(parsedTime);
                          print(formattedTime); //output 14:59:00
                          //DateFormat() is from intl package, you can format the time on any pattern you need.

                          setState(() {
                            timeinput.text =
                                formattedTime; //set the value of text field.
                          });
                        } else {
                          print("Time is not selected");
                        }
                      },
                    ),
                    SizedBox(
                      height: 5.0,
                    ),
                    // Text(
                    //   'Select Pickup Service',
                    //   style: TextStyle(
                    //       color: Colors.indigoAccent,
                    //       // backgroundColor: Colors.indigo,
                    //       fontSize: 20,
                    //       fontWeight: FontWeight.bold),
                    // ),
                    // SizedBox(
                    //   height: 3.0,
                    // ),
                    // DropdownButton<String>(
                    //   // Step 3.
                    //   value: dropdownValue,
                    //   // Step 4.
                    //   items: <String>['Daily', 'Monthly', 'Special']
                    //       .map<DropdownMenuItem<String>>((String value) {
                    //     return DropdownMenuItem<String>(
                    //       value: value,
                    //       child: Text(
                    //         value,
                    //         style: TextStyle(
                    //             fontSize: 20,
                    //             color: Colors.indigo,
                    //             backgroundColor: Colors.white),
                    //       ),
                    //     );
                    //   }).toList(),
                    //   // Step 5.
                    //   onChanged: (String? newValue) {
                    //     setState(() {
                    //       dropdownValue = newValue!;
                    //     });
                    //   },
                    // ),
                    Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                      ElevatedButton(
                          onPressed: () async {
                            Map<String, String> feedback = {
                              'Name': nameController.text,
                              'location': addressController.text,
                              'PhoneNumber': numberController.text,
                              // 'pincode number': pincodeController.text,
                              // 'pickup date': dateInput.text,
                              'Time1': timeinput.text,
                              // 'pickup service': dropdownValue,
                            };
                            dbref.push().set(feedback);

                            Navigator.push(context, MaterialPageRoute(
                              builder: (context) {
                                return confirm();
                              },
                            ));
                          },
                          child: Text(
                            'Donate Now',
                            style: TextStyle(
                                fontSize: 18.0,
                                color: Colors.indigoAccent,
                                backgroundColor: Colors.white),
                          )),
                    ]),
                  ],
                ),
              ),
            ),
          ]),
        ));
  }
}

class MyClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0, size.height - 70);
    path.quadraticBezierTo(
        size.width / 2, size.height, size.width, size.height - 300);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    // TODO: implement shouldReclip
    return false;
  }
}
