
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
}