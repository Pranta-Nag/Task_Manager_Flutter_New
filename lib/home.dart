import 'package:flutter/material.dart';
import 'package:taskmanager/screens/splash_screen.dart';
import 'package:taskmanager/widgets/app_color.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const SplashScreen(),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
         inputDecorationTheme: const InputDecorationTheme(
          filled: true,
          fillColor: Colors.white,

          hintStyle: TextStyle(
            color: Colors.grey
          ),

          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide.none
          ),

          border: OutlineInputBorder(
              borderSide: BorderSide.none
          ),

        ),

        filledButtonTheme: FilledButtonThemeData(
          style: FilledButton.styleFrom(
            backgroundColor: AppColor.primaryColor,
                fixedSize: const Size.fromWidth(double.maxFinite),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8)
            )
          )
        ),

        textTheme: const TextTheme(
          titleLarge: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 28,
          ),
        ),
      ),
    );
  }
}