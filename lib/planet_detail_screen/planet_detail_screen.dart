import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:solar/models/planet.dart';
import 'package:solar/planet_detail_screen/widgets/custom_app_bar.dart';
import 'package:solar/planet_detail_screen/widgets/info_widget.dart';

class PlanetDetailScreen extends StatefulWidget {
  const PlanetDetailScreen({Key? key, required this.planet}) : super(key: key);

  final Planet planet;

  @override
  _PlanetDetailScreenState createState() => _PlanetDetailScreenState();
}

class _PlanetDetailScreenState extends State<PlanetDetailScreen> {
  @override
  Widget build(BuildContext context) {
    //WIDTH OF THE DEVICE
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              //BACK BUTTON
              CustomAppBar(planet: widget.planet),

              SizedBox(height: 60.h),

              //IMAGE AND NAME WIDGET
              Container(
                width: double.infinity,
                height: 400.h,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    //SLIDE IN FROM LEFT TRANSITION
                    TweenAnimationBuilder<Offset>(
                      tween: Tween<Offset>(
                          begin: Offset(0, 0), end: Offset(width / 1.85, 0)),
                      curve: Curves.fastOutSlowIn,
                      duration: const Duration(milliseconds: 750),
                      builder:
                          (BuildContext context, Offset? value, Widget? child) {
                        return Positioned(
                          width: 150.w,
                          left: value!.dx,
                          child: FittedBox(
                            child: Text(
                              widget.planet.name,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 48.sp,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                        );
                      },
                    ),

                    //HERO PLANET IMAGE
                    Positioned(
                      top: 0,
                      //HALF OF THE WITH OF SCREEN
                      left: -width / 2,
                      child: Hero(
                        tag: widget.planet.image,
                        child: Image.asset(
                          widget.planet.image,
                          width: width,
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              SizedBox(height: 30.h),

              //SLIDE IN FROM BOTTOM ANIMATION
              TweenAnimationBuilder<Offset>(
                tween:
                    Tween<Offset>(begin: Offset(0, 500.h), end: Offset(0, 0)),
                curve: Curves.fastOutSlowIn,
                duration: const Duration(milliseconds: 750),
                builder: (BuildContext context, Offset? value, Widget? child) {
                  //TRANSLATE IN Y DIRECTION
                  return Transform.translate(
                    offset: value!,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15.0),

                      //PLANET INFO WIDGET
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              InfoWidget(
                                name: 'Planet Type',
                                value: widget.planet.type,
                              ),
                              InfoWidget(
                                name: 'Distance from Sun',
                                value: '${widget.planet.distanceFromSun} AU',
                              ),
                            ],
                          ),
                          SizedBox(height: 30.h),
                          //INFO WIDGET
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              InfoWidget(
                                name: 'Year Length',
                                value: '${widget.planet.yearLength} earth days',
                              ),
                              InfoWidget(
                                name: 'Total Moons',
                                value: widget.planet.totalNoOfMoons,
                              ),
                            ],
                          ),

                          SizedBox(height: 40.h),

                          Text(
                            widget.planet.description +
                                widget.planet.description,
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w300,
                              fontSize: 14.sp,
                            ),
                          ),
                          SizedBox(height: 30.h),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
