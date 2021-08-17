import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _pageController = PageController(
    viewportFraction: 0.4,
  );

  double _currentPageValue = 0;

  final List<String> _images = [
    'sun.png',
    'mercury.png',
    'venus.png',
    'earth.png',
    'mars.png',
    'belt.png',
    'jupiter.png',
    'saturn.png',
    'uranus.png',
    'neptune.png',
    'pluto.png'
  ];

  void _pageListner() {
    setState(() {
      // print('PAGE');
      // print(_pageController.page);
      _currentPageValue = _pageController.page!;
    });
  }

  @override
  void initState() {
    super.initState();
    _pageController.addListener(_pageListner);
    scheduleMicrotask(() {
      _pageController.animateToPage(
        _images.length - 1,
        duration: const Duration(milliseconds: 5000),
        curve: Curves.easeIn,
      );
    });
  }

  @override
  void dispose() {
    _pageController.removeListener(_pageListner);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          ///
          PageView.builder(
            controller: _pageController,
            scrollDirection: Axis.vertical,
            itemCount: _images.length + 1,
            itemBuilder: (context, index) {
              if (index == 0) {
                return SizedBox();
              }
              final value = _currentPageValue - index + 1;

              print("INDEX ${index}");
              print("PAGE VALUE ${_currentPageValue}");
              print("VALUE ${_currentPageValue - index + 1}");

              // final _scale = -value * 0.2 + 1;
              final _scale = -0.8 * (value) + 1.2;
              // final _scale = 1.2;
              // final height = MediaQuery.of(context).size.height;
              final opacity = _scale.clamp(0.0, 1.0);

              return Transform(
                alignment: Alignment.bottomCenter,

                // alignment: Alignment.center,
                transform: Matrix4.identity()
                  ..setEntry(3, 2, 0.001)
                  ..translate(0.0, -200.h * value, 1000.h * value)
                  // ..translate(0.0, 150 * (value == 2 ? 1000 : value),
                  // 1000 * (value == 2 ? 2000 : value))
                  ..scale(_scale),
                child: Opacity(
                  opacity: opacity,
                  // color: Colors.red,
                  child: Image.asset(
                    'assets/images/${_images[index - 1]}',
                  ),
                ),
              );
            },
          ),

          //BACK BUTTON
          Positioned(
            top: 30.h,
            child: IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () => Navigator.pop(context),
            ),
          ),
        ],
      ),
    );
  }
}
