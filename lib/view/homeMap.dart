import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
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
                isFilled: false
              ),
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
          ? Center(child: CircularProgressIndicator(color: ColorConst.mainColor,)) // Show loading indicator
          : errorMessage.isNotEmpty
          ? Center(child: Text(errorMessage)) // Show error message
          : FlutterMap(
        options: MapOptions(
          initialCenter: MapData.bangladeshLatLng, // Coordinates for London
          initialZoom: 7.1,
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
          ]),
          PolygonLayer(
            polygons: polygons,
          ),
        ],
      ),
    );
  }
}
