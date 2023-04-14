import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:no_starve/pages/home/feed_back_page.dart';
import 'package:no_starve/pages/home/home_screen.dart';
import 'package:no_starve/pages/home/user/user_main.dart';
import 'package:no_starve/widgets/app_icon.dart';
import 'package:no_starve/widgets/dimensions.dart';
import 'package:no_starve/widgets/expandable_text_widget.dart';
import 'package:no_starve/widgets/small_text.dart';

import '../../widgets/big_text.dart';

class PopularDetails extends StatelessWidget {
  const PopularDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        Positioned(
            left: 0,
            right: 0,
            child: Container(
              width: double.maxFinite,
              height: Dimensions.popularImgSize,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage("assets/images/child2.jpg"))),
            )),
        Positioned(
            top: Dimensions.height30,
            left: Dimensions.width30,
            width: Dimensions.width55,
            child: Row(
              children: [
                IconButton(
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(
                        builder: (context) {
                          return UserMain();
                        },
                      ));
                    },
                    icon: Icon(
                      Icons.arrow_back_ios,
                      color: Color.fromARGB(255, 223, 210, 246),
                      size: Dimensions.iconSize30,
                    )),
              ],
            )),
        Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            top: Dimensions.popularImgSize - 20,
            child: Container(
              padding: EdgeInsets.only(
                left: Dimensions.width20,
                right: Dimensions.width20,
                top: Dimensions.height20,
              ),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(Dimensions.radius20),
                      topLeft: Radius.circular(Dimensions.radius20)),
                  color: Colors.white60),
              child: Column(
                children: [
                  Image(
                    image: ResizeImage(AssetImage('assets/icons/logo.png'),
                        width: 100, height: 100),
                  ),
                  BigText(
                    text: 'No Starve',
                    color: Colors.black,
                  ),
                  SizedBox(
                    width: Dimensions.width10,
                  ),
                  SmallText(
                    text: "About Us",
                    color: Color.fromARGB(255, 13, 62, 103),
                  ),
                  SizedBox(
                    width: Dimensions.width10,
                  ),
                  SmallText(
                      text:
                          "We are providing  an open platform for different restaurants, individuals to cooperate by distributing the excess food to the poor and needy people."),
                  SizedBox(
                    width: Dimensions.width10,
                  ),
                  SmallText(
                    text: "Our Aim",
                    color: Color.fromARGB(255, 13, 62, 103),
                  ),
                  SizedBox(
                    width: Dimensions.width10,
                  ),
                  SmallText(
                      text:
                          "As per statistics, major amounts of food iswasted and sent to landfills and major waste comes from households,restaurants etc. Our main motto is to reduce the food waste and stop people sleeping with hunger\n"),
                  SizedBox(
                    width: Dimensions.width30,
                  ),
                  SmallText(
                    text:
                        "“I never look at the masses as my responsibility. I look at the individual. I can love only one person at a time. I can feed only one person at a time. Just one, one, one.”",
                    color: Color.fromARGB(255, 13, 62, 103),
                  ),
                  SizedBox(
                    width: Dimensions.width20,
                  ),
                  SmallText(
                    text: "— Mother Teresa",
                    color: Color.fromARGB(255, 13, 62, 103),
                  ),
                  // SizedBox(
                  //   width: Dimensions.width10,
                  // ),
                  // Image(
                  //   image: ResizeImage(AssetImage('assets/icons/logo.png'),
                  //       width: 150, height: 150),
                  // )
                ],
              ),
            )),
      ]),
    );
  }
}
