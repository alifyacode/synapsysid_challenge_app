import 'package:flutter/material.dart';
import 'package:synapsysid_challenge_app/src/core/ui/styles/colors_app.dart';
import 'package:synapsysid_challenge_app/src/core/ui/styles/text_styles.dart';

class AppStyles {
  static AppStyles? _instance;

  AppStyles._();
  static AppStyles get instance{
    _instance??=  AppStyles._();
    return _instance!;
   }
  ButtonStyle get primaryButton => ElevatedButton.styleFrom(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10)
    ),
    backgroundColor: ColorsApp.instance.primaryColor,
    textStyle: TextStyles.instance.textButtonLabel,
    
  );
}