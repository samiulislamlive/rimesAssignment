import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rimesassignment/constants/colorConst.dart';
import 'package:rimesassignment/utils/typeWidget.dart';
import 'package:rimesassignment/utils/weatherDetailWidget.dart';

import '../constants/apiConst.dart';
import 'dayWidget.dart';

class MapDetailsBox extends StatelessWidget {
  String date;
  String day;
  String type;
  String temp1;
  String temp2;
  String temp3;
  String tempUnit;
  String precipitation;
  String precipitationUnit;
  String humidity;
  String humidityUnit;
  String windSpeed;
  String windSpeedUnit;
  MapDetailsBox({
    super.key,
    required this.date,
    required this.day,
    required this.type,
    required this.temp1,
    required this.temp2,
    required this.temp3,
    required this.tempUnit,
    required this.precipitation,
    required this.precipitationUnit,
    required this.humidity,
    required this.humidityUnit,
    required this.windSpeed,
    required this.windSpeedUnit,
  });

  @override
  Widget build(BuildContext context) {
    TextStyle detailsBoxTitle = TextStyle(
        color: ColorConst.mainColor, fontWeight: FontWeight.bold, fontSize: 16);

    TextStyle detailsBoxSubtitle =
        const TextStyle(color: Colors.black, fontSize: 14);

    TextStyle detailsBoxSubtitle1 = const TextStyle(
        color: Colors.black, fontSize: 14, fontWeight: FontWeight.bold);

    return Padding(
      padding: EdgeInsets.all(8.0),
      child: Container(
        height: 220,
        decoration: BoxDecoration(
            color: ColorConst.secondaryColor,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: ColorConst.mainColor, width: 2)),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  DayWidget(
                    day: day,
                    date: date,
                    style1: detailsBoxTitle,
                    style2: detailsBoxSubtitle,
                    crossAxisAlignment: CrossAxisAlignment.start,
                  ),
                  TypeWidget(
                    image: type == "Sunny"
                        ? Image.asset(
                            ApiConst.sunny,
                            height: 25,
                            width: 25,
                          )
                        : Image.asset(
                            ApiConst.rainy,
                            height: 25,
                            width: 25,
                          ),
                    type: type,
                    style: detailsBoxSubtitle,
                    crossAxisAlignment: CrossAxisAlignment.end,
                  )
                ],
              ),
              Divider(color: ColorConst.mainColor,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  WeatherDetailsWidget(
                    icon: Icon(
                      Icons.thermostat_outlined,
                      color: ColorConst.mainColor,
                    ),
                    title: "Temperature",
                    dataMin: temp1,
                    dataMax: temp3,
                    unit: tempUnit,
                    titleStyle: detailsBoxSubtitle,
                    dataStyle: detailsBoxSubtitle1,
                  ),
                  WeatherDetailsWidget(
                    icon: Icon(
                      CupertinoIcons.cloud_rain,
                      color: ColorConst.mainColor,
                    ),
                    title: "Precipitation",
                    dataAvg: precipitation,
                    unit: precipitationUnit,
                    titleStyle: detailsBoxSubtitle,
                    dataStyle: detailsBoxSubtitle1,
                  ),
                  WeatherDetailsWidget(
                    icon: Icon(
                      Icons.water_drop_outlined,
                      color: ColorConst.mainColor,
                    ),
                    title: "Humidity",
                    dataAvg: humidity,
                    unit: humidityUnit,
                    titleStyle: detailsBoxSubtitle,
                    dataStyle: detailsBoxSubtitle1,
                  ),
                  WeatherDetailsWidget(
                    icon: Icon(
                      CupertinoIcons.cloud_bolt_rain,
                      color: ColorConst.mainColor,
                    ),
                    title: "Wind Speed",
                    dataAvg: windSpeed,
                    unit: windSpeedUnit,
                    titleStyle: detailsBoxSubtitle,
                    dataStyle: detailsBoxSubtitle1,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
