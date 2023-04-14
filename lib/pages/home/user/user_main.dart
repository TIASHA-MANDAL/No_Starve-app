import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:no_starve/pages/home/feed_back_page.dart';
import 'package:no_starve/pages/home/home_body.dart';
import 'package:no_starve/pages/home/home_screen.dart';

import 'package:no_starve/pages/home/register.dart';
import 'package:no_starve/pages/home/user/news_feed.dart';
import 'package:no_starve/pages/others/details.dart';

import 'changepassword.dart';
import 'dashboard.dart';
import 'profile.dart';

class UserMain extends StatefulWidget {
  UserMain({Key? key}) : super(key: key);
  @override
  _UserMainState createState() => _UserMainState();
}

class _UserMainState extends State<UserMain> {
  int _selectedIndex = 0;
  static List<Widget> widgetOptions = <Widget>[
    MainScreenPage(),
    Profile(),
    ChangePassword(),
    FeedBackPageUI(),
    newsfeed(),
  ];
  void _onItemTapped(int index) {
    setState(
      () {
        _selectedIndex = index;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Welcome User"),
              ElevatedButton(
                onPressed: () async => {
                  await FirebaseAuth.instance.signOut(),
                  Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Register(),
                      ),
                      (route) => false),
                },
                child: Text(
                  'Logout',
                  style: TextStyle(
                      color: Colors.indigo,
                      fontSize: 18,
                      fontWeight: FontWeight.bold),
                ),
                style: ElevatedButton.styleFrom(
                    primary: Color.fromRGBO(253, 254, 255, 1)),
              )
            ],
          ),
        ),
        // body: SingleChildScrollView(
        //   child: MainPageBody(),
        // ),
        body: widgetOptions.elementAt(_selectedIndex),
        bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
                color: Colors.purple,
              ),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person, color: Colors.purple),
              label: 'My Profile',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.settings,
                color: Colors.purple,
              ),
              label: 'Settings',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.favorite,
                color: Colors.purple,
              ),
              label: 'Feedback',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.notifications_active,
                color: Colors.purple,
              ),
              label: 'news',
            )
          ],
          currentIndex: _selectedIndex,
          selectedItemColor: Color.fromARGB(255, 48, 47, 47),
          onTap: _onItemTapped,
        ),
      ),
    );
  }
}
