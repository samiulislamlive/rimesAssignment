class AlertModel {
  AlertModel({
    required this.status,
    required this.message,
    required this.result,
  });

  final bool? status;
  final String? message;
  final List<Result1> result;

  factory AlertModel.fromJson(Map<String, dynamic> json) {
    return AlertModel(
      status: json["status"],
      message: json["message"],
      result: json["result"] == null
          ? []
          : List<Result1>.from(json["result"]!.map((x) => Result1.fromJson(x))),
    );
  }
}

class Result1 {
  final int? parameterId;
  final int? upazilaId;
  final int? adm3Pcode;
  final int? adm2Pcode;
  final String? district;
  final String? name;
  final DateTime? forecastDate;
  final DateTime? stepStart;
  final DateTime? stepEnd;
  final double? valMin;
  final double? valAvg;
  final double? valMax;

  Result1({
    required this.parameterId,
    required this.upazilaId,
    required this.adm3Pcode,
    required this.adm2Pcode,
    required this.district,
    required this.name,
    required this.forecastDate,
    required this.stepStart,
    required this.stepEnd,
    required this.valMin,
    required this.valAvg,
    required this.valMax,
  });

  factory Result1.fromJson(Map<String, dynamic> json) {
    return Result1(
      parameterId: json["parameter_id"],
      upazilaId: json["upazila_id"],
      adm3Pcode: json["adm3_pcode"],
      adm2Pcode: json["adm2_pcode"],
      district: json["district"],
      name: json["name"],
      forecastDate: DateTime.tryParse(json["forecast_date"] ?? ""),
      stepStart: DateTime.tryParse(json["step_start"] ?? ""),
      stepEnd: DateTime.tryParse(json["step_end"] ?? ""),
      // Convert valMin, valAvg, valMax to double if they are int
      valMin: (json["val_min"] is int)
          ? (json["val_min"] as int).toDouble()
          : json["val_min"].toDouble(),
      valAvg: (json["val_avg"] is int)
          ? (json["val_avg"] as int).toDouble()
          : json["val_avg"].toDouble(),
      valMax: (json["val_max"] is int)
          ? (json["val_max"] as int).toDouble()
          : json["val_max"].toDouble(),
    );
  }
}
