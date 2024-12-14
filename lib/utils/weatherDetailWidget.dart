import 'package:flutter/material.dart';


class WeatherDetailsWidget extends StatelessWidget {
  Icon icon;
  String title;
  String? dataMin;
  String? dataAvg;
  String? dataMax;
  String unit;
  TextStyle titleStyle;
  TextStyle dataStyle;
  WeatherDetailsWidget({super.key,
    required this.icon,
    required this.title,
    this.dataMin,
    this.dataAvg,
    this.dataMax,
    required this.unit,
    required this.titleStyle,
    required this.dataStyle
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        icon,
        Text("Humidity",
        style: titleStyle,
        ),
        dataAvg == null ? Text("${dataMin!}-${dataMax!}$unit",
        style: dataStyle,
        ):Text(dataAvg!+unit,
          style: dataStyle,
        ),
      ],
    );
  }
}
