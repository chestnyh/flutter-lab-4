import 'package:flutter/material.dart';
import 'package:flutter_application/model/product.dart';
import 'package:flutter_application/provider/theme_provider.dart';
import 'package:provider/provider.dart';

class NavigationDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var themeProvider = Provider.of<ThemeProvider>(context, listen: false);
    return Drawer(
      elevation: 3,
      child: Stack(
        children: [
          Container(
            color: Theme.of(context).backgroundColor,
            child: Center(
              child: Column(
                // mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                  children: Category.values
                      .map((cat) => Padding(
                          padding: EdgeInsets.symmetric(vertical: 16, horizontal: 12),
                          child: Text(categoryValues.reverse[cat].toUpperCase(), style: Theme.of(context).textTheme.headline1)))
                      .toList()),
            ),
          ),
          Positioned(
            right: 12,
              top: 48,
              child: IconButton(
                onPressed: (){
                  themeProvider.setThemeData = !themeProvider.isLightTheme;

                },
                icon: Icon(
                  themeProvider.isLightTheme? Icons.nightlight_round : Icons.wb_sunny,
                  size: 24,
                ),
              ))
        ],
      ),
    );
  }
}
