import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:food_delivery_app/generated/i18n.dart';
import 'package:food_delivery_app/src/dimension/dimension.dart';
import 'package:food_delivery_app/src/elements/DrawerWidget.dart';
import 'package:food_delivery_app/src/elements/SearchBarWidget.dart';
import 'package:food_delivery_app/src/elements/ShoppingCartButtonWidget.dart';
import 'package:food_delivery_app/src/models/breakfast_model_today.dart';
import 'package:food_delivery_app/src/models/breakfast_model_yesterday.dart';
import 'package:food_delivery_app/src/models/dinner_model_today.dart';
import 'package:food_delivery_app/src/models/dinner_model_yesterday.dart';
import 'package:food_delivery_app/src/models/lunch_model_today.dart';
import 'package:food_delivery_app/src/models/lunch_model_yesterday.dart';
import 'package:food_delivery_app/src/repository/settings_repository.dart'
    as settingsRepo;
import 'package:food_delivery_app/config/app_config.dart' as appConfig;

class RecipesOfTheDay extends StatefulWidget {
  @override
  _RecipesOfTheDayState createState() => _RecipesOfTheDayState();
}

class _RecipesOfTheDayState extends State<RecipesOfTheDay> {
  int _current = 0;
  var foodDetailsTab = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //drawer: DrawerWidget(),
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
          S.of(context).recipes_of_the_day,
          style: Theme.of(context).textTheme.title.merge(TextStyle(
              letterSpacing: 1.3, color: Theme.of(context).primaryColor)),
        ),
        actions: <Widget>[
          new ShoppingCartButtonWidget(
              iconColor: Theme.of(context).primaryColor,
              labelColor: Theme.of(context).accentColor),
        ],
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: ListView(
          children: <Widget>[
            getImage(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: SearchBarWidget(),
            ),
            Padding(
              padding: EdgeInsets.only(
                  left: Dimension.padding, right: Dimension.padding),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  FlatButton(
                    onPressed: () {
                      setState(() {
                        foodDetailsTab = 1;
                      });
                    },
                    shape: new RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(25)),
                    child: Text(S.of(context).breakfast),
                    color: appConfig.Colors().mainColor(1),
                  ),
                  FlatButton(
                    onPressed: () {
                      setState(() {
                        foodDetailsTab = 2;
                      });
                    },
                    shape: new RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(25)),
                    child: Text(S.of(context).lunch),
                    color: appConfig.Colors().mainColor(1),
                  ),
                  FlatButton(
                    onPressed: () {
                      setState(() {
                        foodDetailsTab = 3;
                      });
                    },
                    shape: new RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(25)),
                    child: Text(S.of(context).dinner),
                    color: appConfig.Colors().mainColor(1),
                  )
                ],
              ),
            ),
            getPage(),
          ],
        ),
      ),
    );
  }

  getImage() {
    if (foodDetailsTab == 1) {
      return Container(
        constraints: new BoxConstraints.expand(
          height: 200.0,
        ),
        alignment: Alignment.bottomLeft,
        padding: new EdgeInsets.only(
          left: Dimension.padding,
        ),
        decoration: new BoxDecoration(
          image: new DecorationImage(
            image: new AssetImage('assets/img/breakfast.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: new Text('Breakfast Item',
            style: new TextStyle(
              color: Colors.white,
              fontSize: 20.0,
            )),
      );
    } else if (foodDetailsTab == 2) {
      return Container(
        constraints: new BoxConstraints.expand(
          height: 200.0,
        ),
        alignment: Alignment.bottomLeft,
        padding: new EdgeInsets.only(
          left: Dimension.padding,
        ),
        decoration: new BoxDecoration(
          image: new DecorationImage(
            image: new AssetImage('assets/img/lunch.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: new Text('Lunch Item',
            style: new TextStyle(
              color: Colors.white,
              fontSize: 20.0,
            )),
      );
    } else {
      return Container(
        constraints: new BoxConstraints.expand(
          height: 200.0,
        ),
        alignment: Alignment.bottomLeft,
        padding: new EdgeInsets.only(
          left: Dimension.padding,
        ),
        decoration: new BoxDecoration(
          image: new DecorationImage(
            image: new AssetImage('assets/img/dinner.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: new Text('Dinner Item',
            style: new TextStyle(
              color: Colors.white,
              fontSize: 20.0,
            )),
      );
    }
  }

  getPage() {
    if (foodDetailsTab == 1) {
      return Breakfast();
    } else if (foodDetailsTab == 2) {
      return Lunch();
    } else {
      return Dinner();
    }
  }
}

//Breakfast

class Breakfast extends StatefulWidget {
  @override
  _BreakfastState createState() => _BreakfastState();
}

class _BreakfastState extends State<Breakfast> {
  double imageHeight = 100;
  double imageWidth = 200;
  double tabContainer = 175;

  List<Breakfast_Model_Today> breakfast_today_list = List();
  List<Breakfast_Model_Yesterday> breakfast_yesterday_list = List();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    breakfast_today_list =
        new Breakfast_Model_Today().Demo_Breakfast_Model_Today();
    breakfast_yesterday_list =
        new Breakfast_Model_Yesterday().Demo_Breakfast_Model_Yesterday();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 5, right: 5),
      child: Container(
        child: Stack(
          children: <Widget>[
            ListView(
              padding: EdgeInsets.only(top: 5),
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              children: <Widget>[
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        S.of(context).todays_recipes,
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16),
                      ),
                      FlatButton.icon(
                        label: Text(S.of(context).view_all),
                        onPressed: () {},
                        icon: Icon(CupertinoIcons.down_arrow),
                      )
                    ],
                  ),
                ),
                Container(
                  height: tabContainer,
                  margin: EdgeInsets.only(top: 5),
                  child: ListView.builder(
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemCount: breakfast_today_list.length,
                      itemBuilder: (context, index) {
                        return Card(
                          clipBehavior: Clip.antiAlias,
                          child: Container(
                            width: imageWidth,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Image.network(
                                  breakfast_today_list[index].image,
                                  scale: 1.0,
                                  height: imageHeight,
                                  width: imageWidth,
                                  fit: BoxFit.fill,
                                ),
                                Padding(
                                  padding: EdgeInsets.only(left: 5, right: 5),
                                  child: Text(
                                    breakfast_today_list[index].item_name,
                                  ),
                                ),
                                Container(
                                  height: 20,
                                  child: ListView.builder(
                                    shrinkWrap: true,
                                    scrollDirection: Axis.horizontal,
                                    itemCount: breakfast_today_list[index]
                                        .item_type
                                        .length,
                                    itemBuilder: (context, index) {
                                      return Container(
                                        padding:
                                            EdgeInsets.only(left: 5, right: 5),
                                        alignment: Alignment.center,
                                        margin:
                                            EdgeInsets.only(left: 5, right: 5),
                                        color:
                                            appConfig.Colors().mainDarkColor(1),
                                        child: Text(
                                          breakfast_today_list[index]
                                              .item_type[index],
                                          style: TextStyle(color: Colors.white),
                                        ),
                                      );
                                    },
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(left: 5, right: 5),
                                  child: RichText(
                                    text: TextSpan(
                                      text: "Ingredients: ",
                                      style: TextStyle(
                                          color: appConfig.Colors()
                                              .mainDarkColor(1)),
                                      children: <TextSpan>[
                                        TextSpan(
                                            text: breakfast_today_list[index]
                                                .ingredient,
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 12)),
                                      ],
                                    ),
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      }),
                ),
                Container(
                  padding: EdgeInsets.only(top: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        S.of(context).yesterdays_recipe,
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16),
                      ),
                      FlatButton.icon(
                        label: Text(S.of(context).view_all),
                        onPressed: () {},
                        icon: Icon(CupertinoIcons.down_arrow),
                      )
                    ],
                  ),
                ),
                Container(
                  height: tabContainer,
                  margin: EdgeInsets.only(top: 5),
                  child: ListView.builder(
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemCount: breakfast_yesterday_list.length,
                      itemBuilder: (context, index) {
                        return Card(
                          clipBehavior: Clip.antiAlias,
                          child: Container(
                            width: imageWidth,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Image.network(
                                  breakfast_yesterday_list[index].image,
                                  scale: 1.0,
                                  height: imageHeight,
                                  width: imageWidth,
                                  fit: BoxFit.fill,
                                ),
                                Padding(
                                  padding: EdgeInsets.only(left: 5, right: 5),
                                  child: Text(
                                    breakfast_yesterday_list[index].item_name,
                                  ),
                                ),
                                Container(
                                  height: 20,
                                  child: ListView.builder(
                                    shrinkWrap: true,
                                    scrollDirection: Axis.horizontal,
                                    itemCount: breakfast_yesterday_list[index]
                                        .item_type
                                        .length,
                                    itemBuilder: (context, index) {
                                      return Container(
                                        padding:
                                            EdgeInsets.only(left: 5, right: 5),
                                        alignment: Alignment.center,
                                        margin:
                                            EdgeInsets.only(left: 5, right: 5),
                                        color:
                                            appConfig.Colors().mainDarkColor(1),
                                        child: Text(
                                          breakfast_yesterday_list[index]
                                              .item_type[index],
                                          style: TextStyle(color: Colors.white),
                                        ),
                                      );
                                    },
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(left: 5, right: 5),
                                  child: RichText(
                                    text: TextSpan(
                                      text: "Ingredients: ",
                                      style: TextStyle(
                                          color: appConfig.Colors()
                                              .mainDarkColor(1)),
                                      children: <TextSpan>[
                                        TextSpan(
                                            text:
                                                breakfast_yesterday_list[index]
                                                    .ingredient,
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 12)),
                                      ],
                                    ),
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      }),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

//Lunch

class Lunch extends StatefulWidget {
  @override
  _LunchState createState() => _LunchState();
}

class _LunchState extends State<Lunch> {
  double imageHeight = 100;
  double imageWidth = 200;
  double tabContainer = 175;

  List<Lunch_Model_Today> lunch_today_list = List();
  List<Lunch_Model_Yesterday> lunch_yesterday_list = List();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    lunch_today_list = new Lunch_Model_Today().Demo_Lunch_Model_Today();
    lunch_yesterday_list =
        new Lunch_Model_Yesterday().Demo_Lunch_Model_Yesterday();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 5, right: 5),
      child: Container(
        child: Stack(
          children: <Widget>[
            ListView(
              padding: EdgeInsets.only(top: 5),
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              children: <Widget>[
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        S.of(context).todays_recipes,
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16),
                      ),
                      FlatButton.icon(
                        label: Text(S.of(context).view_all),
                        onPressed: () {},
                        icon: Icon(CupertinoIcons.down_arrow),
                      )
                    ],
                  ),
                ),
                Container(
                  height: tabContainer,
                  margin: EdgeInsets.only(top: 5),
                  child: ListView.builder(
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemCount: lunch_today_list.length,
                      itemBuilder: (context, index) {
                        return Card(
                          clipBehavior: Clip.antiAlias,
                          child: Container(
                            width: imageWidth,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Image.network(
                                  lunch_today_list[index].image,
                                  scale: 1.0,
                                  height: imageHeight,
                                  width: imageWidth,
                                  fit: BoxFit.fill,
                                ),
                                Padding(
                                  padding: EdgeInsets.only(left: 5, right: 5),
                                  child: Text(
                                    lunch_today_list[index].item_name,
                                  ),
                                ),
                                Container(
                                  height: 20,
                                  child: ListView.builder(
                                    shrinkWrap: true,
                                    scrollDirection: Axis.horizontal,
                                    itemCount: lunch_today_list[index]
                                        .item_type
                                        .length,
                                    itemBuilder: (context, index) {
                                      return Container(
                                        padding:
                                            EdgeInsets.only(left: 5, right: 5),
                                        alignment: Alignment.center,
                                        margin:
                                            EdgeInsets.only(left: 5, right: 5),
                                        color:
                                            appConfig.Colors().mainDarkColor(1),
                                        child: Text(
                                          lunch_today_list[index]
                                              .item_type[index],
                                          style: TextStyle(color: Colors.white),
                                        ),
                                      );
                                    },
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(left: 5, right: 5),
                                  child: RichText(
                                    text: TextSpan(
                                      text: "Ingredients: ",
                                      style: TextStyle(
                                          color: appConfig.Colors()
                                              .mainDarkColor(1)),
                                      children: <TextSpan>[
                                        TextSpan(
                                            text: lunch_today_list[index]
                                                .ingredient,
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 12)),
                                      ],
                                    ),
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      }),
                ),
                Container(
                  padding: EdgeInsets.only(top: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        S.of(context).yesterdays_recipe,
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16),
                      ),
                      FlatButton.icon(
                        label: Text(S.of(context).view_all),
                        onPressed: () {},
                        icon: Icon(CupertinoIcons.down_arrow),
                      )
                    ],
                  ),
                ),
                Container(
                  height: tabContainer,
                  margin: EdgeInsets.only(top: 5),
                  child: ListView.builder(
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemCount: lunch_yesterday_list.length,
                      itemBuilder: (context, index) {
                        return Card(
                          clipBehavior: Clip.antiAlias,
                          child: Container(
                            width: imageWidth,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Image.network(
                                  lunch_yesterday_list[index].image,
                                  scale: 1.0,
                                  height: imageHeight,
                                  width: imageWidth,
                                  fit: BoxFit.fill,
                                ),
                                Padding(
                                  padding: EdgeInsets.only(left: 5, right: 5),
                                  child: Text(
                                    lunch_yesterday_list[index].item_name,
                                  ),
                                ),
                                Container(
                                  height: 20,
                                  child: ListView.builder(
                                    shrinkWrap: true,
                                    scrollDirection: Axis.horizontal,
                                    itemCount: lunch_yesterday_list[index]
                                        .item_type
                                        .length,
                                    itemBuilder: (context, index) {
                                      return Container(
                                        padding:
                                            EdgeInsets.only(left: 5, right: 5),
                                        alignment: Alignment.center,
                                        margin:
                                            EdgeInsets.only(left: 5, right: 5),
                                        color:
                                            appConfig.Colors().mainDarkColor(1),
                                        child: Text(
                                          lunch_yesterday_list[index]
                                              .item_type[index],
                                          style: TextStyle(color: Colors.white),
                                        ),
                                      );
                                    },
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(left: 5, right: 5),
                                  child: RichText(
                                    text: TextSpan(
                                      text: "Ingredients: ",
                                      style: TextStyle(
                                          color: appConfig.Colors()
                                              .mainDarkColor(1)),
                                      children: <TextSpan>[
                                        TextSpan(
                                            text: lunch_yesterday_list[index]
                                                .ingredient,
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 12)),
                                      ],
                                    ),
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      }),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

//Dinner

class Dinner extends StatefulWidget {
  @override
  _DinnerState createState() => _DinnerState();
}

class _DinnerState extends State<Dinner> {
  double imageHeight = 100;
  double imageWidth = 200;
  double tabContainer = 175;

  List<Dinner_Model_Today> dinner_today_list = List();
  List<Dinner_Model_Yesterday> dinner_yesterday_list = List();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    dinner_today_list = new Dinner_Model_Today().Demo_Dinner_Model_Today();
    dinner_yesterday_list =
        new Dinner_Model_Yesterday().Demo_Dinner_Model_Yesterday();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 5, right: 5),
      child: Container(
        child: Stack(
          children: <Widget>[
            ListView(
              padding: EdgeInsets.only(top: 5),
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              children: <Widget>[
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        S.of(context).todays_recipes,
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16),
                      ),
                      FlatButton.icon(
                        label: Text(S.of(context).view_all),
                        onPressed: () {},
                        icon: Icon(CupertinoIcons.down_arrow),
                      )
                    ],
                  ),
                ),
                Container(
                  height: tabContainer,
                  margin: EdgeInsets.only(top: 5),
                  child: ListView.builder(
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemCount: dinner_today_list.length,
                      itemBuilder: (context, index) {
                        return Card(
                          clipBehavior: Clip.antiAlias,
                          child: Container(
                            width: imageWidth,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Image.network(
                                  dinner_today_list[index].image,
                                  scale: 1.0,
                                  height: imageHeight,
                                  width: imageWidth,
                                  fit: BoxFit.fill,
                                ),
                                Padding(
                                  padding: EdgeInsets.only(left: 5, right: 5),
                                  child: Text(
                                    dinner_today_list[index].item_name,
                                  ),
                                ),
                                Container(
                                  height: 20,
                                  child: ListView.builder(
                                    shrinkWrap: true,
                                    scrollDirection: Axis.horizontal,
                                    itemCount: dinner_today_list[index]
                                        .item_type
                                        .length,
                                    itemBuilder: (context, index) {
                                      return Container(
                                        padding:
                                            EdgeInsets.only(left: 5, right: 5),
                                        alignment: Alignment.center,
                                        margin:
                                            EdgeInsets.only(left: 5, right: 5),
                                        color:
                                            appConfig.Colors().mainDarkColor(1),
                                        child: Text(
                                          dinner_today_list[index]
                                              .item_type[index],
                                          style: TextStyle(color: Colors.white),
                                        ),
                                      );
                                    },
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(left: 5, right: 5),
                                  child: RichText(
                                    text: TextSpan(
                                      text: "Ingredients: ",
                                      style: TextStyle(
                                          color: appConfig.Colors()
                                              .mainDarkColor(1)),
                                      children: <TextSpan>[
                                        TextSpan(
                                            text: dinner_today_list[index]
                                                .ingredient,
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 12)),
                                      ],
                                    ),
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      }),
                ),
                Container(
                  padding: EdgeInsets.only(top: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        S.of(context).yesterdays_recipe,
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16),
                      ),
                      FlatButton.icon(
                        label: Text(S.of(context).view_all),
                        onPressed: () {},
                        icon: Icon(CupertinoIcons.down_arrow),
                      )
                    ],
                  ),
                ),
                Container(
                  height: tabContainer,
                  margin: EdgeInsets.only(top: 5),
                  child: ListView.builder(
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemCount: dinner_yesterday_list.length,
                      itemBuilder: (context, index) {
                        return Card(
                          clipBehavior: Clip.antiAlias,
                          child: Container(
                            width: imageWidth,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Image.network(
                                  dinner_yesterday_list[index].image,
                                  scale: 1.0,
                                  height: imageHeight,
                                  width: imageWidth,
                                  fit: BoxFit.fill,
                                ),
                                Padding(
                                  padding: EdgeInsets.only(left: 5, right: 5),
                                  child: Text(
                                    dinner_yesterday_list[index].item_name,
                                  ),
                                ),
                                Container(
                                  height: 20,
                                  child: ListView.builder(
                                    shrinkWrap: true,
                                    scrollDirection: Axis.horizontal,
                                    itemCount: dinner_yesterday_list[index]
                                        .item_type
                                        .length,
                                    itemBuilder: (context, index) {
                                      return Container(
                                        padding:
                                            EdgeInsets.only(left: 5, right: 5),
                                        alignment: Alignment.center,
                                        margin:
                                            EdgeInsets.only(left: 5, right: 5),
                                        color:
                                            appConfig.Colors().mainDarkColor(1),
                                        child: Text(
                                          dinner_yesterday_list[index]
                                              .item_type[index],
                                          style: TextStyle(color: Colors.white),
                                        ),
                                      );
                                    },
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(left: 5, right: 5),
                                  child: RichText(
                                    text: TextSpan(
                                      text: "Ingredients: ",
                                      style: TextStyle(
                                          color: appConfig.Colors()
                                              .mainDarkColor(1)),
                                      children: <TextSpan>[
                                        TextSpan(
                                            text: dinner_yesterday_list[index]
                                                .ingredient,
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 12)),
                                      ],
                                    ),
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      }),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
