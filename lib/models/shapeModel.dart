class ShapeModel {
  final bool? status;
  final String? message;
  final Result? result;

  ShapeModel({
    required this.status,
    required this.message,
    required this.result,
  });

  factory ShapeModel.fromJson(Map<String, dynamic> json) {
    return ShapeModel(
      status: json["status"],
      message: json["message"],
      result: json["result"] == null ? null : Result.fromJson(json["result"]),
    );
  }
}

class Result {
  final String? type;
  final List<Feature> features;

  Result({
    required this.type,
    required this.features,
  });

  factory Result.fromJson(Map<String, dynamic> json) {
    return Result(
      type: json["type"],
      features: json["features"] == null
          ? []
          : List<Feature>.from(
          json["features"]!.map((x) => Feature.fromJson(x))),
    );
  }
}

class Feature {
  final String? type;
  final Geometry? geometry;
  final Properties? properties;

  Feature({
    required this.type,
    required this.geometry,
    required this.properties,
  });

  factory Feature.fromJson(Map<String, dynamic> json) {
    return Feature(
      type: json["type"],
      geometry: json["geometry"] == null
          ? null
          : Geometry.fromJson(json["geometry"]),
      properties: json["properties"] == null
          ? null
          : Properties.fromJson(json["properties"]),
    );
  }
}

class Geometry {
  final String? type;
  final List<List<List<double>>> coordinates;

  Geometry({
    required this.type,
    required this.coordinates,
  });

  factory Geometry.fromJson(Map<String, dynamic> json) {
    return Geometry(
      type: json["type"],
      coordinates: json["coordinates"] == null
          ? []
          : List<List<List<double>>>.from(
        json["coordinates"]!.map((x) => List<List<double>>.from(
          x.map((y) => List<double>.from(
            y.map((z) => z is num ? z.toDouble() : 0.0),
          )),
        )),
      ),
    );
  }
}

class Properties {
  final String? admin3Pcod;
  final String? admin3Name;

  Properties({
    required this.admin3Pcod,
    required this.admin3Name,
  });

  factory Properties.fromJson(Map<String, dynamic> json) {
    return Properties(
      admin3Pcod: json["admin3Pcod"],
      admin3Name: json["admin3Name"],
    );
  }
}
