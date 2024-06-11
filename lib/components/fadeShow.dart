import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';

class ImageFadeShow extends StatefulWidget {
  final List<String> imageUrls;

  ImageFadeShow({required this.imageUrls});

  @override
  _ImageFadeShowState createState() => _ImageFadeShowState();
}

class _ImageFadeShowState extends State<ImageFadeShow> {
  late PageController _pageController;
  late Timer _timer;
  int _currentPage = 0;
  double _opacity = 0.0;
  Random random = Random();
  int min = 2000;
  int max = 5000;
  int _change = 300;

  @override
  void initState() {
    super.initState();
    _change = min + random.nextInt((max - min) + 1);
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
    _timer = Timer.periodic(Duration(milliseconds: _change), (Timer timer) {
      setState(() {
        _opacity = 1.0;
        _change = min + random.nextInt((max - min) + 1);
      });

      Future.delayed(Duration(milliseconds: 300), () {
        if (_currentPage < widget.imageUrls.length - 1) {
          _currentPage++;
        } else {
          _currentPage = 0;
        }

        _pageController.animateToPage(_currentPage,
            duration: Duration(milliseconds: 10), curve: Curves.linear);
        // _pageController.animateToPage(
        //   _currentPage,
        //   duration: Duration(milliseconds: 300),
        //   curve: Curves.easeIn,
        // );

        setState(() {
          _opacity = 0.0;
        });
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300.0, // Adjust the height as needed
      child: Stack(
        children: [
          PageView.builder(
            controller: _pageController,
            itemCount: widget.imageUrls.length,
            itemBuilder: (context, index) {
              return Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16.0),
                  image: DecorationImage(
                    image: AssetImage(
                        'assets/properties/${widget.imageUrls[index]}'),
                    // fit: BoxFit.fitHeight,
                    fit: BoxFit.cover,
                    onError: (exception, stackTrace) {
                      setState(() {
                        widget.imageUrls[index] = 'assets/properties/p1.jpeg';
                      });
                    },
                  ),
                ),
              );
            },
          ),
          Positioned.fill(
            child: AnimatedOpacity(
              opacity: _opacity,
              duration: Duration(milliseconds: 300),
              child: Container(
                color: Colors.white
                    .withOpacity(1), // Fade color (adjust opacity as needed)
              ),
            ),
          ),
        ],
      ),
    );
  }
}
