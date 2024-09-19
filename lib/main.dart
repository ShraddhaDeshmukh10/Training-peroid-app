import 'package:flutter/material.dart';
import 'package:trail_demo/Resources/route.dart';
import 'package:trail_demo/View/home%20one.dart';
import 'package:trail_demo/View/home%20two.dart';

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
      initialRoute: '/',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: Home_One(),
      debugShowCheckedModeBanner: false,
      routes: {
        Routes.homeone: (context) => Home_One(),
        Routes.hometwo: (context) => Home_Two(),
      },
    );
  }
}
