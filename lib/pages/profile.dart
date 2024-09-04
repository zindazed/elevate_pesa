import 'dart:convert';

import 'package:elevate_pesa/Global/colors.dart';
import 'package:elevate_pesa/main.dart';
import 'package:elevate_pesa/pages/FAQ.dart';
import 'package:elevate_pesa/pages/featureNotReady.dart';
import 'package:elevate_pesa/pages/userDetails.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  String email = "";
  List groupedMessages = [];
  List<Map<String, dynamic>> userAccountTiles = [];
  List<Map<String, dynamic>> medicAccountTiles = [];
  List<Map<String, dynamic>> pharmacyAccountTiles = [];
  int _msgCount = 0;
  int _msgCountC = 0;
  Future<void> getLoggedinUser() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (prefs.containsKey("user")) {
      setState(() {
        email = prefs.getString('user')!;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    getLoggedinUser();
  }

  @override
  Widget build(BuildContext context) {
    var screen = MediaQuery.of(context).size;

    double fontSize = screen.width * 0.03;
    double iconSize = screen.width * 0.12;

    userAccountTiles = [
      {
        "name": "My Info",
        "icon": Icons.info_outline,
        "page": UserProfilePage()
      },
      {
        "name": "FAQs",
        "icon": Icons.question_mark_outlined,
        "page": FAQPage(),
        "rounded": true
      },
      {
        "name": "Terms of Use",
        "icon": Icons.read_more,
        "page": FeatureNotReadyPage(),
      },
      {
        "name": "Privacy Policy",
        "icon": Icons.policy_outlined,
        "page": FeatureNotReadyPage(),
      }
    ];

    return Scaffold(
        // backgroundColor: Colors.grey[200],
        backgroundColor: secondColor,
        body: SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.all(0.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                        // padding: EdgeInsets.all(16),
                        child:
                            userAccount("My User Account", userAccountTiles)),
                  ],
                ),
                // (jsonResponse['user']["role_id"] == 3)
                //     ? userAccount(
                //         "My Health Professional Account", medicAccountTiles)
                //     : Container(),
                // // Container(),
                // (jsonResponse['user']["role_id"] == 4)
                //     // buildPharmacyDashboard()
                //     ? userAccount("My Pharmacy Account", pharmacyAccountTiles)
                //     : Container(),
                SizedBox(
                  height: screen.height * 0.03,
                ),
                buildLogout()
              ],
            ),
          ),
        ));
  }

  Widget userAccount(String title, List<Map<String, dynamic>> tiles) {
    List<Widget> tiledWigets = [];
    for (Map tile in tiles) {
      tiledWigets.add(
        GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => tile['page']),
            ).then((value) {
              setState(() {
                getLoggedinUser();
              });
            });
          },
          child: Container(
            decoration: BoxDecoration(color: Colors.white),
            padding: (tile.containsKey("badge"))
                ? EdgeInsets.only(left: 12, bottom: 10, top: 10, right: 16)
                : EdgeInsets.only(left: 16, bottom: 10, top: 10, right: 16),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    (tile.containsKey("rounded"))
                        ? Container(
                            decoration: BoxDecoration(
                                border:
                                    Border.all(color: Colors.black, width: 2),
                                borderRadius: BorderRadius.circular(50)),
                            child: const Icon(Icons.question_mark_outlined,
                                size: 17, color: Colors.black))
                        : (tile.containsKey("badge"))
                            ? IconButton(
                                icon: Stack(
                                  children: <Widget>[
                                    Positioned(
                                      left: 0,
                                      top: 5,
                                      child: Icon(
                                        Icons.message_outlined,
                                        size: 22,
                                        color: Colors.black,
                                      ),
                                    ),
                                    Positioned(
                                      left: 10,
                                      top: 0,
                                      child: Container(
                                        padding: EdgeInsets.all(3),
                                        decoration: BoxDecoration(
                                          color: Colors.redAccent,
                                          borderRadius:
                                              BorderRadius.circular(8),
                                        ),
                                        constraints: BoxConstraints(
                                          minWidth: 12,
                                          minHeight: 12,
                                        ),
                                        child: Text(
                                          // _msgCount
                                          _msgCountC
                                              .toString(), // You can replace this with your actual count
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 7,
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                onPressed: () {},
                              )
                            : Icon(tile['icon'], color: Colors.black),
                    (tile.containsKey("badge"))
                        ? SizedBox(width: 0)
                        : SizedBox(width: 20),
                    Text(tile['name'], style: TextStyle(color: Colors.black))
                  ],
                ),
                Icon(
                  Icons.arrow_forward_ios_outlined,
                  size: 15,
                )
              ],
            ),
          ),
        ),
      );
    }
    var screen = MediaQuery.of(context).size;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: double.infinity,
          // decoration: BoxDecoration(color: Colors.grey[300]),
          padding: EdgeInsets.all(16),
          child: Text(
            title,
            style:
                TextStyle(color: Colors.grey[700], fontWeight: FontWeight.bold),
          ),
        ),
        ...tiledWigets,
      ],
    );
  }

  // Professional's dashboard

  Widget buildProfessionalDashboard() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Center(
          child: Text(
            "Health Professional Tabs",
            style: TextStyle(color: Colors.black, fontSize: 20),
          ),
        ),
        SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Container(
                height: 150,
                decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(10)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Icon(Icons.schedule, size: 48, color: Colors.white), // Icon
                    SizedBox(height: 8),
                    Text(
                      'Patients\'\nAppointments',
                      style: TextStyle(color: Colors.white),
                      textAlign: TextAlign.center,
                    ), // Text
                  ],
                ),
              ),
            ),
            const SizedBox(width: 16.0),
            Expanded(
              child: Container(
                height: 150,
                decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.circular(10)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Icon(Icons.article_outlined,
                        size: 48, color: Colors.white), // Icon
                    SizedBox(height: 8),
                    Text(
                      'Published\nArticles',
                      style: TextStyle(color: Colors.white),
                      textAlign: TextAlign.center,
                    ), // Text
                  ],
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 16.0),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Container(
                height: 150,
                decoration: BoxDecoration(
                    color: Colors.orange,
                    borderRadius: BorderRadius.circular(10)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Icon(Icons.edit_calendar_outlined,
                        size: 48, color: Colors.white), // Icon
                    SizedBox(height: 8),
                    Text(
                      'Appointment\nAvailability',
                      style: TextStyle(color: Colors.white),
                      textAlign: TextAlign.center,
                    ), // Text
                  ],
                ),
              ),
            ),
            const SizedBox(width: 16.0),
            Expanded(
              child: Container(
                height: 150,
                decoration: BoxDecoration(
                    color: Colors.purple,
                    borderRadius: BorderRadius.circular(10)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Icon(Icons.upload_file_outlined,
                        size: 48, color: Colors.white),
                    SizedBox(height: 8),
                    Text('Upload an Article',
                        style: TextStyle(color: Colors.white)), // Text
                  ],
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

// Pharmarcy Dashboard

  Widget buildPharmacyDashboard() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Center(
          child: Text(
            "Pharmacy Management",
            style: TextStyle(color: Colors.black, fontSize: 20),
          ),
        ),
        SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: GestureDetector(
                onTap: () {},
                child: Container(
                  height: 150,
                  decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(10)),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Icon(Icons.medication,
                          size: 48, color: Colors.white), // Icon
                      SizedBox(height: 8),
                      Text('Medicine Inventory',
                          style: TextStyle(color: Colors.white)), // Text
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(width: 16.0),
            Expanded(
              child: GestureDetector(
                onTap: () {},
                child: Container(
                  height: 150,
                  decoration: BoxDecoration(
                      color: Colors.orange,
                      borderRadius: BorderRadius.circular(10)),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Icon(Icons.widgets_outlined,
                          size: 48, color: Colors.white), // Icon
                      SizedBox(height: 8),
                      Text('Medicine Categories',
                          style: TextStyle(color: Colors.white)), // Text
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 16.0),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: GestureDetector(
                onTap: () {},
                child: Container(
                  height: 150,
                  decoration: BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.circular(10)),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Icon(Icons.shopping_cart_checkout_outlined,
                          size: 48, color: Colors.white), // Icon
                      SizedBox(height: 8),
                      Text('Orders Made',
                          style: TextStyle(color: Colors.white)), // Text
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(width: 16.0),
            Expanded(
              child: Container(
                  height: 150,
                  decoration: BoxDecoration(
                      color: Colors.transparent,
                      borderRadius: BorderRadius.circular(10)),
                  child: Container()
                  // Column(
                  //   mainAxisAlignment: MainAxisAlignment.center,
                  //   children: const [
                  //     Icon(Icons.ac_unit, size: 48, color: Colors.white),
                  //     SizedBox(height: 8),
                  //     Text('Container 4',
                  //         style: TextStyle(color: Colors.white)), // Text
                  //   ],
                  // ),
                  ),
            ),
          ],
        ),
      ],
    );
  }

  Widget buildLogout() {
    var screen = MediaQuery.of(context).size;
    return Container(
      width: screen.width * 0.5,
      child: ElevatedButton.icon(
        onPressed: () async {
          // const storage = FlutterSecureStorage();
          // await storage.delete(key: "token");
          SharedPreferences prefs = await SharedPreferences.getInstance();
          // prefs.remove('user');
          prefs.clear();

          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(
                "Logged Out",
                style: TextStyle(color: Colors.white),
              ),
            ),
          );

          Navigator.push(
              context, MaterialPageRoute(builder: (context) => MyApp()));
        },
        icon: Icon(Icons.logout_outlined),
        label: Text('Logout'),
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.red,
          foregroundColor: Colors.white,
          elevation: 2,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),
      ),
    );
  }
}
