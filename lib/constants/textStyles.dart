import 'package:flutter/material.dart';
import 'package:rimesassignment/constants/colorConst.dart';

class TextStylesConst{

  static TextStyle appbarText = const TextStyle(
    color: Colors.white,
    fontSize: 17
  );

  static TextStyle leadingText = const TextStyle(
      color: Colors.black,
      fontSize: 15
  );

  static TextStyle bodyText = const TextStyle(
      color: Colors.black,
      fontSize: 12
  );

  static TextStyle detailsBoxTitle = TextStyle(
      color: ColorConst.mainColor,
      fontWeight: FontWeight.bold,
      fontSize: 13
  );

  static TextStyle detailsBoxSubtitle = const TextStyle(
      color: Colors.black,
      fontSize: 12
  );
}