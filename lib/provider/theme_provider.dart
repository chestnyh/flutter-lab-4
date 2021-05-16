import 'package:flutter/material.dart';
import 'package:flutter_application/theme/theme.dart';
import 'package:flutter_application/util/shared_pref_storage.dart';

class ThemeProvider extends ChangeNotifier {
  bool isLightTheme;

  ThemeProvider({this.isLightTheme = true});

  ThemeData get getThemeData => isLightTheme ? lightTheme : darkTheme;

  set setThemeData(bool val) {
    var callback = () async {
      var res = await PrefStorage.saveDarkModePref(!val);
      print('saved = $res');
    };
    callback();

    isLightTheme = val;
    notifyListeners();
  }
}
