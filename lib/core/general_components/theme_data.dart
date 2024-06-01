import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'color_helper.dart';

ThemeData themeData(BuildContext context) {
  return ThemeData(
    textTheme: const TextTheme(
      titleMedium:  TextStyle(
          color: ColorHelper.mainColor,
          fontSize: 25,
          fontFamily: "Cairo",
          fontWeight: FontWeight.bold
      ),
    ),
    dialogTheme: const DialogTheme(
      titleTextStyle: TextStyle(
          color: ColorHelper.mainColor,
          fontSize: 20,

      ),
      backgroundColor: ColorHelper.darkColor,
      contentTextStyle: TextStyle(
          color: Colors.white
      ),

    ),
    fontFamily: "Mont",
    elevatedButtonTheme:   ElevatedButtonThemeData(
      style: ButtonStyle(
       overlayColor: WidgetStateProperty.all(
           Colors.white.withOpacity(.1)
       ),
        backgroundColor: const WidgetStatePropertyAll(
            Color(0xff2D201C)
        )
      )
    ),
    bottomSheetTheme: const BottomSheetThemeData(
      dragHandleColor: ColorHelper.mainColor,
      backgroundColor: ColorHelper.darkColor,
      dragHandleSize: Size(200,7),
      showDragHandle: true,
      shape:  RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(25.0),
        ),
      ),
    ),
    appBarTheme: const AppBarTheme(
        systemOverlayStyle: SystemUiOverlayStyle.dark,
        iconTheme: IconThemeData(
        color: ColorHelper.mainColor,
      ),
        color: ColorHelper.lightColor,
        centerTitle: true,
        titleTextStyle: TextStyle(
            color: ColorHelper.mainColor,
            fontSize: 25,
            fontWeight: FontWeight.bold,
          fontFamily: "Cairo"
        )
    ),
    scaffoldBackgroundColor: ColorHelper.lightColor,
   // primaryColor: ColorHelper.mainColor,
    colorScheme: const ColorScheme.dark(
      brightness: Brightness.dark,
    onSurface: ColorHelper.darkColor,
   primary: ColorHelper.mainColor,
    ),
    useMaterial3: true,
  );
}
