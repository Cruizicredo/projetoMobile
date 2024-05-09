import 'package:flutter/material.dart';
import 'pages/login_page.dart';
import 'pages/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'LuS',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFFBADBC0)),
        scaffoldBackgroundColor: const Color(0xFFBADBC0), //Colors.white10,
      ),
      //home: const MyHomePage(title: 'Início'),
      home: const Scaffold(
        body: LogInPage(),
      ),
    );
  }
}
