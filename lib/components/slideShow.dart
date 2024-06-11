import 'dart:async';

import 'package:flutter/material.dart';

class ImageSlideShow extends StatefulWidget {
  final List<String> imageUrls;

  ImageSlideShow({required this.imageUrls});

  @override
  _ImageSlideShowState createState() => _ImageSlideShowState();
}

class _ImageSlideShowState extends State<ImageSlideShow> {
  late PageController _pageController;
  late Timer _timer;
  int _currentPage = 0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: _currentPage);
    _startAutoScroll();
    print('images.................///');
    for (var element in widget.imageUrls) {
      print(element);
    }
  }

  @override
  void dispose() {
    _timer.cancel();
    _pageController.dispose();
    super.dispose();
  }

  void _startAutoScroll() {
    _timer = Timer.periodic(Duration(seconds: 5), (Timer timer) {
      if (_currentPage < widget.imageUrls.length - 1) {
        _currentPage++;
      } else {
        _currentPage = 0;
      }

      _pageController.animateToPage(
        _currentPage,
        duration: Duration(milliseconds: 300),
        curve: Curves.easeIn,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300.0, // Adjust the height as needed
      child: PageView.builder(
        controller: _pageController,
        itemCount: widget.imageUrls.length,
        itemBuilder: (context, index) {
          return Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image:
                    AssetImage('assets/properties/${widget.imageUrls[index]}'),
                fit: BoxFit.fitHeight,
              ),
            ),
          );
        },
      ),
    );
  }
}
