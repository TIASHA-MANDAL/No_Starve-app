import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:no_starve/pages/home/user/user_main.dart';

class confirm extends StatefulWidget {
  const confirm({super.key});

  @override
  State<confirm> createState() => _confirmState();
}

class _confirmState extends State<confirm> with SingleTickerProviderStateMixin {
  late AnimationController controller;
  @override
  void initState() {
    super.initState();

    controller = AnimationController(
      duration: Duration(seconds: 3),
      vsync: this,
    );
    controller.addStatusListener((status) async {
      if (status == AnimationStatus.completed) {
        Navigator.push(this.context, MaterialPageRoute(
          builder: (context) {
            return UserMain();
          },
        ));
      }
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(
                Icons.arrow_back_ios_rounded,
                color: Colors.black,
              )),
        ),
        body: Container(
          child: Center(
            child: Column(
              children: [
                Image(
                  image: ResizeImage(
                    AssetImage('assets/icons/logo.png'),
                    width: 100,
                    height: 100,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Lottie.network(
                    "https://assets4.lottiefiles.com/private_files/lf30_vb7v5ca0.json",
                    height: 250,
                    width: 250),
                SizedBox(
                  height: 32,
                ),
                Text(
                  "Your Food Pickup Request is Confirmed!",
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      color: Colors.deepOrangeAccent),
                ),
                SizedBox(
                  height: 20,
                ),
                ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.symmetric(horizontal: 8),
                        textStyle: TextStyle(fontSize: 20)),
                    icon: Icon(
                      Icons.delivery_dining,
                      size: 42,
                      color: Colors.deepOrangeAccent,
                    ),
                    onPressed: showDoneDialog,
                    label: Text(
                      'Click Here!',
                      style:
                          TextStyle(fontSize: 20.0, color: Colors.deepOrange),
                    )),
                SizedBox(
                  height: 20,
                ),
                Text(
                  "Thank You for donating food.\n Your small help can make a big change",
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: Colors.indigoAccent),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void showDoneDialog() => showDialog(
      barrierDismissible: false,
      context: this.context,
      builder: (context) => Dialog(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Lottie.network(
                    "https://assets1.lottiefiles.com/packages/lf20_zwkm4xbs.json",
                    repeat: false,
                    controller: controller, onLoaded: (composition) {
                  controller.duration = composition.duration;
                  controller.forward();
                }),
                Text(
                  "Our agent will contact you soon",
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
                ),
                const SizedBox(
                  height: 16,
                )
              ],
            ),
          ));
}
