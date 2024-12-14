
import '../models/alertModel.dart';
import '../models/forecastModel.dart';
import '../models/shapeModel.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  Future<ShapeModel> fetchPolygons() async {
    final response = await http.get(Uri.parse('https://bamisapp.bdservers.site/api/exam/shape'));

    if (response.statusCode == 200) {
      print("getting shapedata ${response.body}");
      return ShapeModel.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load data');
    }
  }


  Future<AlertModel> fetchAlertData() async {
    final response = await http.get(Uri.parse('https://bamisapp.bdservers.site/api/exam/alert'));

    if (response.statusCode == 200) {
      return AlertModel.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load alert data');
    }
  }


  Future<ForecastModel> fetchForecastData(int id) async {
    final response = await http.get(Uri.parse('https://bamisapp.bdservers.site/api/exam/forecast?upazila_id=$id'));

    if (response.statusCode == 200) {
      return ForecastModel.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load data');
    }
  }
}