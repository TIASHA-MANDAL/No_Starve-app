import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:no_starve/colors.dart';
import 'package:no_starve/pages/home/form.dart';
import 'package:no_starve/widgets/big_text.dart';
import 'package:no_starve/widgets/dimensions.dart';

import 'package:no_starve/widgets/small_text.dart';

class MainPageBody extends StatefulWidget {
  const MainPageBody({super.key});

  @override
  State<MainPageBody> createState() => _MainPageBodyState();
}

class _MainPageBodyState extends State<MainPageBody> {
  PageController pageController = PageController(viewportFraction: 0.85);
  var currPageValue = 0.0;
  double scaleFactor = 0.8;
  double _height = Dimensions.pageViewContainer;
  @override
  void initState() {
    super.initState();
    (pageController.addListener(() {
      setState(() {
        currPageValue = pageController.page!;
      });
    }));
  }

  @override
  void dispose() {
    super.dispose();
    pageController.dispose();
  }

  List a = [
    "https://d113wk4ga3f0l0.cloudfront.net/c?o=eJw1jU0OwiAUhO_CuqEPbG3rVm_gARqE1xYpQvhJY4x3l0adzWSS-WZeJLocJI4Gn-REZN10HHjLaw6sgwYYMN42fQ1FDMbL9QyMDUd69zOp_uwtS4Npx52lq56XFJOThmorZow0-9UJFakPTmWZtHsU9Ps3tdN0GErctEoLOfUDVGTBfeIXElq_ioSlvBULVgSDChh5fwC8ezqW&s=f847279efb09b63b727f3bdcdf7f028b16381c61",
    "https://as2.ftcdn.net/v2/jpg/02/78/16/03/1000_F_278160345_JCtJn4nHYm2FYxxl6LIiNNjyT7biOVLX.jpg",
    "https://newsonair.com/wp-content/uploads/2023/01/food-security-696x522.jpg"
  ];
  List b = [
    "https://images.outlookindia.com/public/uploads/articles/2020/4/21/Poor_child_(1).jpg",
    "https://media.istockphoto.com/id/490399368/photo/group-of-african-black-children-holding-rice-malnutrition-starvation-hunger.jpg?s=612x612&w=0&k=20&c=gJgB17FdZtNKGnqpmjseeiekAZIbbmZODFWnrFth8UA=",
    "https://media.istockphoto.com/id/1060352544/photo/donate-food-to-hungry-people-concept-of-poverty-and-hunger.jpg?s=170667a&w=0&k=20&c=ZVzRbryeyvivpG5QCf34ipGjwqqbeTzZR2uPRi8Fca0="
  ];

  @override
  Widget build(BuildContext context) {
    var arrNames = ["Donate Daily", "Donate Monthly", "Special Donation"];
    return Column(children: [
      Container(
        height: Dimensions.pageView,
        //color: Color.fromARGB(255, 224, 244, 242),
        child: PageView.builder(
            controller: pageController,
            itemCount: b.length,
            itemBuilder: (context, position) {
              return _buildPageItem(position);
            }),
      ),
      new DotsIndicator(
        dotsCount: 3,
        position: currPageValue,
        decorator: DotsDecorator(
          activeColor: AppColors.mainColor,
          size: const Size.square(9.0),
          activeSize: const Size(18.0, 9.0),
          activeShape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
        ),
      ),
      SizedBox(
        height: Dimensions.height30,
      ),
      Container(
        margin: EdgeInsets.only(left: Dimensions.width30),
        child: Row(crossAxisAlignment: CrossAxisAlignment.end, children: [
          BigText(
            text: "Donate Food",
          ),
          SizedBox(
            width: Dimensions.width10,
          ),
          Container(
            margin: const EdgeInsets.only(bottom: 3),
            child: BigText(
              text: ".",
              color: Colors.black26,
            ),
          ),
          SizedBox(
            width: Dimensions.width10,
          ),
          Container(
            margin: const EdgeInsets.only(bottom: 2),
            child: SmallText(
              text: "Select Choices",
            ),
          ),
        ]),
      ),
      //LIST OF OPTIONS AND IMAGES

      ListView.builder(
          physics: NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: a.length,
          itemBuilder: (context, index) {
            return Container(
                margin: EdgeInsets.only(
                    left: Dimensions.width20,
                    right: Dimensions.width20,
                    bottom: Dimensions.height10),
                child: Row(children: [
                  Container(
                    width: Dimensions.listViewImgSize,
                    height: Dimensions.listViewImgSize,
                    decoration: BoxDecoration(
                        borderRadius:
                            BorderRadius.circular(Dimensions.radius20),
                        color: Colors.white38,
                        image: DecorationImage(
                            fit: BoxFit.cover, image: NetworkImage(a[index]))),
                  ),
                  Expanded(
                      child: Container(
                    height: Dimensions.listViewTextSize,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(Dimensions.radius20),
                          bottomRight: Radius.circular(Dimensions.radius20),
                          topLeft: Radius.circular(Dimensions.radius20),
                          bottomLeft: Radius.circular(Dimensions.radius20)),
                      color: Color.fromARGB(153, 231, 250, 255),
                    ),
                    child: Padding(
                      padding: EdgeInsets.only(
                          left: Dimensions.width10, right: Dimensions.width10),
                      child: Column(
                        children: [
                          ElevatedButton(
                            onPressed: () {
                              Navigator.push(context, MaterialPageRoute(
                                builder: (context) {
                                  return MyForm();
                                },
                              ));
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xFFf7f6f4),
                              //shadowColor:
                              //Color.fromARGB(153, 253, 215, 215)
                            ),
                            child: Text(
                              arrNames[index],
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.w600),
                            ),
                          ),
                          SmallText(
                            text:
                                "Serve Your Excess food to the hungry people ,Your excess food can save a life",
                            color: Colors.black,
                          ),
                        ],
                      ),
                    ),
                  ))
                ]));
          })
    ]);
  }

  Widget _buildPageItem(int index) {
    Matrix4 matrix = new Matrix4.identity();
    if (index == currPageValue.floor()) {
      if (index == currPageValue.floor()) {
        var currScale = 1 - (currPageValue - index) * (1 - scaleFactor);
        var currTrans = _height * (1 - currScale) / 2;
        matrix = Matrix4.diagonal3Values(1, currScale, 1)
          ..setTranslationRaw(0, currTrans, 0);
      } else if (index == currPageValue.floor() + 1) {
        var currScale =
            scaleFactor + (currPageValue - index + 1) * (1 - scaleFactor);
        var currTrans = _height * (1 - currScale) / 2;
        matrix = Matrix4.diagonal3Values(1, currScale, 1);
        matrix = Matrix4.diagonal3Values(1, currScale, 1)
          ..setTranslationRaw(0, currTrans, 0);
      } else if (index == currPageValue.floor() - 1) {
        var currScale = 1 - (currPageValue - index) * (1 - scaleFactor);
        var currTrans = _height * (1 - currScale) / 2;
        matrix = Matrix4.diagonal3Values(1, currScale, 1);
        matrix = Matrix4.diagonal3Values(1, currScale, 1)
          ..setTranslationRaw(0, currTrans, 0);
      } else {
        var currScale = 0.8;
        matrix = Matrix4.diagonal3Values(1, currScale, 1)
          ..setTranslationRaw(0, _height * (1 - scaleFactor) / 2, 1);
      }
    }
    return Transform(
      transform: matrix,
      child: Stack(children: [
        Container(
          height: Dimensions.pageViewContainer,
          margin: EdgeInsets.only(
              left: Dimensions.width10, right: Dimensions.width10),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(Dimensions.radius30),
              color: index.isEven ? Color(0xFF69c5df) : Color(0xFF9294cc),
              image: DecorationImage(
                fit: BoxFit.cover,
                image: NetworkImage(b[index]),
              )),
        ),
        Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: 140,
              margin: EdgeInsets.only(
                  left: Dimensions.width30,
                  right: Dimensions.width30,
                  bottom: Dimensions.height30),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(Dimensions.radius20),
                color: Colors.white54,
              ),
              child: Container(
                  padding: EdgeInsets.only(top: 10, left: 15, right: 15),
                  child: Column(
                    children: [
                      const Image(
                        image: ResizeImage(AssetImage('assets/icons/logo.png'),
                            width: 100, height: 100),
                      ),
                      //BigText(text: "Our Goals"),
                      SizedBox(
                        height: Dimensions.height10,
                      ),
                      Row(
                        children: [
                          SmallText(
                            text: "Let's Build a World with Zero Hunger",
                            color: Colors.black,
                          ),
                          SizedBox(
                            height: Dimensions.height20,
                          ),
                        ],
                      )
                    ],
                  )),
            ))
      ]),
    );
  }
}
