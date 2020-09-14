import 'package:flutter/material.dart';
import 'package:food_delivery_app/src/models/route_argument.dart';
import 'package:food_delivery_app/src/pages/about.dart';
import 'package:food_delivery_app/src/pages/blog.dart';
import 'package:food_delivery_app/src/pages/cart.dart';
import 'package:food_delivery_app/src/pages/category.dart';
import 'package:food_delivery_app/src/pages/checkout.dart';
import 'package:food_delivery_app/src/pages/contact_us.dart';
import 'package:food_delivery_app/src/pages/coupons.dart';
import 'package:food_delivery_app/src/pages/debug.dart';
import 'package:food_delivery_app/src/pages/delivery_addresses.dart';
import 'package:food_delivery_app/src/pages/details.dart';
import 'package:food_delivery_app/src/pages/food.dart';
import 'package:food_delivery_app/src/pages/forget_password.dart';
import 'package:food_delivery_app/src/pages/help.dart';
import 'package:food_delivery_app/src/pages/languages.dart';
import 'package:food_delivery_app/src/pages/login.dart';
import 'package:food_delivery_app/src/pages/map.dart';
import 'package:food_delivery_app/src/pages/menu_list.dart';
import 'package:food_delivery_app/src/pages/more.dart';
import 'package:food_delivery_app/src/pages/order_success.dart';
import 'package:food_delivery_app/src/pages/pages.dart';
import 'package:food_delivery_app/src/pages/payment_methods.dart';
import 'package:food_delivery_app/src/pages/paypal_payment.dart';
import 'package:food_delivery_app/src/pages/privacy_policy.dart';
import 'package:food_delivery_app/src/pages/recipes_of_the_day.dart';
import 'package:food_delivery_app/src/pages/scan_product.dart';
import 'package:food_delivery_app/src/pages/settings.dart';
import 'package:food_delivery_app/src/pages/shopping_list.dart';
import 'package:food_delivery_app/src/pages/signup.dart';
import 'package:food_delivery_app/src/pages/splash_screen.dart';
import 'package:food_delivery_app/src/pages/terms_n_conditions.dart';
import 'package:food_delivery_app/src/pages/tracking.dart';
import 'package:food_delivery_app/src/pages/walkthrough.dart';
import 'package:food_delivery_app/src/pages/weekly_flyer.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    // Getting arguments passed in while calling Navigator.pushNamed
    final args = settings.arguments;
    switch (settings.name) {
      case '/Debug':
        return MaterialPageRoute(builder: (_) => DebugWidget(routeArgument: args as RouteArgument));
      case '/Walkthrough':
        return MaterialPageRoute(builder: (_) => Walkthrough());
      case '/Splash':
        return MaterialPageRoute(builder: (_) => SplashScreen());
      case '/SignUp':
        return MaterialPageRoute(builder: (_) => SignUpWidget());
      case '/MobileVerification':
        return MaterialPageRoute(builder: (_) => SignUpWidget());
      case '/MobileVerification2':
        return MaterialPageRoute(builder: (_) => SignUpWidget());
      case '/Login':
        return MaterialPageRoute(builder: (_) => LoginWidget());
      case '/ForgetPassword':
        return MaterialPageRoute(builder: (_) => ForgetPasswordWidget());
      case '/Pages':
        return MaterialPageRoute(builder: (_) => PagesTestWidget(currentTab: args));
      case '/Details':
        return MaterialPageRoute(builder: (_) => DetailsWidget(routeArgument: args as RouteArgument));
      case '/Map':
        return MaterialPageRoute(builder: (_) => MapWidget(routeArgument: args as RouteArgument));
      case '/Menu':
        return MaterialPageRoute(builder: (_) => MenuWidget(routeArgument: args as RouteArgument));
      case '/Food':
        return MaterialPageRoute(builder: (_) => FoodWidget(routeArgument: args as RouteArgument));
      case '/Category':
        return MaterialPageRoute(builder: (_) => CategoryWidget(routeArgument: args as RouteArgument));
      case '/Cart':
        return MaterialPageRoute(builder: (_) => CartWidget(routeArgument: args as RouteArgument));
      case '/Tracking':
        return MaterialPageRoute(builder: (_) => TrackingWidget(routeArgument: args as RouteArgument));
      case '/PaymentMethod':
        return MaterialPageRoute(builder: (_) => PaymentMethodsWidget());
      case '/DeliveryAddresses':
        return MaterialPageRoute(builder: (_) => DeliveryAddressesWidget());
      case '/Checkout':
        return MaterialPageRoute(builder: (_) => CheckoutWidget());
      case '/CashOnDelivery':
        return MaterialPageRoute(
            builder: (_) => OrderSuccessWidget(routeArgument: RouteArgument(param: 'Cash on Delivery')));
      case '/PayOnPickup':
        return MaterialPageRoute(
            builder: (_) => OrderSuccessWidget(routeArgument: RouteArgument(param: 'Pay on Pickup')));
      case '/PayPal':
        return MaterialPageRoute(builder: (_) => PayPalPaymentWidget(routeArgument: args as RouteArgument));
      case '/OrderSuccess':
        return MaterialPageRoute(builder: (_) => OrderSuccessWidget(routeArgument: args as RouteArgument));
      case '/Languages':
        return MaterialPageRoute(builder: (_) => LanguagesWidget());
      case '/Help':
        return MaterialPageRoute(builder: (_) => HelpWidget());
      case '/Settings':
        return MaterialPageRoute(builder: (_) => SettingsWidget());
      case '/RecipesOfTheDay':
        return MaterialPageRoute(builder: (_) => RecipesOfTheDay());
      case '/ShoppingList':
        return MaterialPageRoute(builder: (_) => Shopping_List());
      case '/ScanProduct':
        return MaterialPageRoute(builder: (_) => Scan_Product());
      case '/Coupons':
        return MaterialPageRoute(builder: (_) => Coupons());
      case '/WeeklyFlyer':
        return MaterialPageRoute(builder: (_) => Weekly_Flyer());
      case '/Blog':
        return MaterialPageRoute(builder: (_) => Blog());
      case '/More':
        return MaterialPageRoute(builder: (_) => More());
      case '/Privacy_Policy':
        return MaterialPageRoute(builder: (_) => Privacy_Policy());
      case '/Terms_n_Condition':
        return MaterialPageRoute(builder: (_) => Terms_n_Condition());
      case '/Contact_Us':
        return MaterialPageRoute(builder: (_) => Contact_Us());
      case '/About':
        return MaterialPageRoute(builder: (_) => About());
      default:
        // If there is no such named route in the switch statement, e.g. /third
        return MaterialPageRoute(builder: (_) => PagesTestWidget(currentTab: 2));
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          title: Text('Error'),
        ),
        body: Center(
          child: Text('ERROR'),
        ),
      );
    });
  }
}
