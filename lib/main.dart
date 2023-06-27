import 'package:ebook/routes.dart';
import 'package:ebook/screen/home_page/homePage.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: Colors.white,
        fontFamily: "San Serif"
      ),
      debugShowCheckedModeBanner: false,
      routes: routes,
      initialRoute: HomePage.route,
    );
  }
}


