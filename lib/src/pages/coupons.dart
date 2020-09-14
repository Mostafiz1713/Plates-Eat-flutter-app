import 'package:flutter/material.dart';
import 'package:food_delivery_app/generated/i18n.dart';
import 'package:food_delivery_app/src/controllers/coupons_controller.dart';
import 'package:food_delivery_app/src/elements/DrawerWidget.dart';
import 'package:food_delivery_app/src/elements/ShoppingCartButtonWidget.dart';
import 'package:mvc_pattern/mvc_pattern.dart';

class Coupons extends StatefulWidget {
  @override
  _CouponsState createState() => _CouponsState();
}

class _CouponsState extends StateMVC<Coupons> {
  Coupons_Controller _con;

  _CouponsState() : super (Coupons_Controller()){
    _con = controller;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: DrawerWidget(),
      appBar: AppBar(
        backgroundColor: Theme.of(context).focusColor,
        elevation: 0,
        centerTitle: true,
        iconTheme: IconThemeData(color: Theme.of(context).primaryColor),
        title: Text(
          S.of(context).coupons,
          style: Theme.of(context)
              .textTheme
              .title
              .merge(TextStyle(letterSpacing: 1.3, color: Theme.of(context).primaryColor)),
        ),
        actions: <Widget>[
          new ShoppingCartButtonWidget(
              iconColor: Theme.of(context).primaryColor, labelColor: Theme.of(context).accentColor),
        ],
      ),
      body: Container(
        child: Center(child: Text(S.of(context).coupons)),
      ),
    );
  }
}
