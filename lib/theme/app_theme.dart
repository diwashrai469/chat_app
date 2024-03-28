import 'package:flutter/material.dart';
import '../common/constant/app_dimens.dart';

const fontFamily = "Poppins";
const avatarBackgroundColor = Color.fromRGBO(91, 91, 91, 91);
final boarderAvatarBackgroundColor = Colors.grey.shade300;

const approveColor = Color(0xFF008000);
const lateColor = Color(0xFFFFA500);
const onTimeColor = Color(0xFF008000);
const halfDayColor = Color(0xFFFFA500);
const holidayColor = Color(0xFFFF0000);
const darkSucessColor = Color(0xFF009688);

const lightThemescaffoldColor = Color(0xFFEDEDED);
const lightPrimaryColor = Color(0xFFF2EBFC);
const chatMessageTextColor = Color.fromARGB(255, 87, 83, 83);
const disabledColor = Color(0xFFbcbcbc);
const primaryColor = Color(0xFF663399);
const lightPrimaryCplor = Color(0xFFa0a6ff);
const secondaryColor = Color(0xFF2d3032);
const darkErrorColor = Color(0xFFC11414);
const cardColor = Color(0xFF2d3032);
const shutleGrey = Color(0xFFf4f4f4);
const errorColor = Color(0xFFEF4444);
const successColor = Color(0xFF00da9f);
const warningColor = Color(0xFFfce8bb);
const warningIconColor = Color(0xFFf3b31c);
const darkGrey = Color(0xFF5b5b5b);
const lightGrey = Color(0xFFf3f6f9);
const chipGrey = Color(0xFFe1e1e1);
const cursorColor = Color(0xFF666666);
const bodyColor = Color(0xFF000000);
const buttonColor = Color(0xFFFFFFFF);
const inputSuffixIconClor = Color(0xFF6dd819);
const containerColor = Color.fromARGB(255, 234, 238, 243);
const lightThemeContainerColor = Color(0xFFF6F6F6);

Color getColor(Set<MaterialState> states) {
  const Set<MaterialState> interactiveStates = <MaterialState>{
    MaterialState.pressed,
    MaterialState.hovered,
    MaterialState.focused,
  };
  if (states.any(interactiveStates.contains)) {
    return Colors.blue;
  }
  return primaryColor;
}

abstract class AppThemes {
  //light theme
  static ThemeData light = ThemeData.light().copyWith(
    primaryColor: primaryColor,
    cardColor: const Color(0xFFFFFFFF),
    drawerTheme:
        const DrawerThemeData(backgroundColor: lightThemescaffoldColor),
    textSelectionTheme: ThemeData.light().textSelectionTheme.copyWith(
          cursorColor: cursorColor,
        ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: lightThemescaffoldColor,
    ),
    progressIndicatorTheme:
        const ProgressIndicatorThemeData(color: primaryColor),
    textButtonTheme: TextButtonThemeData(
      style: ButtonStyle(
          foregroundColor: MaterialStateProperty.resolveWith(getColor)),
    ),
    appBarTheme: AppBarTheme(
        backgroundColor: primaryColor,
        elevation: 0,
        titleTextStyle: ThemeData.light().textTheme.bodyMedium?.copyWith(
            fontSize: AppDimens.headlineFontSizeSmall1, color: Colors.white),
        iconTheme: const IconThemeData(color: Colors.white)),
    textTheme: ThemeData.light()
        .textTheme
        .apply(
          bodyColor: secondaryColor,
          fontFamily: fontFamily,
        )
        .copyWith(
          bodyMedium: ThemeData.light().textTheme.bodyMedium?.copyWith(
                color: secondaryColor,
                fontSize: AppDimens.headlineFontSizeXXSmall,
                fontFamily: fontFamily,
                fontWeight: FontWeight.w300,
                letterSpacing: 0.3,
              ),
        ),
    visualDensity: VisualDensity.adaptivePlatformDensity,
    scaffoldBackgroundColor: const Color(0xFFF4F4F1),
  );
}
