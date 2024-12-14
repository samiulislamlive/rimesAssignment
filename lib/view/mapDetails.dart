import 'package:flutter/material.dart';

import '../constants/colorConst.dart';
import '../constants/textStyles.dart';
import '../models/forecastModel.dart';
import '../service/apiService.dart';
import '../utils/mapDetailsBox.dart';

class MapDetails extends StatefulWidget {
  String district;
  String name;
  int upazilaId;
  MapDetails(
      {super.key,
      required this.district,
      required this.name,
      required this.upazilaId});

  @override
  State<MapDetails> createState() => _MapDetailsState();
}

class _MapDetailsState extends State<MapDetails> {
  late Future<ForecastModel> futureWeather;

  @override
  void initState() {
    super.initState();
    futureWeather = ApiService().fetchForecastData(widget.upazilaId); // Fetch data when screen is initialized
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(
                Icons.arrow_back,
                color: Colors.white,
              )),
          backgroundColor: ColorConst.mainColor,
          title: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Weather Forecast",
                style: TextStyle(color: Colors.white, fontSize: 18),
              ),
              Row(
                children: [
                  Text(
                    widget.name,
                    style: const TextStyle(color: Colors.white, fontSize: 16),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Text(
                    widget.district,
                    style: const TextStyle(color: Colors.white, fontSize: 16),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  const Icon(
                    Icons.location_pin,
                    color: Colors.white,
                    size: 15,
                  )
                ],
              )
            ],
          )),
      // body: Column(
      //   children: [
      //     MapDetailsBox(
      //       date: '1',
      //       day: '1',
      //       type: '1',
      //       temp: '1',
      //       precipitation: '1',
      //       humidity: '1',
      //       windSpeed: '1',
      //     ),
      //   ],
      // ),
      body: FutureBuilder<ForecastModel>(
        future: futureWeather,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (snapshot.hasData) {
            final weatherData = snapshot.data!;
            return ListView.builder(
              itemCount: weatherData.result.length,
              itemBuilder: (context, index) {
                final weather = weatherData.result[index];
                return MapDetailsBox(
                  date: weather.date,
                  day: weather.weekday,
                  type: weather.type,
                  temp1: weather.temp.valMin.toString(),
                  temp2: weather.temp.valAvg.toString(),
                  temp3: weather.temp.valMax.toString(),
                  tempUnit: weather.tempUnit,
                  precipitation: weather.rf.valMin.toString(),
                  precipitationUnit: weather.rfUnit,
                  humidity: weather.rh.valAvg.toString(),
                  humidityUnit: weather.rhUnit,
                  windSpeed: weather.windspd.valAvg.toString(),
                  windSpeedUnit: weather.windspdUnit,
                );
                return ListTile(
                  title: Text('${weather.date} - ${weather.type}'),
                  subtitle: Text('Temp: ${weather.temp.valAvg}°C'),
                  leading: Image.asset('assets/${weather.icon}'),
                );
              },
            );
          } else {
            return Center(child: Text('No data available'));
          }
        },
      ),
    );
  }
}
