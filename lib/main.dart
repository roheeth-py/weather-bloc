import "package:flutter/material.dart";
import "package:flutter/services.dart";
import "package:flutter_screenutil/flutter_screenutil.dart";
import "package:weather_app/theme/theme.dart";

import "features/home/ui/home_page.dart";

void main() {
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Color(0xFF1F1F1F),
      systemNavigationBarColor: Color(0xFF1F1F1F),
    ),
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(412, 917),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
          themeMode: ThemeMode.dark,
          theme: ThemeData().copyWith(
            iconTheme: const IconThemeData().copyWith(
              color: Colors.white,
            ),
            appBarTheme: const AppBarTheme().copyWith(
              scrolledUnderElevation: 0,
              backgroundColor: Color(0xFF1F1F1F),
            ),
            textTheme: CustomTheme.productSansTextTheme,
            colorScheme: ColorScheme.fromSeed(
              brightness: Brightness.dark,
              seedColor: const Color(0xFF1F1F1F),
            ),
            scaffoldBackgroundColor: const Color(0xFF1F1F1F),
          ),
          home: child,
        );
      },
      child: HomePage(),
    );
  }
}
