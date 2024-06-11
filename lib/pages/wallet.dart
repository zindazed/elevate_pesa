import 'package:elevate_pesa/Global/colors.dart';
import 'package:elevate_pesa/components/notify.dart';
import 'package:elevate_pesa/components/textInputField.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class WalletPage extends StatefulWidget {
  WalletPage({Key? key}) : super(key: key);

  @override
  State<WalletPage> createState() => _WalletPageState();
}

class _WalletPageState extends State<WalletPage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _amountController = TextEditingController();

  String? transactionType;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text('Safelock'),
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
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Balance:",
                    style: TextStyle(fontSize: 20, color: thirdColor),
                  ),
                  SizedBox(width: 10),
                  Text(
                    "UGX 3,500,000",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 24,
                        color: primaryColor),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.all(10.0),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.only(
                          left: 15, right: 15, top: 5, bottom: 5),
                      width: double.infinity,
                      decoration: BoxDecoration(
                        border: Border.all(color: primaryColor),
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                      child: DropdownButtonFormField<String>(
                        isExpanded: true,
                        validator: (val) {
                          return (val == null)
                              ? "Please select a Transaction Type"
                              : null;
                        },
                        decoration: InputDecoration(
                          hintText: 'Select Transaction Type',
                          // Add any other decoration properties as needed
                          // Include the underline property here
                          border:
                              InputBorder.none, // This removes the underline
                        ),
                        hint: Text('Select Transaction Type'),
                        value: transactionType,
                        onChanged: (String? newValue) {
                          setState(() {
                            transactionType = newValue;
                          });
                        },
                        items: ["Deposit", "Withdraw"]
                            .map<DropdownMenuItem<String>>((String type) {
                          return DropdownMenuItem<String>(
                            value: type,
                            child: Text(type),
                          );
                        }).toList(),
                      ),
                    ),
                    SizedBox(height: 20),
                    CustomTextInput(
                      controller: _phoneController,
                      labelText: 'Mobile Number',
                      keyboardType: TextInputType.phone,
                      fillColor: Colors.transparent,
                      enabledBorderColor: primaryColor,
                      focusedBorderColor: primaryColor,
                    ),
                    SizedBox(height: 20),
                    CustomTextInput(
                      controller: _amountController,
                      labelText: 'Amount',
                      keyboardType: TextInputType.number,
                      fillColor: Colors.transparent,
                      enabledBorderColor: primaryColor,
                      focusedBorderColor: primaryColor,
                    ),
                    SizedBox(height: 20),
                    Container(
                      margin: EdgeInsets.all(16),
                      width: double.infinity,
                      height: 50,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(100.0),
                            side:
                                BorderSide(color: primaryColor), // Border color
                          ),
                          backgroundColor: primaryColor,
                        ),
                        onPressed: () async {
                          FocusScope.of(context).unfocus();
                          if (_formKey.currentState!.validate()) {
                            popUp(
                                context: context,
                                icon: Icons.check_box,
                                message: (transactionType == "Deposit")
                                    ? "You have successfully deposited UGX ${NumberFormat('#,###').format((int.parse(_amountController.text)))}"
                                    : "You have successfully withdrawn UGX UGX ${NumberFormat('#,###').format((int.parse(_amountController.text)))}",
                                bColor: Colors.green,
                                tColor: Colors.white);
                          } else {
                            popUp(
                                context: context,
                                icon: Icons.info,
                                message: "Please fill the empty fields",
                                bColor: Colors.amber,
                                tColor: Colors.white);
                          }
                        },
                        child: Text(
                          "Transact",
                          style: TextStyle(fontSize: 18, color: Colors.white),
                        ),
                      ),
                    ),
                    // Container(
                    //   padding:
                    //       EdgeInsets.only(left: 15, right: 15, top: 5, bottom: 5),
                    //   width: double.infinity,
                    //   decoration: BoxDecoration(
                    //     border: Border.all(color: Colors.blue),
                    //     borderRadius: BorderRadius.circular(5.0),
                    //   ),
                    //   child: DropdownButtonFormField<String>(
                    //     isExpanded: true,
                    //     validator: (val) {
                    //       return (val == null) ? "Please select a City" : null;
                    //     },
                    //     decoration: InputDecoration(
                    //       hintText: 'Select City',
                    //       // Add any other decoration properties as needed
                    //       // Include the underline property here
                    //       border: InputBorder.none, // This removes the underline
                    //     ),
                    //     hint: Text('Select City'),
                    //     value: selectedCity,
                    //     onChanged: (String? newValue) {
                    //       setState(() {
                    //         selectedCity = newValue;
                    //       });
                    //     },
                    //     items: allCities
                    //         .where((city) => city.region == selectedRegion)
                    //         .map<DropdownMenuItem<String>>((City city) {
                    //       return DropdownMenuItem<String>(
                    //         value: city.name,
                    //         child: Text(city.name),
                    //       );
                    //     }).toList(),
                    //   ),
                    // ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
