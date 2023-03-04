import 'package:flutter/material.dart';

import '../styles/app_styles.dart';
import '../styles/colors_app.dart';
import '../styles/text_styles.dart';

class ThemeConfig {
  ThemeConfig._();
  static final theme = ThemeData(
      primaryColor: ColorsApp.instance.primaryColor,
      colorScheme: ColorScheme.fromSeed(
        seedColor: ColorsApp.instance.primaryColor,
        primary: ColorsApp.instance.primaryColor,
        secondary: ColorsApp.instance.secundaryColor,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: AppStyles.instance.primaryButton,
      ),
      iconTheme: IconThemeData(
        color: ColorsApp.instance.grey,
      ),
      inputDecorationTheme: InputDecorationTheme(
          fillColor: ColorsApp.instance.primaryColor,
          isDense: true,
          labelStyle:
              TextStyles.instance.textRegular.copyWith(color: Colors.white),
          errorStyle:
              TextStyles.instance.textRegular.copyWith(color: Colors.red)));
}
