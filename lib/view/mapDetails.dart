import 'package:flutter/material.dart';

import '../constants/colorConst.dart';
import '../constants/textStyles.dart';

class MapDetails extends StatefulWidget {
  String district;
  MapDetails({super.key, required this.district});

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
                "Details",
                style: TextStyle(color: Colors.white, fontSize: 18),
              ),
              Row(
                children: [
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
    );
  }
}
