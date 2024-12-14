
import 'package:flutter/material.dart';



class DayWidget extends StatelessWidget {
  String day;
  String date;
  TextStyle style1;
  TextStyle style2;
  CrossAxisAlignment crossAxisAlignment;
  DayWidget({super.key,
    required this.day,
    required this.date,
    required this.style1,
    required this.style2,
    required this.crossAxisAlignment,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: crossAxisAlignment,
      children: [
        Text(day,
          style: style1,
        ),
        Text(date,
          style: style2,
        ),
      ],);
  }
}
