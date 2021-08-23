import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:solar/models/data.dart';
import 'package:solar/models/planet.dart';
import 'package:solar/planet_detail_screen/planet_detail_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  //PAGE VALUE TO POSITION IMAGE
  double _currentPageValue = 0;
  //PLANETS DATA
  final List<Planet> planets = planetsData;
  //CURRENT INDEX
  int _currentIndex = planetsData.length;
  //SHOW PLANET INFO AFTER ANIMATION IS COMPLETED
  bool _showInfo = false;
  //PAGE VIEW CONTROLLER
  late final _pageController;

//GET THE PAGE VALUE AND STORE IT IN STATE
  void _pageListner() {
    setState(() {
      _currentPageValue = _pageController.page!;
    });
  }

  void navigate(Planet planet) {
    Navigator.of(context).push(
      PageRouteBuilder(
        transitionDuration: const Duration(milliseconds: 400),
        transitionsBuilder: (context, animation, secondaryAnimation, child) =>
            FadeTransition(
          opacity: animation,
          child: child,
        ),
        pageBuilder: (context, animation, secondaryAnimation) =>
            PlanetDetailScreen(planet: planet),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    _pageController = PageController(
      initialPage: planets.length,
      viewportFraction: 0.4,
    );
    _pageController.addListener(_pageListner);

    scheduleMicrotask(() async {
      //INITIAL PLANET ANIMATIONS
      _pageController.animateToPage(
        0,
        duration: const Duration(milliseconds: 6000),
        curve: Curves.fastOutSlowIn,
      );

      await Future.delayed(Duration(milliseconds: 6000));
      //AFTER ANIMATION IS COMPLETE SHOW THE INFO
      _showInfo = true;

      setState(() {});
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
          //PLANET INFO
          if (_currentIndex != 11 && _showInfo)
            PlanetInfo(planets: planets, currentIndex: _currentIndex),

          //PAGE VIEW OF IMAGES
          PageView.builder(
            controller: _pageController,
            scrollDirection: Axis.vertical,
            onPageChanged: (int i) {
              _currentIndex = i;
              setState(() {});
            },
            itemCount: planets.length + 1,
            itemBuilder: (context, index) {
              if (index == 0) {
                return SizedBox();
              }

              //ACTIVE PLANET HAS VALUE OF 0, TO POSITION PLANTS
              final value = _currentPageValue - index + 1;
              //SCALING FRACTION FOR PLANETS
              final _scale = -0.8 * (value) + 1.2;
              //OPACITY VALUE FOR PLANETS DEPENDS ON SCALE
              final opacity = _scale.clamp(0.0, 1.0);

              final planet = planets[index - 1];

              return Hero(
                tag: planet.image,
                child: Transform(
                  alignment: Alignment.bottomCenter,
                  transform: Matrix4.identity()
                    ..setEntry(3, 2, 0.001)
                    ..translate(0.0, -200.h * value, 1000.h * value)
                    ..scale(_scale),
                  child: Opacity(
                    opacity: opacity,
                    child: GestureDetector(
                      onTap: () => navigate(planet),
                      child: Image.asset(planet.image),
                    ),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}

class PlanetInfo extends StatelessWidget {
  const PlanetInfo({
    Key? key,
    required this.planets,
    required int currentIndex,
  })  : _currentIndex = currentIndex,
        super(key: key);

  final List<Planet> planets;
  final int _currentIndex;

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder<Offset>(
      tween: Tween<Offset>(begin: Offset(0, -30.h), end: Offset(0, 80.h)),
      curve: Curves.fastOutSlowIn,
      duration: const Duration(milliseconds: 650),
      builder: (BuildContext context, Offset? value, Widget? child) {
        // return Container();
        return Positioned.fill(
          // top: 80.h,
          top: value!.dy,
          child: Align(
            alignment: Alignment.topCenter,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: Column(
                children: [
                  Text(
                    planets[_currentIndex].name,
                    style: TextStyle(
                      fontSize: 32.sp,
                      color: Colors.white,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  SizedBox(height: 20.h),
                  Text(
                    planets[_currentIndex].description,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 16.sp,
                      color: Colors.white,
                      // fontWeight: FontWeight.w800,
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
