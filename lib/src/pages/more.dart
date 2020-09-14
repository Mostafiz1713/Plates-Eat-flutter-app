import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery_app/generated/i18n.dart';
import 'package:food_delivery_app/src/dimension/dimension.dart';
import 'package:food_delivery_app/config/app_config.dart' as appConfig;

class More extends StatefulWidget {
  @override
  _MoreState createState() => _MoreState();
}

class _MoreState extends State<More> {
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
          S.of(context).more,
          style: Theme.of(context).textTheme.title.merge(TextStyle(
              letterSpacing: 1.3, color: Theme.of(context).primaryColor)),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.only(top: Dimension.padding, left: Dimension.padding, right: Dimension.padding),
        child: Container(
          width: MediaQuery.of(context).size.width,
          child: Column(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(bottom: 5),
                child: Container(
                  color: appConfig.Colors().secondDarkColor(1),
                  width: MediaQuery.of(context).size.width,
                  child: FlatButton(
                    clipBehavior: Clip.antiAlias,
                      onPressed: (){
                        Navigator.of(context).pushNamed('/Privacy_Policy');
                  },
                      child: Text(S.of(context).privacy_policy),
                  )
                ),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 5),
                child: Container(
                  color: appConfig.Colors().secondDarkColor(1),
                  width: MediaQuery.of(context).size.width,
                  child: FlatButton(
                      onPressed: (){
                        Navigator.of(context).pushNamed('/About');
                  },
                      child: Text(S.of(context).about),
                  )
                ),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 5),
                child: Container(
                  color: appConfig.Colors().secondDarkColor(1),
                  width: MediaQuery.of(context).size.width,
                  child: FlatButton(
                    clipBehavior: Clip.antiAlias,
                      onPressed: (){
                        Navigator.of(context).pushNamed('/Contact_Us');
                  },
                      child: Text(S.of(context).contact_us),
                  )
                ),
              ),
              Container(
                color: appConfig.Colors().secondDarkColor(1),
                width: MediaQuery.of(context).size.width,
                child: FlatButton(
                  clipBehavior: Clip.antiAlias,
                    onPressed: (){
                      Navigator.of(context).pushNamed('/Terms_n_Condition');
                },
                    child: Text(S.of(context).terms_n_conditions),
                )
              ),
            ],
          ),
        ),
      ),
    );
  }
}
