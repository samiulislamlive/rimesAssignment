import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:rimesassignment/view/mapDetails.dart';
import '../constants/colorConst.dart';
import '../constants/textStyles.dart';

class HomeMap extends StatefulWidget {
  const HomeMap({super.key});

  @override
  State<HomeMap> createState() => _HomeMapState();
}

class _HomeMapState extends State<HomeMap> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorConst.mainColor,
        title: Text(
          "Homepage",
          style: TextStylesConst.appbarText,
        ),
      ),
      body: FlutterMap(
        options: const MapOptions(
          initialCenter: LatLng(23.6850, 90.3563), // Coordinates for London
          initialZoom: 7,
        ),
        children: [
          TileLayer(
            urlTemplate: 'https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png',
          ),
          MarkerLayer(markers: [
            Marker(
                point: const LatLng(23.6850, 90.3563),
                child: InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => MapDetails(district: "Name")));
                    },
                    child: const Icon(Icons.location_pin, color: Colors.red)))
          ])
        ],
      ),
    );
  }
}
