// ignore_for_file: unused_field

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:quicktel/components/const.dart';
import 'package:quicktel/screens/nav_screens/cart.dart';
import 'package:quicktel/screens/nav_screens/message.dart';
import 'package:quicktel/screens/nav_screens/product_screen.dart';
import 'package:quicktel/screens/nav_screens/profile.dart';
import 'package:quicktel/screens/nav_screens/shop.dart';

class Home extends StatefulWidget {
  static String id = 'home';
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late int _currentIndex;
  late List<Widget> _children;
  @override
  void initState() {
    _currentIndex = 0;
    _children = [
      const Product(),
      const Shop(),
      const Cart(),
      const Message(),
      const Profile(),
    ];
    super.initState();
  }

  int currentTab = 0;
  final List<Widget> screens = [];

  Widget currentScreen = const Product();
  final PageStorageBucket bucket = PageStorageBucket();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: bottomNav(),
      body: PageStorage(
        bucket: bucket,
        child: currentScreen,
      ),
    );
  }

  BottomAppBar bottomNav() {
    return BottomAppBar(
      shape: const CircularNotchedRectangle(),
      child: SizedBox(
        width: MediaQuery.of(context).size.width - 10,
        height: 65,
        child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(top: 12),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(
                          right: MediaQuery.of(context).size.width / 10,
                          left: MediaQuery.of(context).size.width / 20),
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            currentScreen = const Product();
                            currentTab = 0;
                          });
                        },
                        child: Column(
                          children: [
                            FaIcon(FontAwesomeIcons.house,
                                color: currentTab == 0 ? maincl : Colors.grey),
                            Text(
                              "home",
                              style: TextStyle(
                                  color:
                                      currentTab == 0 ? maincl : Colors.grey),
                            )
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          right: MediaQuery.of(context).size.width / 10),
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            currentScreen = const Shop();
                            currentTab = 1;
                          });
                        },
                        child: Column(
                          children: [
                            FaIcon(FontAwesomeIcons.bagShopping,
                                color: currentTab == 1 ? maincl : Colors.grey),
                            Text(
                              "Shop",
                              style: TextStyle(
                                  color:
                                      currentTab == 1 ? maincl : Colors.grey),
                            )
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          right: MediaQuery.of(context).size.width / 10),
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            currentScreen = const Cart();
                            currentTab = 2;
                          });
                        },
                        child: Column(
                          children: [
                            FaIcon(FontAwesomeIcons.cartShopping,
                                color: currentTab == 2 ? maincl : Colors.grey),
                            Text(
                              "Cart",
                              style: TextStyle(
                                  color:
                                      currentTab == 2 ? maincl : Colors.grey),
                            )
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          right: MediaQuery.of(context).size.width / 10),
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            currentScreen = const Message();
                            currentTab = 3;
                          });
                        },
                        child: Column(
                          children: [
                            FaIcon(FontAwesomeIcons.commentDots,
                                color: currentTab == 3 ? maincl : Colors.grey),
                            Text(
                              "Message",
                              style: TextStyle(
                                  color:
                                      currentTab == 3 ? maincl : Colors.grey),
                            )
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          right: MediaQuery.of(context).size.width / 20),
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            currentScreen = const Profile();
                            currentTab = 4;
                          });
                        },
                        child: Column(
                          children: [
                            FaIcon(FontAwesomeIcons.user,
                                color: currentTab == 4 ? maincl : Colors.grey),
                            Text(
                              "Account",
                              style: TextStyle(
                                  color:
                                      currentTab == 4 ? maincl : Colors.grey),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ]),
      ),
    );
  }
}
