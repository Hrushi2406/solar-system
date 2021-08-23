import 'package:flutter/material.dart';
import 'package:solar/models/planet.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    Key? key,
    required this.planet,
  }) : super(key: key);
  final Planet planet;

  @override
  Widget build(BuildContext context) {
    //FIXED HEIGHT CONTAINER
    return Container(
      height: 40.h,
      width: double.infinity,
      child: Stack(
        children: <Widget>[
          Positioned(
            left: 0,
            child: IconButton(
              onPressed: () => Navigator.pop(context),
              icon: Icon(
                Icons.arrow_back,
                color: Colors.white,
              ),
            ),
          ),
          //TITLE IF NEEDED
          // Align(
          //   child: Hero(
          //     tag: planet.name,
          //     child: Material(
          //       color: Colors.transparent,
          //       child: Text(
          //         planet.name,
          //         style: TextStyle(
          //           color: Colors.white,
          //           fontSize: 24.sp,
          //           fontWeight: FontWeight.w700,
          //         ),
          //       ),
          //     ),
          //   ),
          // ),
        ],
      ),
    );
  }
}
