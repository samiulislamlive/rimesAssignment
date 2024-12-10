import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:rimesassignment/service/apiService.dart';
import 'package:rimesassignment/view/mapDetails.dart';
import '../constants/colorConst.dart';
import '../constants/mapData.dart';
import '../constants/textStyles.dart';
import '../models/alertModel.dart';
import '../models/shapeModel.dart';

class HomeMap extends StatefulWidget {
  const HomeMap({super.key});

  @override
  State<HomeMap> createState() => _HomeMapState();
}

class _HomeMapState extends State<HomeMap> {
  late Future<ShapeModel> _shapeData;
  late Future<AlertModel> _alertData;
  List<Polygon> polygons = [];
  bool isLoading = true;
  String errorMessage = '';

  Future<void> fetchData() async {
    try {
      // Fetch the data using the ApiService
      ApiService apiService = ApiService();
      ShapeModel shapeData = await apiService.fetchPolygons();
      List<Polygon> fetchedPolygons = [];

      // Ensure result is not null
      if (shapeData.result != null) {
        // Loop through the features in the result
        for (var feature in shapeData.result!.features) {
          // Get the coordinates of the geometry
          var coordinates = feature.geometry!.coordinates;

          // Ensure coordinates are available
          if (coordinates.isNotEmpty) {
            // Flatten the coordinate list and map to LatLng
            var polygonCoordinates = coordinates[0].map<LatLng>((coordList) {
              // coordList is a List of [longitude, latitude]
              // Return LatLng as [latitude, longitude]
              return LatLng(coordList[1], coordList[0]);
            }).toList();

            // Add the polygon to the list
            fetchedPolygons.add(
              Polygon(
                  points: polygonCoordinates,
                  borderColor: Colors.black,
                  borderStrokeWidth: 2,
                  disableHolesBorder: true,
                  isFilled: false),
            );
          }
        }
      }

      // Update the state to reflect the fetched polygons
      setState(() {
        polygons = fetchedPolygons; // Store the polygons to be used on the map
        isLoading = false;
      });
    } catch (e) {
      // Handle errors
      setState(() {
        errorMessage = 'Failed to load data: $e';
        print("Error: $errorMessage");
        isLoading = false;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    _shapeData = ApiService().fetchPolygons();
    _alertData = ApiService().fetchAlertData();
  }


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
      body: FutureBuilder<AlertModel>(
        future: _alertData,
        builder: (context, alertSnapshot) {
          if (alertSnapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }

          if (alertSnapshot.hasError) {
            return Center(child: Text('Error loading alert data'));
          }

          if (!alertSnapshot.hasData ||
              alertSnapshot.data?.result.isEmpty == true) {
            return Center(child: Text('No alert data available'));
          }

          // Once we have alert data, fetch and process the shape data
          return FutureBuilder<ShapeModel>(
            future: _shapeData,
            builder: (context, shapeSnapshot) {
              if (shapeSnapshot.connectionState == ConnectionState.waiting) {
                return Center(child: CircularProgressIndicator());
              }

              if (shapeSnapshot.hasError) {
                return Center(child: Text('Error loading shape data'));
              }

              if (!shapeSnapshot.hasData ||
                  shapeSnapshot.data?.result?.features.isEmpty == true) {
                return Center(child: Text('No shape data available'));
              }

              // Match the alert data with the shape data
              List<Polygon> polygons = [];

              for (var feature in shapeSnapshot.data!.result!.features) {
                var matchingAlert = alertSnapshot.data!.result.firstWhere(
                      (alert) => alert.adm3Pcode == feature.properties?.admin3Pcod,
                  orElse: () => Result1(
                    parameterId: 0, // Use default values
                    upazilaId: 0,
                    adm3Pcode: 0, // Default empty integer if adm3Pcode is nullable
                    adm2Pcode: 0,
                    district: '', // Default empty string
                    name: '',
                    forecastDate: DateTime.now(), // Default value
                    stepStart: DateTime.now(),
                    stepEnd: DateTime.now(),
                    valMin: 0.0, // Default value
                    valAvg: 0.0,
                    valMax: 0.0,
                  ),
                );


                if (matchingAlert != null && matchingAlert.valMin != null) {
                  var color = ColorConst.getPolygonColor(matchingAlert.valMin!);

                  // Convert coordinates to LatLng and add the polygon
                  polygons.add(Polygon(
                    points: feature.geometry!.coordinates
                        .map((coords) => LatLng(coords[0][0], coords[0][1]))
                        .toList(),
                    color: color
                        .withOpacity(0.5), // Make the color semi-transparent
                    borderColor: color,
                    borderStrokeWidth: 2,
                  ));
                }
              }

              // Display the map with polygons
              return FlutterMap(
                options: MapOptions(
                    initialCenter: LatLng(23.685, 90.3563), initialZoom: 7),
                children: [
                  TileLayer(
                    urlTemplate:
                        "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
                    subdomains: ['a', 'b', 'c'],
                  ),
                  PolygonLayer(polygons: polygons),
                ],
              );
            },
          );
        },
      ),
      // body: isLoading
      //     ? Center(child: CircularProgressIndicator(color: ColorConst.mainColor,)) // Show loading indicator
      //     : errorMessage.isNotEmpty
      //     ? Center(child: Text(errorMessage)) // Show error message
      //     : FlutterMap(
      //   options: MapOptions(
      //     initialCenter: MapData.bangladeshLatLng, // Coordinates for London
      //     initialZoom: 7.1,
      //   ),
      //   children: [
      //     TileLayer(
      //       urlTemplate: 'https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png',
      //     ),
      //     MarkerLayer(markers: [
      //       Marker(
      //           point: const LatLng(23.6850, 90.3563),
      //           child: InkWell(
      //               onTap: () {
      //                 Navigator.push(
      //                     context,
      //                     MaterialPageRoute(
      //                         builder: (context) => MapDetails(district: "Name")));
      //               },
      //               child: const Icon(Icons.location_pin, color: Colors.red)))
      //     ]),
      //     PolygonLayer(
      //       polygons: polygons,
      //     ),
      //   ],
      // ),
    );
  }
}
