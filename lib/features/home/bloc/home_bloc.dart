import 'dart:async';
import 'package:geolocator/geolocator.dart';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:weather_app/features/home/data/data.dart';
import 'package:weather_app/features/home/repos/home_repo.dart';
import 'package:weather_app/features/home/services/converter.dart';
import 'package:weather_app/features/home/services/geo_locator.dart';
import 'package:weather_app/models/five_weather_data_model.dart';
import 'package:weather_app/models/weather_data_model.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitial()) {
    on<HomeInitialFetchEvent>(homeInitialFetchEvent);
    on<HomeOnChangedEvent>(homeOnChangedEvent);
  }

  Future<void> homeInitialFetchEvent(HomeInitialFetchEvent event, Emitter<HomeState> emit) async {
    Position gpsPosition = await GeoLocator.gpsPosition();
    WeatherDataModel currentData = await HomeRepo.fetchCurrentData(gpsPosition.latitude, gpsPosition.longitude);
    FiveDayWeatherData dailyData = await HomeRepo.fetchFiveDayData(gpsPosition.latitude, gpsPosition.longitude);
    fiveDayData = dailyData;
    List<ListElement> dailyDataList = Converter.dailyDataList(dailyData.list);
    var finalData = [currentData, ...dailyDataList.where((e){
      return e.dtTxt.toString().split(" ").first != DateTime.now().toString().split(" ").first;
    })];
    data.addAll(finalData);
    print(data);
    emit(HomeSuccessState(data: data[0], fiveDay: fiveDayData));
  }

  FutureOr<void> homeOnChangedEvent(HomeOnChangedEvent event, Emitter<HomeState> emit) {
    emit(HomeSuccessState(data: data[event.item], fiveDay: fiveDayData));
  }
}
