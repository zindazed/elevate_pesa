import 'package:animated_notch_bottom_bar/animated_notch_bottom_bar/animated_notch_bottom_bar.dart';
import 'package:elevate_pesa/Global/colors.dart';
import 'package:elevate_pesa/pages/explore.dart';
import 'package:elevate_pesa/pages/home.dart';
import 'package:elevate_pesa/pages/profile.dart';
import 'package:elevate_pesa/pages/signin.dart';
import 'package:elevate_pesa/pages/signup.dart';
import 'package:elevate_pesa/pages/stats.dart';
import 'package:elevate_pesa/widgets/drawer.dart';
import 'package:flutter/material.dart';
import 'dart:developer';

import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    bool isLoggedIn = false;
    Future<void> getLoginStatus() async {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      setState(() {
        isLoggedIn = prefs.containsKey("user");
      });
    }

    return MaterialApp(
      title: 'Animated Notch Bottom Bar',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: isLoggedIn ? MyHomePage() : SignInScreen(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  final int? inputIndex;
  MyHomePage({Key? key, this.inputIndex}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  /// Controller to handle PageView and also handles initial page
  PageController _pageController = PageController(initialPage: 0);

  /// Controller to handle bottom nav bar and also handles initial page
  NotchBottomBarController _controller = NotchBottomBarController(index: 0);

  int maxCount = 5;

  @override
  void dispose() {
    _pageController.dispose();

    super.dispose();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if (widget.inputIndex != null) {
      _pageController = PageController(initialPage: widget.inputIndex!);
      _controller = NotchBottomBarController(index: widget.inputIndex!);
    }
  }

  @override
  Widget build(BuildContext context) {
    /// widget list
    final List<Widget> bottomBarPages = [
      HomePage(),
      StatsPage(),
      ExplorePage(),
      ProfilePage(),
    ];
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text('Good Morning'),
        centerTitle: true,
        backgroundColor: primaryColor,
        foregroundColor: secondColor,
        actions: <Widget>[
          IconButton(
            iconSize: 50,
            icon: Icon(
              Icons.person_3_sharp,
              size: 30,
              color: thirdColor,
            ),
            onPressed: () {},
          ),
        ],
      ),
      drawer: CustomDrawer(scaffoldKey: _scaffoldKey),
      body: PageView(
        controller: _pageController,
        physics: NeverScrollableScrollPhysics(),
        children: List.generate(
            bottomBarPages.length, (index) => bottomBarPages[index]),
      ),
      extendBody: true,
      bottomNavigationBar: (bottomBarPages.length <= maxCount)
          ? AnimatedNotchBottomBar(
              /// Provide NotchBottomBarController
              notchBottomBarController: _controller,
              color: primaryColor,
              showLabel: true,
              showBlurBottomBar: true,
              blurOpacity: 1,
              blurFilterX: 5.0,
              blurFilterY: 10.0,
              // notchShader:  SweepGradient(
              //   startAngle: 0,
              //   endAngle: pi / 2,
              //   colors: [Colors.red, Colors.green, Colors.orange],
              //   tileMode: TileMode.mirror,
              // ).createShader(Rect.fromCircle(center: Offset.zero, radius: 8.0)),
              notchColor: secondColor,

              /// restart app if you change removeMargins
              removeMargins: false,
              bottomBarWidth: 500,
              showShadow: true,
              durationInMilliSeconds: 300,

              itemLabelStyle: TextStyle(fontSize: 10),
              bottomBarItems: [
                BottomBarItem(
                  inActiveItem: Icon(
                    Icons.home_outlined,
                    color: secondColor,
                  ),
                  activeItem: Icon(
                    Icons.home,
                    color: primaryColor,
                  ),
                  itemLabel: 'Home',
                ),
                BottomBarItem(
                  inActiveItem:
                      Icon(Icons.bar_chart_outlined, color: secondColor),
                  activeItem: Icon(
                    Icons.bar_chart,
                    color: primaryColor,
                  ),
                  itemLabel: 'Stats',
                ),
                BottomBarItem(
                  inActiveItem: Icon(
                    Icons.explore_outlined,
                    color: secondColor,
                  ),
                  activeItem: Icon(
                    Icons.explore,
                    color: primaryColor,
                  ),
                  itemLabel: 'Explore',
                ),
                BottomBarItem(
                  inActiveItem: Icon(
                    Icons.person_outline,
                    color: secondColor,
                  ),
                  activeItem: Icon(
                    Icons.person,
                    color: primaryColor,
                  ),
                  itemLabel: 'Profile',
                ),
              ],
              onTap: (index) {
                // log('current selected index $index');
                _pageController.jumpToPage(index);
              },
              kIconSize: 20.0,
              kBottomRadius: 10.0,
            )
          : null,
    );
  }
}

/// add controller to check weather index through change or not. in page 1
class Page1 extends StatelessWidget {
  final NotchBottomBarController? controller;

  Page1({Key? key, this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Center(
        /// adding GestureDetector
        child: Text('Page 1'),
      ),
    );
  }
}
