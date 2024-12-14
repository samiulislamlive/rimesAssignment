class ForecastModel {
  ForecastModel({
    required this.status,
    required this.message,
    required this.result,
  });
  late final bool status;
  late final String message;
  late final List<Result> result;

  ForecastModel.fromJson(Map<String, dynamic> json){
    status = json['status'];
    message = json['message'];
    result = List.from(json['result']).map((e)=>Result.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['status'] = status;
    _data['message'] = message;
    _data['result'] = result.map((e)=>e.toJson()).toList();
    return _data;
  }
}

class Result {
  Result({
    required this.stepStart,
    required this.stepEnd,
    required this.date,
    required this.weekday,
    required this.rfUnit,
    required this.tempUnit,
    required this.rhUnit,
    required this.windspdUnit,
    required this.winddirUnit,
    required this.cldcvrUnit,
    required this.windgustUnit,
    required this.icon,
    required this.type,
    required this.rf,
    required this.temp,
    required this.rh,
    required this.windspd,
    required this.winddir,
    required this.cldcvr,
    required this.windgust,
  });
  late final String stepStart;
  late final String stepEnd;
  late final String date;
  late final String weekday;
  late final String rfUnit;
  late final String tempUnit;
  late final String rhUnit;
  late final String windspdUnit;
  late final String winddirUnit;
  late final String cldcvrUnit;
  late final String windgustUnit;
  late final String icon;
  late final String type;
  late final Rf rf;
  late final Temp temp;
  late final Rh rh;
  late final Windspd windspd;
  late final Winddir winddir;
  late final Cldcvr cldcvr;
  late final Windgust windgust;

  Result.fromJson(Map<String, dynamic> json){
    stepStart = json['step_start'];
    stepEnd = json['step_end'];
    date = json['date'];
    weekday = json['weekday'];
    rfUnit = json['rf_unit'];
    tempUnit = json['temp_unit'];
    rhUnit = json['rh_unit'];
    windspdUnit = json['windspd_unit'];
    winddirUnit = json['winddir_unit'];
    cldcvrUnit = json['cldcvr_unit'];
    windgustUnit = json['windgust_unit'];
    icon = json['icon'];
    type = json['type'];
    rf = Rf.fromJson(json['rf']);
    temp = Temp.fromJson(json['temp']);
    rh = Rh.fromJson(json['rh']);
    windspd = Windspd.fromJson(json['windspd']);
    winddir = Winddir.fromJson(json['winddir']);
    cldcvr = Cldcvr.fromJson(json['cldcvr']);
    windgust = Windgust.fromJson(json['windgust']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['step_start'] = stepStart;
    _data['step_end'] = stepEnd;
    _data['date'] = date;
    _data['weekday'] = weekday;
    _data['rf_unit'] = rfUnit;
    _data['temp_unit'] = tempUnit;
    _data['rh_unit'] = rhUnit;
    _data['windspd_unit'] = windspdUnit;
    _data['winddir_unit'] = winddirUnit;
    _data['cldcvr_unit'] = cldcvrUnit;
    _data['windgust_unit'] = windgustUnit;
    _data['icon'] = icon;
    _data['type'] = type;
    _data['rf'] = rf.toJson();
    _data['temp'] = temp.toJson();
    _data['rh'] = rh.toJson();
    _data['windspd'] = windspd.toJson();
    _data['winddir'] = winddir.toJson();
    _data['cldcvr'] = cldcvr.toJson();
    _data['windgust'] = windgust.toJson();
    return _data;
  }
}

class Rf {
  Rf({
    required this.valMin,
    required this.valAvg,
    required this.valMax,
  });
  late var valMin;
  late var valAvg;
  late var valMax;

  Rf.fromJson(Map<String, dynamic> json){
    valMin = json['val_min'];
    valAvg = json['val_avg'];
    valMax = json['val_max'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['val_min'] = valMin;
    _data['val_avg'] = valAvg;
    _data['val_max'] = valMax;
    return _data;
  }
}

class Temp {
  Temp({
    required this.valMin,
    required this.valAvg,
    required this.valMax,
  });
  late var valMin;
  late var valAvg;
  late var valMax;

  Temp.fromJson(Map<String, dynamic> json){
    valMin = json['val_min'];
    valAvg = json['val_avg'];
    valMax = json['val_max'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['val_min'] = valMin;
    _data['val_avg'] = valAvg;
    _data['val_max'] = valMax;
    return _data;
  }
}

class Rh {
  Rh({
    required this.valMin,
    required this.valAvg,
    required this.valMax,
  });
  late var valMin;
  late var valAvg;
  late var valMax;

  Rh.fromJson(Map<String, dynamic> json){
    valMin = json['val_min'];
    valAvg = json['val_avg'];
    valMax = json['val_max'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['val_min'] = valMin;
    _data['val_avg'] = valAvg;
    _data['val_max'] = valMax;
    return _data;
  }
}

class Windspd {
  Windspd({
    required this.valMin,
    required this.valAvg,
    required this.valMax,
  });
  late var valMin;
  late var valAvg;
  late var valMax;

  Windspd.fromJson(Map<String, dynamic> json){
    valMin = json['val_min'];
    valAvg = json['val_avg'];
    valMax = json['val_max'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['val_min'] = valMin;
    _data['val_avg'] = valAvg;
    _data['val_max'] = valMax;
    return _data;
  }
}

class Winddir {
  Winddir({
    required this.valMin,
    required this.valAvg,
    required this.valMax,
  });
  late var valMin;
  late var valAvg;
  late var valMax;

  Winddir.fromJson(Map<String, dynamic> json){
    valMin = json['val_min'];
    valAvg = json['val_avg'];
    valMax = json['val_max'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['val_min'] = valMin;
    _data['val_avg'] = valAvg;
    _data['val_max'] = valMax;
    return _data;
  }
}

class Cldcvr {
  Cldcvr({
    required this.valMin,
    required this.valAvg,
    required this.valMax,
  });
  late var valMin;
  late var valAvg;
  late var valMax;

  Cldcvr.fromJson(Map<String, dynamic> json){
    valMin = json['val_min'];
    valAvg = json['val_avg'];
    valMax = json['val_max'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['val_min'] = valMin;
    _data['val_avg'] = valAvg;
    _data['val_max'] = valMax;
    return _data;
  }
}

class Windgust {
  Windgust({
    required this.valMin,
    required this.valAvg,
    required this.valMax,
  });
  late var valMin;
  late var valAvg;
  late var valMax;

  Windgust.fromJson(Map<String, dynamic> json){
    valMin = json['val_min'];
    valAvg = json['val_avg'];
    valMax = json['val_max'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['val_min'] = valMin;
    _data['val_avg'] = valAvg;
    _data['val_max'] = valMax;
    return _data;
  }
}