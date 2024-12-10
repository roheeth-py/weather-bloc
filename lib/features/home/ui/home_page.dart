import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:weather_icons/weather_icons.dart';
import 'package:intl/intl.dart';
import 'package:weather_app/features/home/bloc/home_bloc.dart';
import 'package:weather_app/features/home/data/data.dart';
import 'package:weather_app/features/home/services/geo_locator.dart';
import 'package:weather_app/models/five_weather_data_model.dart';
import 'package:weather_app/models/weather_data_model.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  HomeBloc home = HomeBloc();
  @override
  void initState() {
    // TODO: implement initState
    home.add(HomeInitialFetchEvent(0));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeBloc, HomeState>(
      bloc: home,
      listener: (ctx, state) {},
      builder: (ctx, state) {
        switch (state) {
          case HomeInitial():
            return const Scaffold(
              body: Center(
                child: CircularProgressIndicator(),
              ),
            );
          case HomeSuccessState():
              HomeSuccessState currentState = state;
              var currentData;
              int dataNum = data.indexOf(currentState.data);
              print(dataNum);
              if(dataNum == 0){
                currentData = currentState.data as WeatherDataModel;
              }else{
                currentData = currentState.data as ListElement;
              }
              return Scaffold(
                appBar: AppBar(
                  centerTitle: true,
                  scrolledUnderElevation: 0.0,
                  title: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        "Current Location",
                        style: TextStyle(
                          fontSize: Theme.of(context)
                              .textTheme
                              .bodySmall!
                              .fontSize!
                              .sp,
                        ),
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ShaderMask(
                            shaderCallback: (Rect bounds) {
                              return const LinearGradient(
                                colors: [Color(0xFFDD62E6), Color(0xFF3763F2)],
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                              ).createShader(bounds);
                            },
                            blendMode: BlendMode.srcIn,
                            child: const Icon(
                              Icons.add_location_alt_outlined,
                            ),
                          ),
                          Text((currentState is WeatherDataModel)?
                              "${(currentData).name.toString()}, ${(currentData).sys.country}": "${state.fiveDay!.city!.name}, ${state.fiveDay!.city!.country}"),
                        ],
                      ),
                    ],
                  ),
                ),
                body: Column(
                  children: [
                    Container(
                      height: 90.h,
                      width: double.infinity,
                      padding: EdgeInsets.symmetric(
                          horizontal: 10.w, vertical: 20.h),
                      child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: data.length,
                          itemBuilder: (context, item) {
                            return Padding(
                              padding: EdgeInsets.symmetric(horizontal: 5.w),
                              child: InkWell(
                                borderRadius: BorderRadius.circular(30.h),
                                onTap: () {
                                  home.add(HomeOnChangedEvent(item));
                                },
                                child: Container(
                                  height: 50.h,
                                  width: 100.w,
                                  decoration: BoxDecoration(
                                    gradient:(data.indexOf(currentState)==item)? LinearGradient(
                                      colors: [
                                        Color(0xffF962E4),
                                        Color(0xff3063F3)
                                      ],
                                    ):null,
                                    borderRadius: BorderRadius.circular(30.r),
                                  ),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(DateFormat("EEEE")
                                          .format((item==0)?DateTime.now():(data[item] as ListElement).dtTxt!)),
                                      Text(
                                        DateFormat("dd/MM").format((item==0)?DateTime.now():(data[item] as ListElement).dtTxt!),
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodySmall!
                                            .copyWith(fontSize: 12),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          }),
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(
                        horizontal: 20.w,
                      ),
                      padding: EdgeInsets.only(left: 0.w, right: 45.w),
                      clipBehavior: Clip.hardEdge,
                      width: double.infinity,
                      height: 210.h,
                      decoration: BoxDecoration(
                        image: const DecorationImage(
                            image: AssetImage("asset/grain.png"),
                            fit: BoxFit.fill),
                        borderRadius: BorderRadius.all(Radius.circular(30.r)),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Container(
                              height: 150.h,
                              width: 150.w,
                              child: Image.asset("asset/icon/09d.png")),
                          Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text((currentState is WeatherDataModel)?
                                (currentState as WeatherDataModel).weather[0].main : "${(currentState as ListElement).weather![0].main}",
                                style: Theme.of(context).textTheme.bodyLarge,
                              ),
                              Text((currentState is WeatherDataModel)?
                                "${(currentState as WeatherDataModel).main.temp.toStringAsFixed(0)}°": "${(currentState as ListElement).main!.temp}°",
                                style: Theme.of(context).textTheme.displayLarge,
                              ),
                              10.verticalSpace,
                              Text(
                                "Feels Like: ${currentState.main.feelsLike.toStringAsFixed(0)}°",
                                style: Theme.of(context).textTheme.bodyMedium,
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                    Container(
                      height: 320.h,
                      width: double.infinity,
                      margin: EdgeInsets.symmetric(
                          horizontal: 20.w, vertical: 20.h),
                      padding: EdgeInsets.symmetric(vertical: 30.h),
                      decoration: BoxDecoration(
                        color: const Color(0xFF282828),
                        borderRadius: BorderRadius.circular(30.r),
                      ),
                      child: GridView(
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                                 crossAxisCount: 3),
                        children: [
                          weatherDetail(WeatherIcons.day_cloudy,
                              "${currentState.main.feelsLike}", "Feels Like"),
                          weatherDetail(WeatherIcons.fog,
                              "${currentState.main.tempMin}", "Min Temp"),
                          weatherDetail(WeatherIcons.hot,
                              "${currentState.main.tempMax}", "Max Temp"),
                          weatherDetail(WeatherIcons.humidity,
                              "${currentState.main.humidity}", "Humidity"),
                          weatherDetail(WeatherIcons.wind,
                              "${currentState.wind.speed}", "Wind"),
                          weatherDetail(WeatherIcons.cloudy,
                              "${currentState.clouds.all}", "Clouds"),
                        ],
                      ),
                    ),
                    Container(
                      height: 100.h,
                      width: double.infinity,
                      padding: EdgeInsets.symmetric(horizontal: 20.w),
                      margin: EdgeInsets.symmetric(horizontal: 20.w),
                      decoration: BoxDecoration(
                        color: const Color(0xFF282828),
                        borderRadius: BorderRadius.circular(30.r),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "${DateTime.fromMillisecondsSinceEpoch(currentState.sys.sunrise * 1000, isUtc: true).toLocal().hour.toString().padLeft(2, "0")}:${DateTime.fromMillisecondsSinceEpoch(currentState.sys.sunrise * 1000, isUtc: true).toLocal().minute.toString().padLeft(2, "0")}",
                              ),
                              Text(
                                "Sunrise",
                                style: Theme.of(context).textTheme.bodySmall,
                              ),
                            ],
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "${DateTime.fromMillisecondsSinceEpoch(currentState.sys.sunset * 1000, isUtc: true).toLocal().hour.toString().padLeft(2, "0")}:${DateTime.fromMillisecondsSinceEpoch(currentState.sys.sunset * 1000, isUtc: true).toLocal().minute.toString().padLeft(2, "0")}",
                              ),
                              Text(
                                "Sunrise",
                                style: Theme.of(context).textTheme.bodySmall,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
          case HomeErrorState():
            // TODO: Handle this case.
            return Container();
          default:
            return Container();
        }
      },
    );
  }

  Widget weatherDetail(IconData icon, String value, String desc) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(icon),
        10.verticalSpace,
        Text(value),
        Text(desc),
      ],
    );
  }
}
