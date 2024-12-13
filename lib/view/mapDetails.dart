import 'package:flutter/material.dart';

import '../constants/colorConst.dart';
import '../constants/textStyles.dart';
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
      body: Column(
        children: [
          MapDetailsBox(
            date: '1',
            day: '1',
            type: '1',
            temp: '1',
            precipitation: '1',
            humidity: '1',
            windSpeed: '1',
          ),
        ],
      ),
    );
  }
}
