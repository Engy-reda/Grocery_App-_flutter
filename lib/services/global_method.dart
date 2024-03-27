import 'package:flutter/material.dart';

class GlobalMethod {
  // word static allow me access any thing found the  class in any
  //widget with use name of class only without create object
  // from this class
  //the problem create objectes it is no share the data
  //that is pass from object
  static navigateTo({required BuildContext ctx, required String routeName}) {
    Navigator.pushNamed(ctx, routeName);
  }
}
