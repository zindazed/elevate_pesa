import 'package:elevate_pesa/Global/colors.dart';
import 'package:flutter/material.dart';

class FAQPage extends StatelessWidget {
  final List<Map<String, String>> faqItems = [
    {
      'question': 'What is Investment?',
      'answer':
          'Investment is the allocation of money in the expectation of some benefit in the future.'
    },
    {
      'question': 'What are the types of Investments?',
      'answer':
          'The types of investments include stocks, bonds, mutual funds, real estate, and more.'
    },
    {
      'question': 'What is Credit?',
      'answer':
          'Credit is the trust which allows one party to provide resources to another party.'
    },
    {
      'question': 'How do I improve my credit score?',
      'answer':
          'Improving your credit score involves paying bills on time, reducing debt, and monitoring your credit report.'
    },
    {
      'question': 'What is Fundraising?',
      'answer':
          'Fundraising is the process of seeking and gathering voluntary financial contributions.'
    },
    {
      'question': 'How can I start a fundraising campaign?',
      'answer':
          'To start a fundraising campaign, identify a cause, set a goal, choose a platform, and promote your campaign.'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('FAQ'),
        backgroundColor: primaryColor,
        foregroundColor: secondColor,
      ),
      body: ListView.builder(
        itemCount: faqItems.length,
        itemBuilder: (context, index) {
          return ExpansionTile(
            title: Text(
              faqItems[index]['question']!,
              style: TextStyle(fontSize: 18.0, color: Colors.green),
            ),
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  faqItems[index]['answer']!,
                  style: TextStyle(fontSize: 16.0),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
