import 'package:flutter/widgets.dart';

extension PassingExtensons on BuildContext {
  EdgeInsetsGeometry get pagePadding =>const  EdgeInsets.symmetric(horizontal: 16.0,vertical: 8);
}
extension FracionOfMediaQuery on BuildContext {
  double heightFraction(double fr) => MediaQuery.of(this).size.height / fr;
   double widthFraction(double fr) => MediaQuery.of(this).size.height / fr;
}