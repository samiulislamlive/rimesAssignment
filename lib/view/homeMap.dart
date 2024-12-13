import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:rimesassignment/models/alertModel.dart';
import 'package:rimesassignment/service/apiService.dart';
import 'package:rimesassignment/view/mapDetails.dart';
import '../constants/colorConst.dart';
import '../constants/mapData.dart';
import '../constants/textStyles.dart';
import '../models/shapeModel.dart';

class HomeMap extends StatefulWidget {
  const HomeMap({super.key});

  @override
  State<HomeMap> createState() => _HomeMapState();
}

class _HomeMapState extends State<HomeMap> {
  List<Polygon> polygons = [];
  bool isLoading = true;
  String errorMessage = '';
  List<Marker> markers = [];

  LatLng calculateCentroid(List<LatLng> polygonCoordinates) {
    double sumLat = 0;
    double sumLng = 0;

    for (var point in polygonCoordinates) {
      sumLat += point.latitude;
      sumLng += point.longitude;
    }

    double centroidLat = sumLat / polygonCoordinates.length;
    double centroidLng = sumLng / polygonCoordinates.length;

    return LatLng(centroidLat, centroidLng);
  }

  Future<void> fetchData() async {
    try {
      ApiService apiService = ApiService();
      ShapeModel shapeData = await apiService.fetchPolygons();
      AlertModel alertData = await apiService.fetchAlertData();
      List<Polygon> fetchedPolygons = [];
      Set<String> addedDistricts = Set<String>();

      if (shapeData.result != null) {
        for (var feature in shapeData.result!.features) {
          var coordinates = feature.geometry!.coordinates;

          if (coordinates.isNotEmpty) {
            var polygonCoordinates = coordinates[0].map<LatLng>((coordList) {
              return LatLng(coordList[1], coordList[0]);
            }).toList();

            String? admin3Pcod = feature.properties?.admin3Pcod;
            Result1 matchingAlert = alertData.result.firstWhere(
                  (alert) => alert.adm3Pcode.toString() == admin3Pcod,
              orElse: () => Result1(
                parameterId: 0,
                upazilaId: 0,
                adm3Pcode: 0,
                adm2Pcode: 0,
                district: "",
                name: "",
                forecastDate: DateTime.now(),
                stepStart: DateTime.now(),
                stepEnd: DateTime.now(),
                valMin: 0.0,
                valAvg: 0.0,
                valMax: 0.0,
              ),
            );

            Color fillColor = Colors.transparent;
            double valMin = matchingAlert.valMin ?? 0.0;

            // Set color based on alert values (same logic as before)
            if (valMin > 10) {
              fillColor = ColorConst.noAlert;
            } else if (valMin > 8 && valMin < 10) {
              fillColor = ColorConst.mild;
            } else if (valMin > 6 && valMin < 8) {
              fillColor = ColorConst.moderate;
            } else if (valMin > 4 && valMin < 6) {
              fillColor = ColorConst.seavere;
            } else if (valMin < 4) {
              fillColor = ColorConst.extreme;
            }

            fetchedPolygons.add(
              Polygon(
                points: polygonCoordinates,
                borderColor: Colors.black,
                borderStrokeWidth: 2,
                disableHolesBorder: true,
                // isFilled: true,
                color: fillColor,
              ),
            );

            // Calculate the centroid for placing the district name
            LatLng centroid = calculateCentroid(polygonCoordinates);

            // Add a marker with the district name at the centroid
            if (matchingAlert.district != null && !addedDistricts.contains(matchingAlert.district!)) {
              // Add the district name to the set to prevent duplicates
              addedDistricts.add(matchingAlert.district!);

              // Add a marker with the district name at the centroid
              markers.add(
                Marker(
                  point: centroid,
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => MapDetails(
                            district: matchingAlert.district ?? 'No District',
                            name: matchingAlert.name ?? 'No Name',
                            upazilaId: matchingAlert.upazilaId ?? 0,
                          ),
                        ),
                      );
                    },
                    child: Text(
                      matchingAlert.district ?? 'No District',
                      style: TextStyle(color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 6,
                      ),
                      maxLines: 1,
                      softWrap: false,
                    ),
                  ),
                ),
              );
            }
          }
        }
      }

      // Update the state to reflect the fetched polygons and markers
      setState(() {
        polygons = fetchedPolygons;
        isLoading = false;
      });
    } catch (e) {
      setState(() {
        errorMessage = 'Failed to load data: $e';
        isLoading = false;
      });
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchData();
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
      body: isLoading
          ? Center(
              child: CircularProgressIndicator(
              color: ColorConst.mainColor,
            )) // Show loading indicator
          : errorMessage.isNotEmpty
              ? Center(child: Text(errorMessage)) // Show error message
              : FlutterMap(
                  options: MapOptions(
                    initialCenter:
                        MapData.bangladeshLatLng, // Coordinates for London
                    initialZoom: 7.4,
                  ),
                  children: [
                    TileLayer(
                      urlTemplate:
                          'https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png',
                    ),
                    // MarkerLayer(markers: [
                    //   Marker(
                    //       point: const LatLng(23.6850, 90.3563),
                    //       child: InkWell(
                    //           onTap: () {
                    //             Navigator.push(
                    //                 context,
                    //                 MaterialPageRoute(
                    //                     builder: (context) =>
                    //                         MapDetails(district: "Name")));
                    //           },
                    //           child: const Icon(Icons.location_pin,
                    //               color: Colors.red)))
                    // ]),
                    PolygonLayer(
                      polygons: polygons,
                    ),
                    MarkerLayer(markers: markers),
                  ],
                ),
    );
  }
}
