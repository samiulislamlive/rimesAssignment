
import 'package:flutter/material.dart';



class DayWidget extends StatelessWidget {
  String day;
  String date;
  TextStyle style1;
  TextStyle style2;
  DayWidget({super.key,
    required this.day,
    required this.date,
    required this.style1,
    required this.style2,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
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
