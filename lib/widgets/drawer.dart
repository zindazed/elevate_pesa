import 'package:elevate_pesa/Global/colors.dart';
import 'package:elevate_pesa/main.dart';
import 'package:elevate_pesa/pages/home.dart';
import 'package:elevate_pesa/pages/wallet.dart';
import 'package:flutter/material.dart';

class CustomDrawer extends StatelessWidget {
  final GlobalKey<ScaffoldState> scaffoldKey;

  const CustomDrawer({Key? key, required this.scaffoldKey}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: MediaQuery.of(context).size.width * 0.75,
      backgroundColor: primaryColor,
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          SizedBox(
            height: 100,
            child: DrawerHeader(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    icon: Icon(Icons.arrow_back_rounded),
                    color: secondColor,
                    onPressed: () {
                      scaffoldKey.currentState?.openEndDrawer();
                    },
                  ),
                  Text(
                    'username',
                    style: TextStyle(color: thirdColor, fontSize: 20),
                  ),
                ],
              ),
            ),
          ),
          ListTile(
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'My Account',
                  style: TextStyle(color: secondColor, fontSize: 17),
                ),
                Icon(
                  Icons.arrow_forward_outlined,
                  color: secondColor,
                  // size: 100,
                ),
              ],
            ),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => MyHomePage(
                            inputIndex: 3,
                          )));
            },
          ),
          Divider(color: thirdColor),
          ListTile(
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Withdraw Funds',
                  style: TextStyle(color: secondColor, fontSize: 17),
                ),
                Icon(
                  Icons.arrow_forward_outlined,
                  color: secondColor,
                  // size: 100,
                ),
              ],
            ),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => WalletPage()));
            },
          ),
          Divider(color: thirdColor),
        ],
      ),
    );
  }
}
