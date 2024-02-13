import 'package:exam_app/views/screens/home_page.dart';
import 'package:flutter/material.dart';
import 'package:exam_app/utils/route_utils.dart';
import 'package:exam_app/views/screens/detail_page.dart';
import 'package:exam_app/views/screens/home_page.dart';

void main() {
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        MyRoutes.homePage: (context) => const HomePage(),
        MyRoutes.detailPage: (context) => const DetailPage(),
      },
    );
  }
}