import 'package:flutter/material.dart';
import 'package:news_api_internship_project/news.dart';
import 'package:news_api_internship_project/splash_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(routes: {
      '/': (context) => SplashScreen(),
      '/news': (context) => NewsPage()
    });
  }
}
