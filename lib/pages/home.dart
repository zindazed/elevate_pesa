import 'package:elevate_pesa/Global/colors.dart';
import 'package:elevate_pesa/components/notify.dart';
import 'package:elevate_pesa/pages/bills.dart';
import 'package:elevate_pesa/pages/chatRoom.dart';
import 'package:elevate_pesa/pages/invest.dart';
import 'package:elevate_pesa/pages/wallet.dart';
import 'package:elevate_pesa/widgets/drawer.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:lottie/lottie.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool _isPressed1 = false;
  bool _isPressed2 = false;
  bool _isPressed3 = false;
  bool _isPressed4 = false;
  bool _isPressed5 = false;
  bool _safelocked = false;
  // String _safePin = "1234";

  void _lockSafe() {
    setState(() {
      _safelocked = !_safelocked;
    });
  }

  // void _unlockSafe(TapDownDetails details) {
  //   setState(() {
  //     _safelocked = false;
  //   });
  // }

  void _onTapDown1(TapDownDetails details) {
    setState(() {
      _isPressed1 = true;
    });
  }

  void _onTapDown2(TapDownDetails details) {
    setState(() {
      _isPressed2 = true;
    });
  }

  void _onTapDown3(TapDownDetails details) {
    setState(() {
      _isPressed3 = true;
    });
  }

  void _onTapDown4(TapDownDetails details) {
    setState(() {
      _isPressed4 = true;
    });
  }

  void _onTapDown5(TapDownDetails details) {
    setState(() {
      _isPressed5 = true;
    });
  }

  void _onTapUp1(TapUpDetails details) {
    setState(() {
      _isPressed1 = false;
    });
  }

  void _onTapUp2(TapUpDetails details) {
    setState(() {
      _isPressed2 = false;
    });
  }

  void _onTapUp3(TapUpDetails details) {
    setState(() {
      _isPressed3 = false;
    });
  }

  void _onTapUp4(TapUpDetails details) {
    setState(() {
      _isPressed4 = false;
    });
  }

  void _onTapUp5(TapUpDetails details) {
    setState(() {
      _isPressed5 = false;
    });
  }

  void _onTapCancel1() {
    setState(() {
      _isPressed1 = false;
    });
  }

  void _onTapCancel2() {
    setState(() {
      _isPressed2 = false;
    });
  }

  void _onTapCancel3() {
    setState(() {
      _isPressed3 = false;
    });
  }

  void _onTapCancel4() {
    setState(() {
      _isPressed4 = false;
    });
  }

  void _onTapCancel5() {
    setState(() {
      _isPressed5 = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: MediaQuery.of(context).size.height * 0.2,
          // color: Colors.amberAccent,
          child: Center(
            // child: Text(
            //   "Elevate Pesa",
            //   style: TextStyle(
            //       color: primaryColor,
            //       fontSize: 28,
            //       fontWeight: FontWeight.w900),
            // ),
            child: Image.asset(
              "assets/elevatePesa.png",
              width: 200,
              height: 100,
            ),
          ),
        ),
        Container(
          padding: EdgeInsets.only(left: 20, right: 20),
          child: centerMenu(context),
        ),
      ],
    );
  }

  Widget centerMenu(BuildContext context) {
    return Stack(
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: GestureDetector(
                    onTapDown: _onTapDown1,
                    onTapUp: _onTapUp1,
                    onTapCancel: _onTapCancel1,
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => InvestPage()));
                    },
                    child: Container(
                      padding: EdgeInsets.all(8),
                      height: 150,
                      decoration: BoxDecoration(
                        color: _isPressed1 ? primaryColorP : primaryColor,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: _isPressed1
                            ? []
                            : [
                                BoxShadow(
                                  color: Colors.grey
                                      .withOpacity(0.5), // Shadow color
                                  spreadRadius: 1, // Spread radius
                                  blurRadius: 2, // Blur radius
                                  offset:
                                      Offset(0, 3), // Offset position of shadow
                                ),
                              ],
                      ),
                      child: Stack(
                        children: [
                          Positioned(
                            left: 10,
                            bottom: 20,
                            child: Text(
                              'Invest',
                              style: TextStyle(
                                  color: secondColor,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold),
                              textAlign: TextAlign.center,
                            ),
                          ), // Text
                          Positioned(
                            left: 0,
                            top: 0,
                            // child: Lottie.asset('assets/inventLottie.json',
                            //     width: 100, height: 50),
                            child: Image.asset(
                              "assets/invest2.png",
                              width: 110,
                              height: 70,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 8.0),
                Expanded(
                  child: GestureDetector(
                    onTapDown: _onTapDown2,
                    onTapUp: _onTapUp2,
                    onTapCancel: _onTapCancel2,
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => BillsPage()));
                    },
                    child: Container(
                      padding: EdgeInsets.all(8),
                      height: 150,
                      decoration: BoxDecoration(
                        color: _isPressed2 ? primaryColorP : primaryColor,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: _isPressed2
                            ? []
                            : [
                                BoxShadow(
                                  color: Colors.grey
                                      .withOpacity(0.5), // Shadow color
                                  spreadRadius: 1, // Spread radius
                                  blurRadius: 2, // Blur radius
                                  offset:
                                      Offset(0, 3), // Offset position of shadow
                                ),
                              ],
                      ),
                      child: Stack(
                        children: [
                          Positioned(
                            right: 5,
                            bottom: 20,
                            child: Text(
                              'Credit',
                              style: TextStyle(
                                  color: secondColor,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold),
                              textAlign: TextAlign.center,
                            ),
                          ), // Text
                          Positioned(
                            right: 0,
                            top: 0,
                            child: Image.asset(
                              "assets/bills2.png",
                              width: 110,
                              height: 70,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: GestureDetector(
                    onTapDown: _onTapDown3,
                    onTapUp: _onTapUp3,
                    onTapCancel: _onTapCancel3,
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => CharityPage()));
                    },
                    child: Container(
                      height: 150,
                      decoration: BoxDecoration(
                        color: _isPressed3 ? primaryColorP : primaryColor,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: _isPressed3
                            ? []
                            : [
                                BoxShadow(
                                  color: Colors.grey
                                      .withOpacity(0.5), // Shadow color
                                  spreadRadius: 1, // Spread radius
                                  blurRadius: 2, // Blur radius
                                  offset:
                                      Offset(0, 3), // Offset position of shadow
                                ),
                              ],
                      ),
                      child: Stack(
                        children: [
                          Positioned(
                            bottom: 20,
                            left: 20,
                            child: Text(
                              'Fundraise',
                              style: TextStyle(
                                  color: secondColor,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold),
                              textAlign: TextAlign.center,
                            ),
                          ), // Text
                          Positioned(
                            left: 0,
                            top: 20,
                            child: Image.asset(
                              "assets/charity.png",
                              width: 110,
                              height: 70,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 8.0),
                Expanded(
                  child: GestureDetector(
                    onTapDown: _onTapDown4,
                    onTapUp: _onTapUp4,
                    onTapCancel: _onTapCancel4,
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => ChatRoom()));
                    },
                    child: Container(
                      height: 150,
                      decoration: BoxDecoration(
                        color: _isPressed4 ? primaryColorP : primaryColor,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: _isPressed4
                            ? []
                            : [
                                BoxShadow(
                                  color: Colors.grey
                                      .withOpacity(0.5), // Shadow color
                                  spreadRadius: 1, // Spread radius
                                  blurRadius: 2, // Blur radius
                                  offset:
                                      Offset(0, 3), // Offset position of shadow
                                ),
                              ],
                      ),
                      child: Stack(
                        children: [
                          Positioned(
                            bottom: 20,
                            right: 5,
                            child: Text(
                              'Customer care',
                              style: TextStyle(
                                  color: secondColor,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold),
                              textAlign: TextAlign.center,
                            ),
                          ), // Text
                          Positioned(
                            right: 0,
                            top: 30,
                            child: Image.asset(
                              "assets/helpline.png",
                              width: 110,
                              height: 70,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
        Positioned(
          left: (MediaQuery.of(context).size.width - 40) / 2 - 75,
          top: 308 / 2 - 75,
          child: Container(
            height: 150,
            width: 150, // Set the width equal to the height to make it a circle
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(
                  65), // Half of the width to make it a circle
              border: Border.all(
                  color: secondColor, width: 12), // Thick white border
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.3), // Shadow color
                  spreadRadius: 3, // Spread radius
                  blurRadius: 7, // Blur radius
                  offset: Offset(0, 3), // Offset
                ),
              ],
            ),
            child: GestureDetector(
              onTapDown: _onTapDown5,
              onTapUp: _onTapUp5,
              onTapCancel: _onTapCancel5,
              onLongPress: _lockSafe,
              onTap: () {
                if (_safelocked) {
                  popUp(
                      context: context,
                      message: "Safe is locked",
                      bColor: Colors.orange);
                } else {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => WalletPage()));
                }
              },
              child: Container(
                decoration: BoxDecoration(
                  color: _isPressed5 ? primaryColorP : primaryColor,
                  borderRadius: BorderRadius.circular(
                      50), // Half of the width to make it a circle
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(height: 8),
                    Text(
                      'Safe',
                      style: TextStyle(
                          color: secondColor,
                          fontWeight: FontWeight.w900,
                          fontSize: 20),
                      textAlign: TextAlign.center,
                    ),
                    (_safelocked)
                        ? Text(
                            'Locked',
                            style: TextStyle(
                                color: Colors.red,
                                fontWeight: FontWeight.w900,
                                fontSize: 12),
                            textAlign: TextAlign.center,
                          )
                        : Text(
                            'Unlocked',
                            style: TextStyle(
                                color: Colors.yellow,
                                fontWeight: FontWeight.w900,
                                fontSize: 12),
                            textAlign: TextAlign.center,
                          ),
                    (_safelocked)
                        ? Image.asset(
                            "assets/safe-locked.png",
                            width: 110,
                            height: 70,
                          )
                        : Image.asset(
                            "assets/safe-unlocked.png",
                            width: 110,
                            height: 70,
                          ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class CharityPage extends StatelessWidget {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  CharityPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text('Charity'),
        centerTitle: true,
        backgroundColor: primaryColor,
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
      //drawer: CustomDrawer(scaffoldKey: _scaffoldKey),
      body: Container(
          color: Colors.white, child: Center(child: Text('Charity Page'))),
    );
  }
}
