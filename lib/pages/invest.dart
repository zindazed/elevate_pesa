import 'package:elevate_pesa/Global/colors.dart';
import 'package:elevate_pesa/components/fadeShow.dart';
import 'package:elevate_pesa/components/slideShow.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:percent_indicator/percent_indicator.dart';

class Investment {
  final String name;
  final String annualisedReturn;
  final String liquidity;
  final String riskProfile;
  final String maturity;
  final int targetAmount;
  final int collectedAmount;
  final List<String> images;

  Investment({
    required this.name,
    required this.annualisedReturn,
    required this.liquidity,
    required this.riskProfile,
    required this.maturity,
    required this.targetAmount,
    required this.collectedAmount,
    required this.images,
  });
}

class InvestPage extends StatelessWidget {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  InvestPage({Key? key}) : super(key: key);
  List<Investment> investments = [
    Investment(
      name: 'Central Park Luxury Apartments',
      annualisedReturn: '10.5%',
      liquidity: '3 months',
      riskProfile: 'High',
      maturity: '3 years',
      targetAmount: 5000000,
      collectedAmount: 2500000,
      images: [
        'p1.jpeg',
        'p4.jpeg',
        'p8.jpeg',
      ],
    ),
    Investment(
      name: 'Tech Hub Office Space',
      annualisedReturn: '9.8%',
      liquidity: '1 year',
      riskProfile: 'Low',
      maturity: '5 years',
      targetAmount: 3000000,
      collectedAmount: 1200000,
      images: [
        'p2.jpeg',
        'p5.jpeg',
        'p9.jpeg',
      ],
    ),
    Investment(
      name: 'Seaside Resort Development',
      annualisedReturn: '12.2%',
      liquidity: '4 months',
      riskProfile: 'High',
      maturity: '7 years',
      targetAmount: 8000000,
      collectedAmount: 3500000,
      images: [
        'p3.jpeg',
        'p6.jpeg',
        'p1.jpeg',
      ],
    ),
    Investment(
      name: 'Downtown Retail Complex',
      annualisedReturn: '11.0%',
      liquidity: '2 years',
      riskProfile: 'Medium',
      maturity: '4 years',
      targetAmount: 6500000,
      collectedAmount: 4000000,
      images: [
        'p4.jpeg',
        'p7.jpeg',
        'p2.jpeg',
      ],
    ),
    Investment(
      name: 'Industrial Park Expansion',
      annualisedReturn: '9.5%',
      liquidity: '6 months',
      riskProfile: 'High',
      maturity: '6 years',
      targetAmount: 4200000,
      collectedAmount: 2800000,
      images: [
        'p5.jpeg',
        'p8.jpeg',
        'p3.jpeg',
      ],
    ),
    Investment(
      name: 'Green Energy Farm',
      annualisedReturn: '8.7%',
      liquidity: '5 months',
      riskProfile: 'Medium',
      maturity: '8 years',
      targetAmount: 7000000,
      collectedAmount: 5600000,
      images: [
        'p6.jpeg',
        'p9.jpeg',
        'p4.jpeg',
      ],
    ),
    Investment(
      name: 'Urban Residential Redevelopment',
      annualisedReturn: '10.8%',
      liquidity: '2 months',
      riskProfile: 'Medium',
      maturity: '5 years',
      targetAmount: 5800000,
      collectedAmount: 3200000,
      images: [
        'p1.jpeg',
        'p4.jpeg',
        'p8.jpeg',
      ],
    ),
    Investment(
      name: 'Medical Center Expansion',
      annualisedReturn: '9.3%',
      liquidity: '1 year',
      riskProfile: 'Medium',
      maturity: '4 years',
      targetAmount: 3800000,
      collectedAmount: 2100000,
      images: [
        'p2.jpeg',
        'p5.jpeg',
        'p9.jpeg',
      ],
    ),
    Investment(
      name: 'Mixed-Use Development Project',
      annualisedReturn: '11.5%',
      liquidity: '4 months',
      riskProfile: 'High',
      maturity: '6 years',
      targetAmount: 6200000,
      collectedAmount: 3700000,
      images: [
        'p3.jpeg',
        'p6.jpeg',
        'p1.jpeg',
      ],
    ),
    Investment(
      name: 'Data Center Construction',
      annualisedReturn: '10.0%',
      liquidity: '9 months',
      riskProfile: 'High',
      maturity: '7 years',
      targetAmount: 9500000,
      collectedAmount: 6800000,
      images: [
        'p6.jpeg',
        'p9.jpeg',
        'p4.jpeg',
      ],
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text('Invest'),
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
      body: Column(
        children: [
          SizedBox(height: 10),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                filterContainer('Latest', true),
                filterContainer('Available', true),
                filterContainer('Compeleted', false),
                filterContainer('My investments', false),
                filterContainer('Profitable', false),
                filterContainer('Safe', false),
                filterContainer('above 80%', false),
                filterContainer('above 70%', false),
                filterContainer('above 90%', false),
              ],
            ),
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.only(top: 10),
              child: ListView.builder(
                itemCount: investments.length,
                itemBuilder: (context, index) {
                  return InvestmentTile(investment: investments[index]);
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class InvestmentTile extends StatelessWidget {
  final Investment investment;

  InvestmentTile({required this.investment});

  @override
  Widget build(BuildContext context) {
    TextStyle attributes =
        TextStyle(fontSize: 8, fontWeight: FontWeight.bold, color: Colors.grey);
    return Container(
      color: Colors.white,
      // height: MediaQuery.of(context).size.height * 0.5,
      height: 350,
      padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            // flex: 2,
            child: ImageFadeShow(
              imageUrls: investment.images,
            ),
          ),
          Expanded(
            // flex: 3,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                  child: Text(
                    investment.name,
                    style: TextStyle(fontSize: 17),
                  ),
                ),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      "Annualised Return: " + investment.annualisedReturn,
                      style: attributes,
                    ),
                    Text(
                      "Maturity: " + investment.maturity,
                      style: attributes,
                    ),
                    Text(
                      "Liquidity: " + investment.liquidity,
                      style: attributes,
                    ),
                    Text(
                      "Risk: " + investment.riskProfile,
                      style: attributes,
                    ),
                  ],
                ),
                SizedBox(height: 5),
                Center(
                  child: Text(
                    "UGX ${NumberFormat('#,###').format(investment.collectedAmount)} / UGX ${NumberFormat('#,###').format(investment.targetAmount)}",
                    style: TextStyle(color: Colors.green, fontSize: 12),
                  ),
                ),
                LinearPercentIndicator(
                  width: MediaQuery.of(context).size.width - 50,
                  animation: true,
                  lineHeight: 20.0,
                  animationDuration: 2500,
                  percent: investment.collectedAmount / investment.targetAmount,
                  center: Text(
                      "${(investment.collectedAmount / investment.targetAmount * 100).round()}%"),
                  barRadius: const Radius.circular(16),
                  progressColor: Colors.green,
                ),
                SizedBox(height: 10),
                Divider(
                  color: Colors.grey[200],
                  thickness: 1,
                ),
                SizedBox(height: 10),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

Widget filterContainer(String text, bool selected) {
  return Container(
    margin: EdgeInsets.symmetric(horizontal: 8.0),
    padding: EdgeInsets.all(8.0),
    decoration: BoxDecoration(
      color: (selected) ? primaryColor : secondColor, // Background color
      borderRadius: BorderRadius.circular(20.0),
      border: Border.all(
        color: primaryColor, // Green border color
        width: 2.0, // Border width
      ), // Rounded corners
    ),
    child: Center(
      child: Text(
        text,
        style: TextStyle(
          color: (selected) ? secondColor : primaryColor,
        ),
      ),
    ),
  );
}
