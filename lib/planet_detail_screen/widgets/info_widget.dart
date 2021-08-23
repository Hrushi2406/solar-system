import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class InfoWidget extends StatelessWidget {
  const InfoWidget({Key? key, required this.name, required this.value})
      : super(key: key);

  final String name;
  final String value;

  @override
  Widget build(BuildContext context) {
    //CONSTRAINED WIDGET TO GIVE MIN WIDTH TO THE INFO WIDGET
    return ConstrainedBox(
      constraints: BoxConstraints(
        minWidth: 90.0.w,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            name,
            style: TextStyle(
              color: Colors.white,
              fontSize: 10.sp,
              fontWeight: FontWeight.w200,
            ),
          ),
          Text(
            value,
            style: TextStyle(
              color: Colors.white,
              fontSize: 18.sp,
              fontWeight: FontWeight.w700,
            ),
          ),
        ],
      ),
    );
  }
}
