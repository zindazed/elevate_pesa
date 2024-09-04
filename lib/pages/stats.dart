import 'package:elevate_pesa/Global/colors.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class StatsPage extends StatefulWidget {
  @override
  _StatsPageState createState() => _StatsPageState();
}

class _StatsPageState extends State<StatsPage> {
  int _selectedYear = 2023; // Default selected year
  final Map<int, List<double>> investmentDataByYear = {
    2023: [
      5000,
      6000,
      4000,
      8000,
      7000,
      9000,
      6000,
      8000,
      7000,
      5000,
      6000,
      7000
    ],
    2022: [
      4500,
      5500,
      3500,
      7500,
      6500,
      8500,
      5500,
      7500,
      6500,
      4500,
      5500,
      6500
    ],
    2021: [
      4000,
      5000,
      3000,
      7000,
      6000,
      8000,
      5000,
      7000,
      6000,
      4000,
      5000,
      6000
    ],
  };

  final Map<int, List<double>> creditDataByYear = {
    2023: [
      3000,
      4000,
      5000,
      6000,
      4000,
      7000,
      5000,
      6000,
      5000,
      4000,
      5000,
      6000
    ],
    2022: [
      2500,
      3500,
      4500,
      5500,
      3500,
      6500,
      4500,
      5500,
      4500,
      3500,
      4500,
      5500
    ],
    2021: [
      2000,
      3000,
      4000,
      5000,
      3000,
      6000,
      4000,
      5000,
      4000,
      3000,
      4000,
      5000
    ],
  };

  final Map<int, List<double>> fundraisingDataByYear = {
    2023: [
      2000,
      3000,
      4000,
      5000,
      3000,
      6000,
      4000,
      5000,
      4000,
      3000,
      4000,
      5000
    ],
    2022: [
      1500,
      2500,
      3500,
      4500,
      2500,
      5500,
      3500,
      4500,
      3500,
      2500,
      3500,
      4500
    ],
    2021: [
      1000,
      2000,
      3000,
      4000,
      2000,
      5000,
      3000,
      4000,
      3000,
      2000,
      3000,
      4000
    ],
  };

  List<double> investmentData = [];
  List<double> creditData = [];
  List<double> fundraisingData = [];

  @override
  void initState() {
    super.initState();
    _updateData();
  }

  void _updateData() {
    setState(() {
      investmentData = investmentDataByYear[_selectedYear]!;
      creditData = creditDataByYear[_selectedYear]!;
      fundraisingData = fundraisingDataByYear[_selectedYear]!;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Select Year:',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(width: 8),
            DropdownButton<int>(
              value: _selectedYear,
              onChanged: (value) {
                setState(() {
                  _selectedYear = value!;
                  _updateData();
                });
              },
              items: [
                DropdownMenuItem(
                  value: 2023,
                  child: Text('2023'),
                ),
                DropdownMenuItem(
                  value: 2022,
                  child: Text('2022'),
                ),
                DropdownMenuItem(
                  value: 2021,
                  child: Text('2021'),
                ),
              ],
            ),
          ],
        ),
        backgroundColor: secondColor,
        foregroundColor: Colors.black,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Text(
                  'Monthly Investment Totals for ${_selectedYear}',
                  style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(height: 16),
              AspectRatio(
                aspectRatio: 16 / 9,
                child: BarChart(
                  BarChartData(
                    barTouchData: BarTouchData(enabled: false),
                    titlesData: FlTitlesData(
                      bottomTitles: AxisTitles(
                        sideTitles: SideTitles(
                          showTitles: true,
                          getTitlesWidget: (value, meta) {
                            String text = '';
                            switch (value.toInt()) {
                              case 0:
                                text = 'J';
                                break;
                              case 1:
                                text = 'F';
                                break;
                              case 2:
                                text = 'M';
                                break;
                              case 3:
                                text = 'A';
                                break;
                              case 4:
                                text = 'M';
                                break;
                              case 5:
                                text = 'J';
                                break;
                              case 6:
                                text = 'J';
                                break;
                              case 7:
                                text = 'A';
                                break;
                              case 8:
                                text = 'S';
                                break;
                              case 9:
                                text = 'O';
                                break;
                              case 10:
                                text = 'N';
                                break;
                              case 11:
                                text = 'D';
                                break;
                            }
                            return Text(text);
                          },
                        ),
                      ),
                      // leftTitles: AxisTitles(
                      //   sideTitles: SideTitles(showTitles: true),
                      // ),
                    ),
                    gridData: FlGridData(
                      show: true,
                      drawVerticalLine: false,
                      getDrawingHorizontalLine: (value) => FlLine(
                        color: Colors.grey.withOpacity(0.3),
                        strokeWidth: 1,
                      ),
                    ),
                    borderData: FlBorderData(
                      show: true,
                      border: Border.all(
                        color: Colors.grey.withOpacity(0.3),
                        width: 1,
                      ),
                    ),
                    barGroups: investmentData
                        .asMap()
                        .entries
                        .map((e) => BarChartGroupData(
                              x: e.key,
                              barRods: [
                                BarChartRodData(
                                  toY: e.value,
                                  color: Colors.blue,
                                  width: 15,
                                  borderRadius: BorderRadius.zero,
                                  backDrawRodData: BackgroundBarChartRodData(
                                    show: true,
                                    toY: 0,
                                    color: Colors.blue.withOpacity(0.2),
                                  ),
                                ),
                              ],
                            ))
                        .toList(),
                  ),
                ),
              ),
              SizedBox(height: 16),
              Center(
                child: Text(
                  '${_selectedYear} Monthly Investment Trends',
                  style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(height: 16),
              AspectRatio(
                aspectRatio: 16 / 9,
                child: LineChart(
                  LineChartData(
                    lineTouchData: LineTouchData(enabled: false),
                    gridData: FlGridData(
                      show: true,
                      drawVerticalLine: false,
                      getDrawingHorizontalLine: (value) => FlLine(
                        color: Colors.grey.withOpacity(0.3),
                        strokeWidth: 1,
                      ),
                    ),
                    titlesData: FlTitlesData(
                      bottomTitles: AxisTitles(
                        sideTitles: SideTitles(
                          showTitles: true,
                          getTitlesWidget: (value, meta) {
                            String text = '';
                            switch (value.toInt()) {
                              case 0:
                                text = 'Jan';
                                break;
                              case 2:
                                text = 'Mar';
                                break;
                              case 4:
                                text = 'May';
                                break;
                              case 6:
                                text = 'Jul';
                                break;
                              case 8:
                                text = 'Sep';
                                break;
                              case 10:
                                text = 'Nov';
                                break;
                            }
                            return Text(text);
                          },
                        ),
                      ),
                    ),
                    borderData: FlBorderData(
                      show: true,
                      border: Border.all(
                        color: Colors.grey.withOpacity(0.3),
                        width: 1,
                      ),
                    ),
                    lineBarsData: [
                      LineChartBarData(
                        spots: investmentData
                            .asMap()
                            .entries
                            .map((e) => FlSpot(e.key.toDouble(), e.value))
                            .toList(),
                        dotData: FlDotData(show: false),
                        isCurved: false,
                        color: Colors.blue,
                        barWidth: 3,
                        belowBarData: BarAreaData(
                          show: true,
                          color: Colors.blue.withOpacity(0.2),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 16),
              Center(
                child: Text(
                  'Monthly Credit Amounts for ${_selectedYear}',
                  style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(height: 16),
              AspectRatio(
                aspectRatio: 16 / 9,
                child: BarChart(
                  BarChartData(
                    barTouchData: BarTouchData(enabled: false),
                    titlesData: FlTitlesData(
                      bottomTitles: AxisTitles(
                        sideTitles: SideTitles(
                          showTitles: true,
                          getTitlesWidget: (value, meta) {
                            String text = '';
                            switch (value.toInt()) {
                              case 0:
                                text = 'J';
                                break;
                              case 1:
                                text = 'F';
                                break;
                              case 2:
                                text = 'M';
                                break;
                              case 3:
                                text = 'A';
                                break;
                              case 4:
                                text = 'M';
                                break;
                              case 5:
                                text = 'J';
                                break;
                              case 6:
                                text = 'J';
                                break;
                              case 7:
                                text = 'A';
                                break;
                              case 8:
                                text = 'S';
                                break;
                              case 9:
                                text = 'O';
                                break;
                              case 10:
                                text = 'N';
                                break;
                              case 11:
                                text = 'D';
                                break;
                            }
                            return Text(text);
                          },
                        ),
                      ),
                      // leftTitles: AxisTitles(
                      //   sideTitles: SideTitles(showTitles: true),
                      // ),
                    ),
                    gridData: FlGridData(
                      show: true,
                      drawVerticalLine: false,
                      getDrawingHorizontalLine: (value) => FlLine(
                        color: Colors.grey.withOpacity(0.3),
                        strokeWidth: 1,
                      ),
                    ),
                    borderData: FlBorderData(
                      show: true,
                      border: Border.all(
                        color: Colors.grey.withOpacity(0.3),
                        width: 1,
                      ),
                    ),
                    barGroups: creditData
                        .asMap()
                        .entries
                        .map((e) => BarChartGroupData(
                              x: e.key,
                              barRods: [
                                BarChartRodData(
                                  toY: e.value,
                                  color: Colors.red,
                                  width: 15,
                                  borderRadius: BorderRadius.zero,
                                  backDrawRodData: BackgroundBarChartRodData(
                                    show: true,
                                    toY: 0,
                                    color: Colors.red.withOpacity(0.2),
                                  ),
                                ),
                              ],
                            ))
                        .toList(),
                  ),
                ),
              ),
              SizedBox(height: 16),
              Center(
                child: Text(
                  '${_selectedYear} Monthly Credit Trends',
                  style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(height: 16),
              AspectRatio(
                aspectRatio: 16 / 9,
                child: LineChart(
                  LineChartData(
                    lineTouchData: LineTouchData(enabled: false),
                    gridData: FlGridData(
                      show: true,
                      drawVerticalLine: false,
                      getDrawingHorizontalLine: (value) => FlLine(
                        color: Colors.grey.withOpacity(0.3),
                        strokeWidth: 1,
                      ),
                    ),
                    titlesData: FlTitlesData(
                      bottomTitles: AxisTitles(
                        sideTitles: SideTitles(
                          showTitles: true,
                          getTitlesWidget: (value, meta) {
                            String text = '';
                            switch (value.toInt()) {
                              case 0:
                                text = 'Jan';
                                break;
                              case 2:
                                text = 'Mar';
                                break;
                              case 4:
                                text = 'May';
                                break;
                              case 6:
                                text = 'Jul';
                                break;
                              case 8:
                                text = 'Sep';
                                break;
                              case 10:
                                text = 'Nov';
                                break;
                            }
                            return Text(text);
                          },
                        ),
                      ),
                    ),
                    borderData: FlBorderData(
                      show: true,
                      border: Border.all(
                        color: Colors.grey.withOpacity(0.3),
                        width: 1,
                      ),
                    ),
                    lineBarsData: [
                      LineChartBarData(
                        spots: creditData
                            .asMap()
                            .entries
                            .map((e) => FlSpot(e.key.toDouble(), e.value))
                            .toList(),
                        dotData: FlDotData(show: false),
                        isCurved: false,
                        color: Colors.red,
                        barWidth: 3,
                        belowBarData: BarAreaData(
                          show: true,
                          color: Colors.red.withOpacity(0.2),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 16),
              Center(
                child: Text(
                  'Monthly Fundraising Totals for ${_selectedYear}',
                  style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(height: 16),
              AspectRatio(
                aspectRatio: 16 / 9,
                child: BarChart(
                  BarChartData(
                    barTouchData: BarTouchData(enabled: false),
                    titlesData: FlTitlesData(
                      bottomTitles: AxisTitles(
                        sideTitles: SideTitles(
                          showTitles: true,
                          getTitlesWidget: (value, meta) {
                            String text = '';
                            switch (value.toInt()) {
                              case 0:
                                text = 'J';
                                break;
                              case 1:
                                text = 'F';
                                break;
                              case 2:
                                text = 'M';
                                break;
                              case 3:
                                text = 'A';
                                break;
                              case 4:
                                text = 'M';
                                break;
                              case 5:
                                text = 'J';
                                break;
                              case 6:
                                text = 'J';
                                break;
                              case 7:
                                text = 'A';
                                break;
                              case 8:
                                text = 'S';
                                break;
                              case 9:
                                text = 'O';
                                break;
                              case 10:
                                text = 'N';
                                break;
                              case 11:
                                text = 'D';
                                break;
                            }
                            return Text(text);
                          },
                        ),
                      ),
                      // leftTitles: AxisTitles(
                      //   sideTitles: SideTitles(showTitles: true),
                      // ),
                    ),
                    gridData: FlGridData(
                      show: true,
                      drawVerticalLine: false,
                      getDrawingHorizontalLine: (value) => FlLine(
                        color: Colors.grey.withOpacity(0.3),
                        strokeWidth: 1,
                      ),
                    ),
                    borderData: FlBorderData(
                      show: true,
                      border: Border.all(
                        color: Colors.grey.withOpacity(0.3),
                        width: 1,
                      ),
                    ),
                    barGroups: fundraisingData
                        .asMap()
                        .entries
                        .map((e) => BarChartGroupData(
                              x: e.key,
                              barRods: [
                                BarChartRodData(
                                  toY: e.value,
                                  color: Colors.green,
                                  width: 15,
                                  borderRadius: BorderRadius.zero,
                                  backDrawRodData: BackgroundBarChartRodData(
                                    show: true,
                                    toY: 0,
                                    color: Colors.green.withOpacity(0.2),
                                  ),
                                ),
                              ],
                            ))
                        .toList(),
                  ),
                ),
              ),
              SizedBox(height: 16),
              Center(
                child: Text(
                  '${_selectedYear} Monthly Fundraising Trends',
                  style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(height: 16),
              AspectRatio(
                aspectRatio: 16 / 9,
                child: LineChart(
                  LineChartData(
                    lineTouchData: LineTouchData(enabled: false),
                    gridData: FlGridData(
                      show: true,
                      drawVerticalLine: false,
                      getDrawingHorizontalLine: (value) => FlLine(
                        color: Colors.grey.withOpacity(0.3),
                        strokeWidth: 1,
                      ),
                    ),
                    titlesData: FlTitlesData(
                      bottomTitles: AxisTitles(
                        sideTitles: SideTitles(
                          showTitles: true,
                          getTitlesWidget: (value, meta) {
                            String text = '';
                            switch (value.toInt()) {
                              case 0:
                                text = 'Jan';
                                break;
                              case 2:
                                text = 'Mar';
                                break;
                              case 4:
                                text = 'May';
                                break;
                              case 6:
                                text = 'Jul';
                                break;
                              case 8:
                                text = 'Sep';
                                break;
                              case 10:
                                text = 'Nov';
                                break;
                            }
                            return Text(text);
                          },
                        ),
                      ),
                    ),
                    borderData: FlBorderData(
                      show: true,
                      border: Border.all(
                        color: Colors.grey.withOpacity(0.3),
                        width: 1,
                      ),
                    ),
                    lineBarsData: [
                      LineChartBarData(
                        spots: fundraisingData
                            .asMap()
                            .entries
                            .map((e) => FlSpot(e.key.toDouble(), e.value))
                            .toList(),
                        dotData: FlDotData(show: false),
                        isCurved: false,
                        color: Colors.green,
                        barWidth: 3,
                        belowBarData: BarAreaData(
                          show: true,
                          color: Colors.green.withOpacity(0.2),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 16),
              Center(
                child: Text(
                  'Monthly Financial Trends for ${_selectedYear}',
                  style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(height: 16),
              AspectRatio(
                aspectRatio: 16 / 9,
                child: LineChart(
                  LineChartData(
                    lineTouchData: LineTouchData(enabled: false),
                    gridData: FlGridData(
                      show: true,
                      drawVerticalLine: false,
                      getDrawingHorizontalLine: (value) => FlLine(
                        color: Colors.grey.withOpacity(0.3),
                        strokeWidth: 1,
                      ),
                    ),
                    titlesData: FlTitlesData(
                      bottomTitles: AxisTitles(
                        sideTitles: SideTitles(
                          showTitles: true,
                          getTitlesWidget: (value, meta) {
                            String text = '';
                            switch (value.toInt()) {
                              case 0:
                                text = 'Jan';
                                break;
                              case 2:
                                text = 'Mar';
                                break;
                              case 4:
                                text = 'May';
                                break;
                              case 6:
                                text = 'Jul';
                                break;
                              case 8:
                                text = 'Sep';
                                break;
                              case 10:
                                text = 'Nov';
                                break;
                            }
                            return Text(text);
                          },
                        ),
                      ),
                    ),
                    borderData: FlBorderData(
                      show: true,
                      border: Border.all(
                        color: Colors.grey.withOpacity(0.3),
                        width: 1,
                      ),
                    ),
                    lineBarsData: [
                      LineChartBarData(
                        spots: investmentData
                            .asMap()
                            .entries
                            .map((e) => FlSpot(e.key.toDouble(), e.value))
                            .toList(),
                        dotData: FlDotData(show: false),
                        isCurved: false,
                        color: Colors.blue,
                        barWidth: 3,
                        belowBarData: BarAreaData(
                          show: true,
                          color: Colors.blue.withOpacity(0.2),
                        ),
                      ),
                      LineChartBarData(
                        spots: creditData
                            .asMap()
                            .entries
                            .map((e) => FlSpot(e.key.toDouble(), e.value))
                            .toList(),
                        dotData: FlDotData(show: false),
                        isCurved: false,
                        color: Colors.red,
                        barWidth: 3,
                        belowBarData: BarAreaData(
                          show: true,
                          color: Colors.red.withOpacity(0.2),
                        ),
                      ),
                      LineChartBarData(
                        spots: fundraisingData
                            .asMap()
                            .entries
                            .map((e) => FlSpot(e.key.toDouble(), e.value))
                            .toList(),
                        dotData: FlDotData(show: false),
                        isCurved: false,
                        color: Colors.green,
                        barWidth: 3,
                        belowBarData: BarAreaData(
                          show: true,
                          color: Colors.green.withOpacity(0.2),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 16),
              Center(
                child: Text(
                  '${_selectedYear} Financial Distribution',
                  style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(height: 16),
              AspectRatio(
                aspectRatio: 1,
                child: PieChart(
                  PieChartData(
                    sections: [
                      PieChartSectionData(
                        value: investmentData.reduce((a, b) => a + b),
                        // value: 5,
                        color: Colors.blue,
                        title: 'Investment',
                        radius: 100,
                        titleStyle: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      PieChartSectionData(
                        value: creditData.reduce((a, b) => a + b),
                        // value: 3,
                        color: Colors.red,
                        title: 'Credit',
                        radius: 100,
                        titleStyle: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      PieChartSectionData(
                        value: fundraisingData.reduce((a, b) => a + b),
                        // value: 2,
                        color: Colors.green,
                        title: 'Fundraising',
                        radius: 100,
                        titleStyle: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 100)
            ],
          ),
        ),
      ),
    );
  }
}
