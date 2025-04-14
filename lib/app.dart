import 'package:flutter/material.dart';
import 'package:movieku/screens/main_screen.dart';
import 'package:movieku/utils/themes.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Movieku',
      theme: ThemeData(
        primaryColor: Themes.primaryColor,
        scaffoldBackgroundColor: Themes.primaryColor,
        appBarTheme: AppBarTheme(
          elevation: 0,
          backgroundColor: Themes.primaryColor,
          scrolledUnderElevation: 0,
          titleTextStyle: Themes.baseTextStyle.copyWith(
            color: Themes.whiteColor,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
          iconTheme: IconThemeData(color: Themes.whiteColor),
        ),
      ),
      home: const MainScreen(),
    );
  }
}
