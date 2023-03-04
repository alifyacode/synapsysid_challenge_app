import 'package:flutter/Material.dart';

class ColorsApp {
  static ColorsApp? _instance;
  ColorsApp._();
  static ColorsApp get instance{
    _instance??=  ColorsApp._();
    return _instance!;
   }


   Color get darkBlue => Colors.indigo;
   Color get primaryColor => Colors.deepPurple.shade400;
   Color get secundaryColor => Colors.white;
   Color get grey => Colors.grey.shade600;
} 
extension ColorsAppExtensions on BuildContext{
  ColorsApp get primaryColor => ColorsApp.instance;
}