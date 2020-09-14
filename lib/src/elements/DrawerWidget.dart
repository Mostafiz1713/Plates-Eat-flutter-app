import 'package:dynamic_theme/dynamic_theme.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery_app/generated/i18n.dart';
import 'package:food_delivery_app/src/controllers/profile_controller.dart';
import 'package:food_delivery_app/src/elements/CircularLoadingWidget.dart';
import 'package:food_delivery_app/src/repository/settings_repository.dart';
import 'package:food_delivery_app/src/repository/user_repository.dart';
import 'package:mvc_pattern/mvc_pattern.dart';

class DrawerWidget extends StatefulWidget {
  @override
  _DrawerWidgetState createState() => _DrawerWidgetState();
}

class _DrawerWidgetState extends StateMVC<DrawerWidget> {
  ProfileController _con;

  _DrawerWidgetState() : super(ProfileController()) {
    _con = controller;
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: _con.user.apiToken == null
          ? CircularLoadingWidget(height: 500)
          : ListView(
              children: <Widget>[
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).pushNamed('/Pages', arguments: 1);
                  },
                  child: UserAccountsDrawerHeader(
                    decoration: BoxDecoration(
                      color: Theme.of(context).hintColor.withOpacity(0.1),
//              borderRadius: BorderRadius.only(bottomLeft: Radius.circular(35)),
                    ),
                    accountName: Text(
                      _con.user.name,
                      style: Theme.of(context).textTheme.title,
                    ),
                    accountEmail: Text(
                      _con.user.email,
                      style: Theme.of(context).textTheme.caption,
                    ),
                    currentAccountPicture: CircleAvatar(
                      backgroundColor: Theme.of(context).accentColor,
                      backgroundImage: NetworkImage(_con.user.image.thumb),
                    ),
                  ),
                ),
                ListTile(
                  onTap: () {
                    //Navigator.of(context).pushNamed('/Pages', arguments: 3);
                  },
                  leading: Icon(
                    Icons.fastfood,
                    color: Theme.of(context).focusColor.withOpacity(1),
                  ),
                  title: Text(
                    S.of(context).my_orders,
                    style: Theme.of(context).textTheme.subhead,
                  ),
                ),
                ExpansionTile(
                  leading: Icon(
                    Icons.category,
                    color: Theme.of(context).focusColor.withOpacity(1),
                  ),
                  title: Text(
                    S.of(context).grocery,
                    style: Theme.of(context).textTheme.subhead,
                  ),
                  children: <Widget>[
                    ListTile(
                      title: Text(S.of(context).recipes_of_the_day),
                      onTap: () {
                        Navigator.of(context).pushNamed('/RecipesOfTheDay');
                      },
                    ),
                    ListTile(
                      title: Text(S.of(context).shopping_list),
                      onTap: () {
                        Navigator.of(context).pushNamed('/ShoppingList');
                      },
                    ),
                    ListTile(
                      title: Text(S.of(context).scan_product),
                      onTap: () {
                        Navigator.of(context).pushNamed('/ScanProduct');
                      },
                    ),
                    ListTile(
                      title: Text(S.of(context).coupons),
                      onTap: () {
                        Navigator.of(context).pushNamed('/Coupons');
                      },
                    ),
                    ListTile(
                      title: Text(S.of(context).weekly_flyer),
                      onTap: () {
                        Navigator.of(context).pushNamed('/WeeklyFlyer');
                      },
                    ),
                  ],
                ),
                ListTile(
                  leading: Icon(
                    Icons.rowing,
                    color: Theme.of(context).focusColor.withOpacity(1),
                  ),
                  title: Text(
                    S.of(context).gym,
                    style: Theme.of(context).textTheme.subhead,
                  ),
                  onTap: () {
                    /*Navigator.push(context,
                    new MaterialPageRoute(builder: (context) => new FirstPage()));*/
                  },
                ),
                ListTile(
                  leading: Icon(
                    Icons.camera_front,
                    color: Theme.of(context).focusColor.withOpacity(1),
                  ),
                  title: Text(
                    S.of(context).plates_selfie,
                    style: Theme.of(context).textTheme.subhead,
                  ),
                  onTap: () {
                    /*Navigator.push(context,
                    new MaterialPageRoute(builder: (context) => new FirstPage()));*/
                  },
                ),
                ListTile(
                  dense: true,
                  title: Text(
                    S.of(context).application_preferences,
                    style: Theme.of(context).textTheme.body1,
                  ),
                  trailing: Icon(
                    Icons.remove,
                    color: Theme.of(context).focusColor.withOpacity(0.3),
                  ),
                ),
                ListTile(
                  leading: Icon(
                    Icons.book,
                    color: Theme.of(context).focusColor.withOpacity(1),
                  ),
                  title: Text(
                    S.of(context).blog,
                    style: Theme.of(context).textTheme.subhead,
                  ),
                  onTap: () {
                    Navigator.of(context).pushNamed('/Blog');
                  },
                ),
                ListTile(
                  leading: Icon(
                    Icons.more,
                    color: Theme.of(context).focusColor.withOpacity(1),
                  ),
                  title: Text(
                    S.of(context).more,
                    style: Theme.of(context).textTheme.subhead,
                  ),
                  onTap: () {
                    Navigator.of(context).pushNamed('/More');
                  },
                ),
                ListTile(
                  leading: Icon(
                    Icons.info,
                    color: Theme.of(context).focusColor.withOpacity(1),
                  ),
                  title: Text(
                    S.of(context).notice,
                    style: Theme.of(context).textTheme.subhead,
                  ),
                  onTap: () {
                    /*Navigator.push(context,
                    new MaterialPageRoute(builder: (context) => new FirstPage()));*/
                  },
                ),
                ListTile(
                  onTap: () {
                    Navigator.of(context).pushNamed('/Help');
                  },
                  leading: Icon(
                    Icons.help,
                    color: Theme.of(context).focusColor.withOpacity(1),
                  ),
                  title: Text(
                    S.of(context).help__support,
                    style: Theme.of(context).textTheme.subhead,
                  ),
                ),
                ListTile(
                  onTap: () {
                    Navigator.of(context).pushNamed('/Settings');
                  },
                  leading: Icon(
                    Icons.settings,
                    color: Theme.of(context).focusColor.withOpacity(1),
                  ),
                  title: Text(
                    S.of(context).settings,
                    style: Theme.of(context).textTheme.subhead,
                  ),
                ),
                ListTile(
                  onTap: () {
                    Navigator.of(context).pushNamed('/Languages');
                  },
                  leading: Icon(
                    Icons.translate,
                    color: Theme.of(context).focusColor.withOpacity(1),
                  ),
                  title: Text(
                    S.of(context).languages,
                    style: Theme.of(context).textTheme.subhead,
                  ),
                ),
                ListTile(
                  onTap: () {
                    if (Theme.of(context).brightness == Brightness.dark) {
                      setBrightness(Brightness.light);
                      DynamicTheme.of(context).setBrightness(Brightness.light);
                    } else {
                      setBrightness(Brightness.dark);
                      DynamicTheme.of(context).setBrightness(Brightness.dark);
                    }
                  },
                  leading: Icon(
                    Icons.brightness_6,
                    color: Theme.of(context).focusColor.withOpacity(1),
                  ),
                  title: Text(
                    Theme.of(context).brightness == Brightness.dark
                        ? S.of(context).light_mode
                        : S.of(context).dark_mode,
                    style: Theme.of(context).textTheme.subhead,
                  ),
                ),
                ListTile(
                  onTap: () {
                    logout().then((value) {
                      Navigator.of(context).pushNamedAndRemoveUntil(
                          '/Login', (Route<dynamic> route) => false);
                    });
                  },
                  leading: Icon(
                    Icons.exit_to_app,
                    color: Theme.of(context).focusColor.withOpacity(1),
                  ),
                  title: Text(
                    S.of(context).log_out,
                    style: Theme.of(context).textTheme.subhead,
                  ),
                ),
                ListTile(
                  dense: true,
                  title: Text(
                    S.of(context).version + " 1.0.1",
                    style: Theme.of(context).textTheme.body1,
                  ),
                  trailing: Icon(
                    Icons.remove,
                    color: Theme.of(context).focusColor.withOpacity(0.3),
                  ),
                ),
              ],
            ),
    );
  }
}
