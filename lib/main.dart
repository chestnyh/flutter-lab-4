import 'package:flutter/material.dart';
import 'package:flutter_application/network/api_service.dart';
import 'package:flutter_application/provider/cart_provider.dart';
import 'package:flutter_application/provider/product_provider.dart';
import 'package:flutter_application/provider/theme_provider.dart';
import 'package:flutter_application/routes.dart';
import 'package:flutter_application/util/shared_pref_storage.dart';
import 'package:provider/provider.dart';

// import 'screen/home_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  PrefStorage.getDarkModePref()
      .then((darkMode) => runApp(MyApp(darkMode: true)));
}

class MyApp extends StatelessWidget {
  final _apiService = ApiService();
  final bool darkMode;

  MyApp({Key key, this.darkMode}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => CartProvider()),
        ChangeNotifierProvider(
            create: (context) => ProductProvider(_apiService)),
        ChangeNotifierProvider(
            create: (context) => ThemeProvider(isLightTheme: !darkMode))
      ],
      child: Consumer<ThemeProvider>(builder: (context, themeProvider, _) {
        return MaterialApp(
          title: 'Flutter Demo',
          theme: themeProvider.getThemeData,
          routes: applicationRoutes,
          initialRoute: homePageRoute,
        );
      }),
    );
  }
}
