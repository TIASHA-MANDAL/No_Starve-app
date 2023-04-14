import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class PaymentGateway extends StatefulWidget {
  @override
  _PaymentGatewayState createState() => _PaymentGatewayState();
}

class _PaymentGatewayState extends State<PaymentGateway> {
  String _cardNumber = "";
  String _expiryDate = "";
  String _cvv = "";

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/icons/back2.jpeg'), fit: BoxFit.cover)),
      child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            title: Text("Payment Gateway"),
          ),
          body: Container(
            child: SingleChildScrollView(
              child: Padding(
                  padding: EdgeInsets.all(16.0),
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
                      Lottie.asset("assets/icons/payment.mp4",
                          height: 150, width: 150),
                      SizedBox(
                        height: 20,
                      ),
                      Column(
                        children: [
                          Text(
                            "Enter your card details here",
                            style: TextStyle(
                              fontSize: 20.0,
                              fontWeight: FontWeight.w600,
                              color: Colors.black,
                              // backgroundColor: Colors.white
                            ),
                          ),
                          TextFormField(
                            decoration: InputDecoration(
                              labelText: "Card Number",
                            ),
                            keyboardType: TextInputType.number,
                            onChanged: (value) {
                              setState(() {
                                _cardNumber = value;
                              });
                            },
                          ),
                        ],
                      ),
                      SizedBox(height: 16.0),
                      Row(
                        children: [
                          Expanded(
                            child: SizedBox(
                              width: 40,
                              child: TextFormField(
                                decoration:
                                    InputDecoration(labelText: "Expiry Date"),
                                keyboardType: TextInputType.datetime,
                                onChanged: (value) {
                                  setState(() {
                                    _expiryDate = value;
                                  });
                                },
                              ),
                            ),
                          ),
                          SizedBox(width: 16.0),
                          Expanded(
                            child: SizedBox(
                              width: 40,
                              child: TextFormField(
                                decoration: InputDecoration(labelText: "CVV"),
                                keyboardType: TextInputType.number,
                                onChanged: (value) {
                                  setState(() {
                                    _cvv = value;
                                  });
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 16.0),
                      ElevatedButton(
                        onPressed: () {
                          // Perform payment processing logic here
                        },
                        child: Text(
                          "Pay Now",
                          style: TextStyle(
                              fontSize: 16.0,
                              fontWeight: FontWeight.w600,
                              color: Colors.indigo,
                              backgroundColor: Colors.white),
                        ),
                      ),
                    ],
                  )),
            ),
          )),
    );
  }
}
