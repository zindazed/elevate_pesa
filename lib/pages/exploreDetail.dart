import 'package:elevate_pesa/Global/colors.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart'; // Add url_launcher package to your pubspec.yaml

class DetailPage extends StatelessWidget {
  final String title;
  final String content;
  final String imageUrl;

  DetailPage(
      {required this.title, required this.content, required this.imageUrl});

  void _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detail Page'),
        backgroundColor: primaryColor,
        foregroundColor: secondColor,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width:
                  double.infinity, // Set a constant height (adjust as needed)
              child: Image.asset(
                'assets/properties/$imageUrl',
                fit: BoxFit
                    .cover, // Ensures the image covers the container while maintaining aspect ratio
              ),
            ), // Replace with a real image URL
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                title,
                style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(content),
            ),
            // Padding(
            //   padding: const EdgeInsets.all(8.0),
            //   child: ElevatedButton.icon(
            //     onPressed: () => _launchURL(
            //         'https://www.youtube.com'), // Replace with a real YouTube URL
            //     icon: Icon(Icons.video_library),
            //     label: Text('Watch on YouTube'),
            //   ),
            // ),
            // Padding(
            //   padding: const EdgeInsets.all(8.0),
            //   child: ElevatedButton.icon(
            //     onPressed: () => _launchURL(
            //         'https://www.twitter.com'), // Replace with a real Twitter URL
            //     icon: Icon(Icons.link),
            //     label: Text('See on Twitter'),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
