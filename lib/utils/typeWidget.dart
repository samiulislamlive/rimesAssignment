
import 'package:flutter/material.dart';

import '../constants/colorConst.dart';


class TypeWidget extends StatelessWidget {
  Icon icon;
  String type;
  TextStyle style;
  TypeWidget({super.key,
  required this.icon,
  required this.type,
  required this.style,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Icon(Icons.sunny,
          color: ColorConst.mainColor,
        ),
        Text(type,
          style: style,
        ),
      ],);
  }
}
