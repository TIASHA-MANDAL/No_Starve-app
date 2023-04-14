import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:no_starve/controllers/product_controller.dart';
import 'package:no_starve/firebase_options.dart';
import 'package:no_starve/pages/home/feed_back_page.dart';
import 'package:no_starve/pages/home/form.dart';
import 'package:no_starve/pages/home/home_contact.dart';
import 'package:no_starve/pages/home/home_screen.dart';

import 'package:no_starve/pages/home/register.dart';
import 'package:no_starve/pages/home/user/changepassword.dart';
import 'package:no_starve/pages/home/user/confirm.dart';
import 'package:no_starve/pages/home/user/news_feed.dart';
import 'package:no_starve/pages/home/user/pay.dart';
import 'package:no_starve/pages/home/user/profile.dart';
import 'package:no_starve/pages/home/user/user_main.dart';

import 'helper/dependencies.dart' as dep;
import 'package:http/http.dart' as http;
import 'package:form_validator/form_validator.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp();
  await dep.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();
  // const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    Get.find<PopularProductController>().getPopularProductList();
    return FutureBuilder(
        future: _initialization,
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            print("Something Went Wrong");
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }
          return GetMaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'NoStarve',
            theme: ThemeData(
              colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
              useMaterial3: true,
            ),
            home: Register(),
          );
        });
  }
}
