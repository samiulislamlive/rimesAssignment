import 'package:flutter/material.dart';

import '../constants/apiConst.dart';
import '../constants/colorConst.dart';

class TypeWidget extends StatelessWidget {
  Image image;
  String type;
  TextStyle style;
  CrossAxisAlignment crossAxisAlignment;
  TypeWidget({
    super.key,
    required this.image,
    required this.type,
    required this.style,
    required this.crossAxisAlignment,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: crossAxisAlignment,
      children: [
        image,
        Text(
          type,
          style: style,
        ),
      ],
    );
  }
}
