import 'package:flutter/material.dart';
import 'package:movies_app/core/services/servicesLocated.dart';
import 'package:movies_app/movies/presentation/screens/movies_screen.dart';
import 'package:movies_app/test.dart';

void main() {
  ServicesLocated().init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Movies App',
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: Colors.grey.shade800,
      ),
      home: const Test(),
    );
  }
}
