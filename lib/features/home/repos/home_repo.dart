import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:weather_app/models/five_weather_data_model.dart';
import 'package:weather_app/models/weather_data_model.dart';

import '../../../constants.dart';

class HomeRepo {
  static Future<WeatherDataModel> fetchCurrentData(double lat, double lon) async {
    var client = http.Client();
    try {
      Uri uri = Uri.parse(
        "https://api.openweathermap.org/data/2.5/weather?lat=$lat&lon=$lon&appid=$apiKey&units=metric",
      );
      var response = await client.get(uri);
      if (response.statusCode == 200) {
        Map<String, dynamic> result = jsonDecode(response.body);
        return WeatherDataModel.fromJson(result);
      } else {
        throw ('Request failed with status: ${response.statusCode}');
      }
    } catch (e) {
      log(e.toString());
      throw Exception('Error fetching weather data: $e');
    } finally {
      client.close();
    }
  }

  static Future<FiveDayWeatherData> fetchFiveDayData(double lat, double lon) async {
    var client = http.Client();
    try{
      Uri url = Uri.parse("https://api.openweathermap.org/data/2.5/forecast?lat=$lat&lon=$lon&appid=$apiKey&units=metric");
      var response = await client.get(url);
      if(response.statusCode == 200){
        Map<String, dynamic> result = jsonDecode(response.body);
        return FiveDayWeatherData.fromJson(result);
      } else {
        throw ('Request failed with status: ${response.statusCode}');
      }
  }catch(e){
      throw(e.toString());
    }finally{
      client.close();
    }
  }
}
