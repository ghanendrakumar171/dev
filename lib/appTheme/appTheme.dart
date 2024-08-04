// ignore_for_file: file_names, prefer_final_fields, prefer_const_constructors

import 'package:cosmocloud_test/utils/appSizes.dart';
import 'package:flutter/material.dart';

class AppThemeClass {
  AppThemeClass._();
  static Color primaryOnColor = Color(0xFF0B3A59);
  static Color primaryBgColor = Color(0xFF9CCEF0);
  static Color accentOnColor = Color(0xFFFAFAFA);
  static Color accentBgColor = Color(0xFF5D2C72);
  static Color backgroungColor = Color(0xFFF5F5F5);
  static Color textColor1 = Color(0xFF000000);
  static Color textColor2 = Color(0xFF666666);
  static Color textColor3 = Color(0xFFA3A3A3);
  static Color textColor4 = Color(0xFFBDBDBD);
  static Color textColor5 = Color(0xFFE0E0E0);
  static Color textColor6 = Color(0xFFEBEBEB);
  static Color errorColor = Colors.red;
  static Color successColor = Colors.green;
  static const Color _darkPrimaryColor = Colors.white24;
  static const Color _darkPrimaryVariantColor = Color.fromARGB(255, 54, 45, 45);
  static const Color _darkSecondaryColor = Colors.white;
  static const Color _darkOnPrimaryColor = Colors.white;

  static final ThemeData lightTheme = ThemeData(
      appBarTheme: AppBarTheme(
        titleTextStyle: TextStyle(
            color: textColor1,
            fontFamily: "Roboto",
            fontWeight: FontWeight.bold,
            fontSize: 26),
        color: Colors.white,
        iconTheme: IconThemeData(color: textColor1),
      ),
      colorScheme: ColorScheme.light(
        primary: primaryOnColor,
        secondary: accentOnColor,
        onPrimary: primaryBgColor,
        onPrimaryContainer: accentBgColor,
        outline: textColor1,
        tertiaryContainer: Colors.white,
        onTertiaryContainer: textColor5,
        background: Colors.white,
        onBackground: backgroungColor,
        error: errorColor,
      ),
      iconTheme: IconThemeData(
        color: primaryBgColor,
      ),
      textTheme: _lightTextTheme,
      dividerTheme: DividerThemeData(color: Colors.black12));

  static final ThemeData darkTheme = ThemeData(
      scaffoldBackgroundColor: _darkPrimaryVariantColor,
      appBarTheme: const AppBarTheme(
        color: _darkPrimaryVariantColor,
        iconTheme: IconThemeData(color: _darkOnPrimaryColor),
      ),
      colorScheme: ColorScheme.dark(
        primary: _darkPrimaryColor,
        secondary: _darkSecondaryColor,
        onPrimary: _darkPrimaryColor,
        onPrimaryContainer: _darkSecondaryColor,
        background: Colors.white12,
        outline: _darkSecondaryColor,
        tertiaryContainer: Colors.black,
        onTertiaryContainer: _darkPrimaryColor,
        onBackground: Colors.black,
        error: errorColor,
      ),
      iconTheme: IconThemeData(
        color: primaryBgColor,
      ),
      textTheme: _darkTextTheme,
      dividerTheme: DividerThemeData(
        color: Colors.black,
      ));

  static TextTheme _lightTextTheme = TextTheme(
    headlineLarge: _lightScreenHeadingLargeTextStyle,
    headlineMedium: _lightScreenHeadingMediumTextStyle,
    headlineSmall: _lightScreenHeadingSmallTextStyle,
    bodyLarge: _lightScreenBodyLargeTextStyle,
    bodyMedium: _lightScreenBodyMediumTextStyle,
    bodySmall: _lightScreenBodySmallTextStyle,
    labelMedium: _lightScreenLabelMediumTextStyle,
    labelSmall: _lightScreenLabelSmallTextStyle,
  );

  static final TextTheme _darkTextTheme = TextTheme(
      headlineLarge: _darkScreenHeadingLargeTextStyle,
      headlineMedium: _darkScreenHeadingMediumTextStyle,
      headlineSmall: _darkScreenHeadingSmallTextStyle,
      bodyLarge: _darkScreenBodyLargeTextStyle,
      bodyMedium: _darkScreenBodyMediumTextStyle,
      bodySmall: _darkScreenBodySmallTextStyle,
      labelMedium: _darkScreenLabelMediumTextStyle,
      labelSmall: _darkScreenLabelSmallTextStyle);

  static TextStyle _lightScreenHeadingLargeTextStyle = TextStyle(
    fontSize: AppSizes.sizeTwentySix,
    fontWeight: FontWeight.bold,
    color: textColor1,
    fontFamily: "Roboto",
  );

  static TextStyle _lightScreenHeadingMediumTextStyle = TextStyle(
    fontSize: AppSizes.sizeTwenty,
    fontWeight: FontWeight.w500,
    color: textColor1,
    fontFamily: "Roboto",
  );
  static TextStyle _lightScreenLabelMediumTextStyle = TextStyle(
    fontSize: AppSizes.sizeSixteen,
    fontWeight: FontWeight.w400,
    color: textColor1,
    fontFamily: "Roboto",
  );
  static TextStyle _lightScreenLabelSmallTextStyle = TextStyle(
    fontSize: AppSizes.sizeTwelve,
    fontWeight: FontWeight.w400,
    color: textColor1,
    fontFamily: "Roboto",
  );
  static TextStyle _lightScreenHeadingSmallTextStyle = TextStyle(
    fontSize: AppSizes.sizeSixteen,
    fontWeight: FontWeight.w400,
    color: textColor1.withOpacity(.8),
    fontFamily: "Roboto",
  );
  static TextStyle _lightScreenBodyLargeTextStyle = TextStyle(
    fontSize: AppSizes.sizeSixteen,
    fontWeight: FontWeight.w400,
    color: textColor1.withOpacity(.6),
    fontFamily: "Roboto",
  );
  static TextStyle _lightScreenBodyMediumTextStyle = TextStyle(
    fontSize: AppSizes.sizeFourteen,
    fontWeight: FontWeight.w400,
    color: textColor1,
    fontFamily: "Roboto",
  );
  static TextStyle _lightScreenBodySmallTextStyle = TextStyle(
    fontSize: AppSizes.sizeFourteen,
    fontWeight: FontWeight.w400,
    color: textColor1.withOpacity(.6),
    fontFamily: "Roboto",
  );

  static final TextStyle _darkScreenHeadingLargeTextStyle =
      _lightScreenHeadingLargeTextStyle.copyWith(
    color: _darkOnPrimaryColor,
  );

  static final TextStyle _darkScreenHeadingMediumTextStyle =
      _lightScreenHeadingMediumTextStyle.copyWith(
    color: _darkOnPrimaryColor,
  );
  static final TextStyle _darkScreenLabelMediumTextStyle =
      _lightScreenLabelMediumTextStyle.copyWith(
    color: _darkOnPrimaryColor,
  );
  static final TextStyle _darkScreenLabelSmallTextStyle =
      _lightScreenLabelSmallTextStyle.copyWith(
    color: _darkOnPrimaryColor,
  );
  static final TextStyle _darkScreenHeadingSmallTextStyle =
      _lightScreenHeadingSmallTextStyle.copyWith(
    color: _darkOnPrimaryColor.withOpacity(.8),
  );
  static final TextStyle _darkScreenBodyLargeTextStyle =
      _lightScreenBodyLargeTextStyle.copyWith(
    color: _darkOnPrimaryColor,
  );
  static final TextStyle _darkScreenBodyMediumTextStyle =
      _lightScreenBodyMediumTextStyle.copyWith(
    color: _darkOnPrimaryColor,
  );
  static final TextStyle _darkScreenBodySmallTextStyle =
      _lightScreenBodySmallTextStyle.copyWith(
    color: _darkOnPrimaryColor,
  );
}
