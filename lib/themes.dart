import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Themes extends GetxController {
  static bool isDark = false;

  var buttonStyle = TextStyle(
    fontSize: 20,
    color: Colors.white,
  );

  var dialogStyle = TextStyle(
    fontSize: 19,
    color: isDark ? Colors.white : Colors.blueAccent,
  );

  var dialogBody = TextStyle(
    fontSize: 18,
  );

  get lightTheme => ThemeData.light().copyWith(
        colorScheme: ColorScheme.fromSwatch().copyWith(
          primary: Colors.indigoAccent,
          primaryVariant: Colors.redAccent,
          secondary: Color(0xffe0f2f1),
        ),
        primaryTextTheme: TextTheme(
            headline1: TextStyle(
                fontFamily: 'Roboto',
                fontSize: 22,
                fontWeight: FontWeight.normal,
                color: Colors.white,
                shadows: <Shadow>[
                  Shadow(
                    offset: Offset(1.2, 1.5),
                    blurRadius: 3.0,
                    color: Colors.black,
                  ),
                ]),
            headline2: TextStyle(
              fontFamily: 'Roboto',
              fontSize: 50.0,
              fontWeight: FontWeight.w900,
              color: Colors.white,
            ),
            headline6: TextStyle(color: Colors.white)),
      );

  get darkTheme => ThemeData.dark().copyWith(
        brightness: Brightness.dark,
        colorScheme: ColorScheme.fromSwatch().copyWith(
            primary: Color(0xff464646),
            primaryVariant: Colors.pinkAccent,
            secondary: Color(0xffe0f2f1)),
        primaryTextTheme: TextTheme(
            headline1: TextStyle(
                fontFamily: 'Roboto',
                fontSize: 22,
                color: Colors.white,
                shadows: <Shadow>[
                  Shadow(
                    offset: Offset(1.2, 1.5),
                    blurRadius: 3.0,
                    color: Colors.black,
                  ),
                ]),
            headline2: TextStyle(
              fontFamily: 'Roboto',
              fontSize: 50.0,
              fontWeight: FontWeight.w900,
              color: Colors.white,
            ),
            headline6: TextStyle(color: Colors.white)),
      );

  void toggleMode() {
    isDark = !isDark;
    isDark ? Get.changeTheme(darkTheme) : Get.changeTheme(lightTheme);
    update();
  }
}
