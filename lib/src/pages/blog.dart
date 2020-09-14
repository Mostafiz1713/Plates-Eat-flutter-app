import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery_app/generated/i18n.dart';
import 'package:food_delivery_app/src/dimension/dimension.dart';
import 'package:food_delivery_app/src/elements/SearchBarWidget.dart';
import 'package:food_delivery_app/config/app_config.dart' as appConfig;
import 'package:food_delivery_app/src/models/beginner_blog.dart';
import 'package:food_delivery_app/src/models/lasted_blog.dart';
import 'package:food_delivery_app/src/models/monthly_blog.dart';
import 'package:food_delivery_app/src/models/skilled_blog.dart';
import 'package:food_delivery_app/src/models/trendy_blog.dart';
import 'package:food_delivery_app/src/models/yearly_blog.dart';

class Blog extends StatefulWidget {
  @override
  _BlogState createState() => _BlogState();
}

class _BlogState extends State<Blog> {
  double buttonHeight = 75;
  double buttonWidth = 150;
  var blogTab = 1;

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
          S.of(context).blog,
          style: Theme.of(context).textTheme.title.merge(TextStyle(
              letterSpacing: 1.3, color: Theme.of(context).primaryColor)),
        ),
        actions: <Widget>[
          Padding(
            padding: EdgeInsets.only(right: Dimension.padding),
            child: Icon(Icons.more_horiz),
          )
        ],
      ),
      body: Container(
        child: ListView(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: SearchBarWidget(),
            ),
            Padding(
              padding: EdgeInsets.only(
                  left: Dimension.padding, right: Dimension.padding),
              child: Container(
                padding: EdgeInsets.only(top: 15, bottom: 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      S.of(context).for_you,
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                  left: Dimension.padding, right: Dimension.padding),
              child: Container(
                alignment: Alignment.center,
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(bottom: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Container(
                            height: buttonHeight,
                            width: buttonWidth,
                            child: FlatButton(
                              onPressed: () {},
                              //child: Text(S.of(context).breakfast),
                              child: Text(S.of(context).popular),
                              color: appConfig.Colors().mainColor(1),
                            ),
                          ),
                          Container(
                            height: buttonHeight,
                            width: buttonWidth,
                            child: FlatButton(
                              onPressed: () {},
                              child: Text(S.of(context).cardiyo),
                              color: appConfig.Colors().mainColor(1),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Container(
                          height: buttonHeight,
                          width: buttonWidth,
                          child: FlatButton(
                            onPressed: () {},
                            child: Text(S.of(context).bulgarian_squat),
                            color: appConfig.Colors().mainColor(1),
                          ),
                        ),
                        Container(
                          height: buttonHeight,
                          width: buttonWidth,
                          child: FlatButton(
                            onPressed: () {},
                            child: Text(S.of(context).work_out),
                            color: appConfig.Colors().mainColor(1),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                  top: 10, left: Dimension.padding, right: Dimension.padding),
              child: Container(
                height: 40.0,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: <Widget>[
                    FlatButton(
                      onPressed: () {
                        setState(() {
                          blogTab = 1;
                        });
                      },
                      shape: new RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(25)),
                      child: Text(S.of(context).lasted),
                      color: appConfig.Colors().mainDarkColor(1),
                    ),
                    FlatButton(
                      onPressed: () {
                        setState(() {
                          blogTab = 2;
                        });
                      },
                      shape: new RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(25)),
                      child: Text(S.of(context).skilled),
                      color: appConfig.Colors().mainDarkColor(1),
                    ),
                    FlatButton(
                      onPressed: () {
                        setState(() {
                          blogTab = 3;
                        });
                      },
                      shape: new RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(25)),
                      child: Text(S.of(context).beginner),
                      color: appConfig.Colors().mainDarkColor(1),
                    ),
                    FlatButton(
                      onPressed: () {
                        setState(() {
                          blogTab = 4;
                        });
                      },
                      shape: new RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(25)),
                      child: Text(S.of(context).trendy),
                      color: appConfig.Colors().mainDarkColor(1),
                    ),
                    FlatButton(
                      onPressed: () {
                        setState(() {
                          blogTab = 5;
                        });
                      },
                      shape: new RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(25)),
                      child: Text(S.of(context).monthly),
                      color: appConfig.Colors().mainDarkColor(1),
                    ),
                    FlatButton(
                      onPressed: () {
                        setState(() {
                          blogTab = 6;
                        });
                      },
                      shape: new RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(25)),
                      child: Text(S.of(context).yearly),
                      color: appConfig.Colors().mainDarkColor(1),
                    ),
                  ],
                ),
              ),
            ),
            getPage(),
          ],
        ),
      ),
    );
  }

  getPage() {
    if (blogTab == 1) {
      return Lasted();
    } else if (blogTab == 2) {
      return Skilled();
    } else if (blogTab == 3) {
      return Beginner();
    } else if (blogTab == 4) {
      return Trendy();
    } else if (blogTab == 5) {
      return Monthly();
    } else {
      return Yearly();
    }
  }
}

//Lasted
class Lasted extends StatefulWidget {
  @override
  _LastedState createState() => _LastedState();
}

class _LastedState extends State<Lasted> {
  double imageHeight = 100;
  double imageWidth = 200;
  double tabContainerHeight = 200;
  double tabContainerWidth = 180;

  var blogHeadingTextStyle = TextStyle(
    fontWeight: FontWeight.bold,
    color: Colors.white,
  );
  var blogDescriptionTextStyle = TextStyle(
    color: Colors.white,
  );
  var blogButtonTextStyle = TextStyle(
    fontSize: 10,
    color: appConfig.Colors().mainColor(1),
  );

  List<Lasted_Blog> lasted_blog_list = List();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    lasted_blog_list = new Lasted_Blog().Demo_Lasted_Blog();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
          top: 10, left: Dimension.padding, right: Dimension.padding),
      child: Container(
        height: tabContainerHeight,
        margin: EdgeInsets.only(top: 5),
        child: ListView.builder(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemCount: lasted_blog_list.length,
            itemBuilder: (context, index) {
              return Card(
                clipBehavior: Clip.antiAlias,
                child: Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      fit: BoxFit.fill,
                      image: NetworkImage(
                        lasted_blog_list[index].image,
                        scale: 1.0,
                      ),
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      /* Image.network(
                        lasted_blog_list[index].image,
                        scale: 1.0,
                        height: imageHeight,
                        width: imageWidth,
                        fit: BoxFit.fill,
                      ),*/
                      Padding(
                        padding: EdgeInsets.only(left: 5, right: 5),
                        child: Text(
                          lasted_blog_list[index].headline,
                          style: blogHeadingTextStyle,
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Container(
                            width: tabContainerWidth,
                            child: Padding(
                              padding: EdgeInsets.only(left: 5),
                              child: Text(
                                lasted_blog_list[index].description,
                                style: blogDescriptionTextStyle,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ),
                          FlatButton(
                            onPressed: () {},
                            child: Text(S.of(context).readmore,
                                style: blogButtonTextStyle),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              );
            }),
      ),
    );
  }
}

//Skilled
class Skilled extends StatefulWidget {
  @override
  _SkilledState createState() => _SkilledState();
}

class _SkilledState extends State<Skilled> {
  double imageHeight = 100;
  double imageWidth = 200;
  double tabContainerHeight = 200;
  double tabContainerWidth = 180;

  var blogHeadingTextStyle = TextStyle(
    fontWeight: FontWeight.bold,
    color: Colors.white,
  );
  var blogDescriptionTextStyle = TextStyle(
    color: Colors.white,
  );
  var blogButtonTextStyle = TextStyle(
    fontSize: 8,
    color: appConfig.Colors().mainColor(1),
  );

  List<Skilled_Blog> skilled_blog_list = List();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    skilled_blog_list = new Skilled_Blog().Demo_Skilled_Blog();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
          top: 10, left: Dimension.padding, right: Dimension.padding),
      child: Container(
        height: tabContainerHeight,
        width: tabContainerWidth,
        margin: EdgeInsets.only(top: 5),
        child: ListView.builder(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemCount: skilled_blog_list.length,
            itemBuilder: (context, index) {
              return Card(
                clipBehavior: Clip.antiAlias,
                child: Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      fit: BoxFit.fill,
                      image: NetworkImage(
                        skilled_blog_list[index].image,
                        scale: 1.0,
                      ),
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      /* Image.network(
                        lasted_blog_list[index].image,
                        scale: 1.0,
                        height: imageHeight,
                        width: imageWidth,
                        fit: BoxFit.fill,
                      ),*/
                      Padding(
                        padding: EdgeInsets.only(left: 5, right: 5),
                        child: Text(
                          skilled_blog_list[index].headline,
                          style: blogHeadingTextStyle,
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Container(
                            width: tabContainerWidth,
                            child: Padding(
                              padding: EdgeInsets.only(left: 5),
                              child: Text(
                                skilled_blog_list[index].description,
                                style: blogDescriptionTextStyle,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ),
                          FlatButton(
                            onPressed: () {},
                            child: Text(S.of(context).readmore,
                                style: blogButtonTextStyle),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              );
            }),
      ),
    );
  }
}

//Beginner
class Beginner extends StatefulWidget {
  @override
  _BeginnerState createState() => _BeginnerState();
}

class _BeginnerState extends State<Beginner> {
  double imageHeight = 100;
  double imageWidth = 200;
  double tabContainerHeight = 200;
  double tabContainerWidth = 180;

  var blogHeadingTextStyle = TextStyle(
    fontWeight: FontWeight.bold,
    color: Colors.white,
  );
  var blogDescriptionTextStyle = TextStyle(
    color: Colors.white,
  );
  var blogButtonTextStyle = TextStyle(
    fontSize: 8,
    color: appConfig.Colors().mainColor(1),
  );

  List<Beginner_Blog> beginner_blog_list = List();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    beginner_blog_list = new Beginner_Blog().Demo_Beginner_Blog();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
          top: 10, left: Dimension.padding, right: Dimension.padding),
      child: Container(
        height: tabContainerHeight,
        width: tabContainerWidth,
        margin: EdgeInsets.only(top: 5),
        child: ListView.builder(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemCount: beginner_blog_list.length,
            itemBuilder: (context, index) {
              return Card(
                clipBehavior: Clip.antiAlias,
                child: Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      fit: BoxFit.fill,
                      image: NetworkImage(
                        beginner_blog_list[index].image,
                        scale: 1.0,
                      ),
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      /* Image.network(
                        lasted_blog_list[index].image,
                        scale: 1.0,
                        height: imageHeight,
                        width: imageWidth,
                        fit: BoxFit.fill,
                      ),*/
                      Padding(
                        padding: EdgeInsets.only(left: 5, right: 5),
                        child: Text(
                          beginner_blog_list[index].headline,
                          style: blogHeadingTextStyle,
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Container(
                            width: tabContainerWidth,
                            child: Padding(
                              padding: EdgeInsets.only(left: 5),
                              child: Text(
                                beginner_blog_list[index].description,
                                style: blogDescriptionTextStyle,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ),
                          FlatButton(
                            onPressed: () {},
                            child: Text(S.of(context).readmore,
                                style: blogButtonTextStyle),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              );
            }),
      ),
    );
  }
}

//Trendy
class Trendy extends StatefulWidget {
  @override
  _TrendyState createState() => _TrendyState();
}

class _TrendyState extends State<Trendy> {
  double imageHeight = 100;
  double imageWidth = 200;
  double tabContainerHeight = 200;
  double tabContainerWidth = 180;

  var blogHeadingTextStyle = TextStyle(
    fontWeight: FontWeight.bold,
    color: Colors.white,
  );
  var blogDescriptionTextStyle = TextStyle(
    color: Colors.white,
  );
  var blogButtonTextStyle = TextStyle(
    fontSize: 8,
    color: appConfig.Colors().mainColor(1),
  );

  List<Trendy_Blog> trendy_blog_list = List();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    trendy_blog_list = new Trendy_Blog().Demo_Trendy_Blog();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
          top: 10, left: Dimension.padding, right: Dimension.padding),
      child: Container(
        height: tabContainerHeight,
        width: tabContainerWidth,
        margin: EdgeInsets.only(top: 5),
        child: ListView.builder(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemCount: trendy_blog_list.length,
            itemBuilder: (context, index) {
              return Card(
                clipBehavior: Clip.antiAlias,
                child: Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      fit: BoxFit.fill,
                      image: NetworkImage(
                        trendy_blog_list[index].image,
                        scale: 1.0,
                      ),
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      /* Image.network(
                        lasted_blog_list[index].image,
                        scale: 1.0,
                        height: imageHeight,
                        width: imageWidth,
                        fit: BoxFit.fill,
                      ),*/
                      Padding(
                        padding: EdgeInsets.only(left: 5, right: 5),
                        child: Text(
                          trendy_blog_list[index].headline,
                          style: blogHeadingTextStyle,
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Container(
                            width: tabContainerWidth,
                            child: Padding(
                              padding: EdgeInsets.only(left: 5),
                              child: Text(
                                trendy_blog_list[index].description,
                                style: blogDescriptionTextStyle,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ),
                          FlatButton(
                            onPressed: () {},
                            child: Text(S.of(context).readmore,
                                style: blogButtonTextStyle),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              );
            }),
      ),
    );
  }
}

//Monthly
class Monthly extends StatefulWidget {
  @override
  _MonthlyState createState() => _MonthlyState();
}

class _MonthlyState extends State<Monthly> {
  double imageHeight = 100;
  double imageWidth = 200;
  double tabContainerHeight = 200;
  double tabContainerWidth = 180;

  var blogHeadingTextStyle = TextStyle(
    fontWeight: FontWeight.bold,
    color: Colors.white,
  );
  var blogDescriptionTextStyle = TextStyle(
    color: Colors.white,
  );
  var blogButtonTextStyle = TextStyle(
    fontSize: 8,
    color: appConfig.Colors().mainColor(1),
  );

  List<Monthly_Blog> monthly_blog_list = List();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    monthly_blog_list = new Monthly_Blog().Demo_Monthly_Blog();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
          top: 10, left: Dimension.padding, right: Dimension.padding),
      child: Container(
        height: tabContainerHeight,
        width: tabContainerWidth,
        margin: EdgeInsets.only(top: 5),
        child: ListView.builder(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemCount: monthly_blog_list.length,
            itemBuilder: (context, index) {
              return Card(
                clipBehavior: Clip.antiAlias,
                child: Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      fit: BoxFit.fill,
                      image: NetworkImage(
                        monthly_blog_list[index].image,
                        scale: 1.0,
                      ),
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      /* Image.network(
                        lasted_blog_list[index].image,
                        scale: 1.0,
                        height: imageHeight,
                        width: imageWidth,
                        fit: BoxFit.fill,
                      ),*/
                      Padding(
                        padding: EdgeInsets.only(left: 5, right: 5),
                        child: Text(
                          monthly_blog_list[index].headline,
                          style: blogHeadingTextStyle,
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Container(
                            width: tabContainerWidth,
                            child: Padding(
                              padding: EdgeInsets.only(left: 5),
                              child: Text(
                                monthly_blog_list[index].description,
                                style: blogDescriptionTextStyle,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ),
                          FlatButton(
                            onPressed: () {},
                            child: Text(S.of(context).readmore,
                                style: blogButtonTextStyle),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              );
            }),
      ),
    );
  }
}

//Yearly
class Yearly extends StatefulWidget {
  @override
  _YearlyState createState() => _YearlyState();
}

class _YearlyState extends State<Yearly> {
  double imageHeight = 100;
  double imageWidth = 200;
  double tabContainerHeight = 200;
  double tabContainerWidth = 180;

  var blogHeadingTextStyle = TextStyle(
    fontWeight: FontWeight.bold,
    color: Colors.white,
  );
  var blogDescriptionTextStyle = TextStyle(
    color: Colors.white,
  );
  var blogButtonTextStyle = TextStyle(
    fontSize: 8,
    color: appConfig.Colors().mainColor(1),
  );

  List<Yearly_Blog> yearly_blog_list = List();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    yearly_blog_list = new Yearly_Blog().Demo_Yearly_Blog();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
          top: 10, left: Dimension.padding, right: Dimension.padding),
      child: Container(
        height: tabContainerHeight,
        width: tabContainerWidth,
        margin: EdgeInsets.only(top: 5),
        child: ListView.builder(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemCount: yearly_blog_list.length,
            itemBuilder: (context, index) {
              return Card(
                clipBehavior: Clip.antiAlias,
                child: Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      fit: BoxFit.fill,
                      image: NetworkImage(
                        yearly_blog_list[index].image,
                        scale: 1.0,
                      ),
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      /* Image.network(
                        lasted_blog_list[index].image,
                        scale: 1.0,
                        height: imageHeight,
                        width: imageWidth,
                        fit: BoxFit.fill,
                      ),*/
                      Padding(
                        padding: EdgeInsets.only(left: 5, right: 5),
                        child: Text(
                          yearly_blog_list[index].headline,
                          style: blogHeadingTextStyle,
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Container(
                            width: tabContainerWidth,
                            child: Padding(
                              padding: EdgeInsets.only(left: 5),
                              child: Text(
                                yearly_blog_list[index].description,
                                style: blogDescriptionTextStyle,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ),
                          FlatButton(
                            onPressed: () {},
                            child: Text(S.of(context).readmore,
                                style: blogButtonTextStyle),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              );
            }),
      ),
    );
  }
}
