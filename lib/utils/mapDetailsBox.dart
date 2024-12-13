import 'package:flutter/material.dart';
import 'package:rimesassignment/constants/colorConst.dart';

class MapDetailsBox extends StatelessWidget {
  String date;
  String day;
  String type;
  String temp;
  String precipitation;
  String humidity;
  String windSpeed;
  MapDetailsBox({
    super.key,
    required this.date,
    required this.day,
    required this.type,
    required this.temp,
    required this.precipitation,
    required this.humidity,
    required this.windSpeed,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: Container(
        padding: EdgeInsets.all(120.0),
        decoration: BoxDecoration(
          color: ColorConst.secondaryColor,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: ColorConst.mainColor,
          width: 2
          )
        ),
      ),
    );
  }
}
