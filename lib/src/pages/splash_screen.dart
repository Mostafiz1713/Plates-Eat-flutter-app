import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:food_delivery_app/generated/i18n.dart';
import 'package:food_delivery_app/src/controllers/controller.dart';
import 'package:food_delivery_app/src/repository/user_repository.dart';
import 'package:mvc_pattern/mvc_pattern.dart';

class SplashScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return SplashScreenState();
  }
}

class SplashScreenState extends StateMVC<SplashScreen> {
  Controller _con;

  SplashScreenState() : super(Controller()) {
    _con = controller;
  }

  @override
  void initState() {
    super.initState();
    loadData();
  }

  Future<Timer> loadData() async {
    return new Timer(Duration(seconds: 2), onDoneLoading);
  }

  onDoneLoading() async {
    SchedulerBinding.instance.addPostFrameCallback((_) {
      if (currentUser.apiToken == null) {
        Navigator.of(context).popAndPushNamed('/Login');
      } else {
        Navigator.of(context).popAndPushNamed('/Pages', arguments: 2);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _con.scaffoldKey,
      body: Container(
        decoration: BoxDecoration(
          color: Colors.transparent,
          image: DecorationImage(image: AssetImage("assets/img/spalsh_screen.png"),
          fit: BoxFit.fill),
          //image: Image.asset("assets/img"spalsh_screen.png)
        ),
      ),
    );
  }
}
