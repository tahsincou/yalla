import 'package:flutter/material.dart';
import 'package:yalla/blocks/screens/common/components/app_color.dart';

class ThemeProvider extends ChangeNotifier {
   ThemeMode themeMode = ThemeMode.system;
  bool get isDarkMode => themeMode == ThemeMode.dark;

  void toggleTheme(bool isOn) {
    themeMode = isOn ? ThemeMode.dark : ThemeMode.light;
    notifyListeners();
  }
}

class MyThemes {
  static final darkTheme = ThemeData(
      scaffoldBackgroundColor: Colors.black,
      backgroundColor: AppColor.bodyColorDark,
      hintColor: AppColor.textColorDark,
      primaryColorLight: AppColor.buttonBackgroundColorDark,
      textTheme: const TextTheme(
          headline1: TextStyle(
              color: Colors.white, fontSize: 30, fontWeight: FontWeight.w400)),
      buttonTheme: const ButtonThemeData(
        textTheme: ButtonTextTheme.primary,
        buttonColor: Colors.white
      ),
      highlightColor: Colors.grey[400],
      primaryColor: Colors.white,
      colorScheme: ColorScheme.dark(),
      iconTheme: IconThemeData(color: Colors.yellow));


  static final lightTheme = ThemeData(
      scaffoldBackgroundColor: Colors.white,
      backgroundColor: AppColor.bodyColor,
      hintColor: AppColor.textColor,
      primaryColorLight: AppColor.buttonBackgroundColor,
      textTheme: const TextTheme(
          headline1: TextStyle(
              color: Colors.black, fontSize: 30, fontWeight: FontWeight.w400)),
      buttonTheme: const ButtonThemeData(
          textTheme: ButtonTextTheme.primary,
          buttonColor: Colors.black
      ),
      highlightColor: Colors.grey,
      primaryColor: Colors.black,
      colorScheme: ColorScheme.light(),
      iconTheme: IconThemeData(color: Colors.lightBlue));
}
