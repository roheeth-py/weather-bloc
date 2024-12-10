
import 'package:weather_app/features/home/data/data.dart';

import '../../../models/five_weather_data_model.dart';

class Converter{
  static List<ListElement> dailyDataList(List<ListElement>? list){
    List<ListElement> dailyForecasts = [];
    Set<String> dates = {};

    for(var forecast in list!){
      String date = forecast.dtTxt.toString().split(' ')[0];
      if(!dates.contains(date)){
        dailyForecasts.add(forecast);
        dates.add(date);
      }
    }
    return dailyForecasts;
  }
}