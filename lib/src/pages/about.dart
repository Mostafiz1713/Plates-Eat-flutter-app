import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery_app/generated/i18n.dart';
import 'package:food_delivery_app/src/dimension/dimension.dart';

class About extends StatefulWidget {
  @override
  _AboutState createState() => _AboutState();
}

class _AboutState extends State<About> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(CupertinoIcons.back),
          onPressed: () {
            Navigator.of(context).pop(true);
          },
        ),
        backgroundColor: Theme.of(context).focusColor,
        elevation: 0,
        centerTitle: true,
        iconTheme: IconThemeData(color: Theme.of(context).primaryColor),
        title: Text(
          S.of(context).about,
          style: Theme.of(context).textTheme.title.merge(TextStyle(
              letterSpacing: 1.3, color: Theme.of(context).primaryColor)),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.only(left: Dimension.padding, right: Dimension.padding, top: Dimension.padding),
        child: Container(
          width: MediaQuery.of(context).size.width,
          child: Text(S.of(context).about_page),
        ),
      ),
    );
  }
}
