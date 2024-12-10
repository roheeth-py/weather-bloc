import 'dart:convert';

// WeatherDataModel from JSON
WeatherDataModel weatherDataModelFromJson(String str) =>
    WeatherDataModel.fromJson(json.decode(str));

String weatherDataModelToJson(WeatherDataModel data) =>
    json.encode(data.toJson());

class WeatherDataModel {
  Coord coord;
  List<Weather> weather;
  String base;
  Main main;
  int visibility;
  Wind wind;
  Clouds clouds;
  int dt;
  Sys sys;
  int timezone;
  int id;
  String name;
  int cod;

  WeatherDataModel({
    required this.coord,
    required this.weather,
    required this.base,
    required this.main,
    required this.visibility,
    required this.wind,
    required this.clouds,
    required this.dt,
    required this.sys,
    required this.timezone,
    required this.id,
    required this.name,
    required this.cod,
  });

  factory WeatherDataModel.fromJson(Map<String, dynamic> json) =>
      WeatherDataModel(
        coord: Coord.fromJson(json["coord"]),
        weather: List<Weather>.from(json["weather"].map((x) => Weather.fromJson(x))),
        base: json["base"] ?? '',
        main: Main.fromJson(json["main"]),
        visibility: json["visibility"] ?? 0,
        wind: Wind.fromJson(json["wind"]),
        clouds: Clouds.fromJson(json["clouds"]),
        dt: json["dt"] ?? 0,
        sys: Sys.fromJson(json["sys"]),
        timezone: json["timezone"] ?? 0,
        id: json["id"] ?? 0,
        name: json["name"] ?? '',
        cod: json["cod"] ?? 0,
      );

  Map<String, dynamic> toJson() => {
    "coord": coord.toJson(),
    "weather": List<dynamic>.from(weather.map((x) => x.toJson())),
    "base": base,
    "main": main.toJson(),
    "visibility": visibility,
    "wind": wind.toJson(),
    "clouds": clouds.toJson(),
    "dt": dt,
    "sys": sys.toJson(),
    "timezone": timezone,
    "id": id,
    "name": name,
    "cod": cod,
  };
}

class Clouds {
  int all;

  Clouds({
    required this.all,
  });

  factory Clouds.fromJson(Map<String, dynamic> json) => Clouds(
    all: json["all"] ?? 0, // Default to 0 if null
  );

  Map<String, dynamic> toJson() => {
    "all": all,
  };
}

class Coord {
  double lon;
  double lat;

  Coord({
    required this.lon,
    required this.lat,
  });

  factory Coord.fromJson(Map<String, dynamic> json) => Coord(
    lon: (json["lon"] ?? 0.0).toDouble(),
    lat: (json["lat"] ?? 0.0).toDouble(),
  );

  Map<String, dynamic> toJson() => {
    "lon": lon,
    "lat": lat,
  };
}

class Main {
  double temp;
  double feelsLike;
  double tempMin;
  double tempMax;
  int pressure;
  int humidity;
  int seaLevel;
  int grndLevel;

  Main({
    required this.temp,
    required this.feelsLike,
    required this.tempMin,
    required this.tempMax,
    required this.pressure,
    required this.humidity,
    required this.seaLevel,
    required this.grndLevel,
  });

  factory Main.fromJson(Map<String, dynamic> json) => Main(
    temp: (json["temp"] ?? 0.0).toDouble(),
    feelsLike: (json["feels_like"] ?? 0.0).toDouble(),
    tempMin: (json["temp_min"] ?? 0.0).toDouble(),
    tempMax: (json["temp_max"] ?? 0.0).toDouble(),
    pressure: json["pressure"] ?? 0,
    humidity: json["humidity"] ?? 0,
    seaLevel: json["sea_level"] ?? 0,
    grndLevel: json["grnd_level"] ?? 0,
  );

  Map<String, dynamic> toJson() => {
    "temp": temp,
    "feels_like": feelsLike,
    "temp_min": tempMin,
    "temp_max": tempMax,
    "pressure": pressure,
    "humidity": humidity,
    "sea_level": seaLevel,
    "grnd_level": grndLevel,
  };
}

class Sys {
  int type;
  int id;
  String country;
  int sunrise;
  int sunset;

  Sys({
    required this.type,
    required this.id,
    required this.country,
    required this.sunrise,
    required this.sunset,
  });

  factory Sys.fromJson(Map<String, dynamic> json) => Sys(
    type: json["type"] ?? 0,
    id: json["id"] ?? 0,
    country: json["country"] ?? '',
    sunrise: json["sunrise"] ?? 0,
    sunset: json["sunset"] ?? 0,
  );

  Map<String, dynamic> toJson() => {
    "type": type,
    "id": id,
    "country": country,
    "sunrise": sunrise,
    "sunset": sunset,
  };
}

class Weather {
  int id;
  String main;
  String description;
  String icon;

  Weather({
    required this.id,
    required this.main,
    required this.description,
    required this.icon,
  });

  factory Weather.fromJson(Map<String, dynamic> json) => Weather(
    id: json["id"] ?? 0,
    main: json["main"] ?? '',
    description: json["description"] ?? '',
    icon: json["icon"] ?? '',
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "main": main,
    "description": description,
    "icon": icon,
  };
}

class Wind {
  double speed;
  int deg;
  double gust;

  Wind({
    required this.speed,
    required this.deg,
    required this.gust,
  });

  factory Wind.fromJson(Map<String, dynamic> json) => Wind(
    speed: (json["speed"] ?? 0.0).toDouble(),
    deg: json["deg"] ?? 0,
    gust: (json["gust"] ?? 0.0).toDouble(),
  );

  Map<String, dynamic> toJson() => {
    "speed": speed,
    "deg": deg,
    "gust": gust,
  };
}
