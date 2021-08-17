import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:solar/home_screen/home_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  next() {
    scheduleMicrotask(() {
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (_) => HomeScreen()));
    });
  }

  @override
  void initState() {
    super.initState();
    next();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: CupertinoButton(
          onPressed: next,
          color: Colors.red,
          child: Text("next"),
        ),
      ),
    );
  }
}
