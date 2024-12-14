import 'package:flutter/material.dart';
import '../constants/colorConst.dart';
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
    futureWeather = ApiService().fetchForecastData(widget.upazilaId);
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
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
              Row(
                children: [
                  Text(
                    widget.name,
                    style: const TextStyle(color: Colors.white, fontSize: 14),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Text(
                    widget.district,
                    style: const TextStyle(color: Colors.white, fontSize: 14),
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
      body: FutureBuilder<ForecastModel>(
        future: futureWeather,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
                child: CircularProgressIndicator(
              color: ColorConst.mainColor,
            ));
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
              },
            );
          } else {
            return const Center(child: Text('No data available'));
          }
        },
      ),
    );
  }
}
