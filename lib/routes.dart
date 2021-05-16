import 'package:flutter/material.dart';
import 'package:flutter_application/screen/cart_screen.dart';
import 'package:flutter_application/screen/home_screen.dart';

const String cartPageRoute = '/cart';
const String homePageRoute = '/home';

Map<String, WidgetBuilder> applicationRoutes = <String, WidgetBuilder>{
  homePageRoute: (context) => HomeScreen(),
  cartPageRoute: (context) => CartScreen(),
};
