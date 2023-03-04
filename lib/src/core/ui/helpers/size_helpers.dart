import 'package:flutter/cupertino.dart';

extension SizeHelper on BuildContext{
  double get screenWidth => MediaQuery.of(this).size.width;
  double get screenheight => MediaQuery.of(this).size.height;

  double percentWidth(double percent) => MediaQuery.of(this).size.width * percent;
  double percentHeight(double percent) => MediaQuery.of(this).size.height * percent;
}
