import 'package:flutter/material.dart';
import 'package:no_starve/colors.dart';
import 'package:no_starve/pages/home/home_body.dart';
import 'package:no_starve/pages/home/user/user_main.dart';
import 'package:no_starve/pages/others/details.dart';
import 'package:no_starve/widgets/big_text.dart';
import 'package:no_starve/widgets/dimensions.dart';
import 'package:no_starve/widgets/small_text.dart';

class MainScreenPage extends StatefulWidget {
  const MainScreenPage({super.key});

  @override
  State<MainScreenPage> createState() => _MainScreenPageState();
}

class _MainScreenPageState extends State<MainScreenPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        Container(
            margin: EdgeInsets.only(
                top: Dimensions.height45, bottom: Dimensions.height15),
            padding: EdgeInsets.only(
                left: Dimensions.width20, right: Dimensions.width20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    // Image(
                    //   image: ResizeImage(AssetImage('assets/icons/logo.png'),
                    //       width: 100, height: 100),
                    // ),
                    Row(
                      children: [
                        BigText(text: "India", color: AppColors.mainColor),
                        Icon(Icons.arrow_drop_down_rounded)
                      ],
                    ),
                    Row(
                      children: [
                        SmallText(
                          text: "Kolkata",
                          color: Colors.black54,
                        ),
                        Icon(Icons.arrow_drop_down_rounded)
                      ],
                    )
                  ],
                ),
                Center(
                  child: Container(
                    width: Dimensions.width45,
                    height: Dimensions.height45,
                    child:
                        // Icon(
                        //   Icons.arrow_forward_ios,
                        //   color: Color.fromARGB(255, 9, 6, 6),
                        //   size: Dimensions.iconSize24,
                        // )
                        IconButton(
                            onPressed: () {
                              Navigator.push(context, MaterialPageRoute(
                                builder: (context) {
                                  return PopularDetails();
                                },
                              ));
                            },
                            icon: Icon(
                              Icons.arrow_forward_ios,
                            )),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Color.fromARGB(255, 242, 253, 252),
                    ),
                  ),
                )
              ],
            )),
        Expanded(
          child: SingleChildScrollView(
            child: MainPageBody(),
          ),
        ),
      ]),
    );
  }
}
