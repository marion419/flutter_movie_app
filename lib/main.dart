import 'package:flutter/material.dart';
import 'package:flutter_movie_app/ui/pages/home/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Movie App',
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.transparent,
        ),
        scaffoldBackgroundColor: Colors.black,
      ),
      home: HomePage(),
    );
  }
}
