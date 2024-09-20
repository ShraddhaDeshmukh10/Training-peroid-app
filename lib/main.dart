import 'package:flutter/material.dart';
import 'package:trail_demo/Resources/route.dart';
import 'package:trail_demo/View/home_one.dart';
import 'package:trail_demo/View/home_three.dart';
import 'package:trail_demo/View/home_two.dart';
import 'package:trail_demo/View/parameterized_route.dart';
import 'package:toastification/toastification.dart';

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
      initialRoute: Routes.homeone,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: Home_One(),
      debugShowCheckedModeBanner: false,
      routes: {
        Routes.homeone: (context) => Home_One(),
        Routes.hometwo: (context) => Home_Two(),
        Routes.parameterizedroute: (context) => Parameterized_Route(),
        Routes.homethree: (context) => Home_three(),
      },
      onGenerateRoute: (settings) {
        switch (settings.name) {
          case Routes.parameterizedroute:
            toastification.show(
              context: context,
              title: Text('Hello, world!'),
              autoCloseDuration: const Duration(seconds: 5),
            );
          case Routes.homeone:
            return MaterialPageRoute(builder: (context) => Home_One());
          case Routes.hometwo:
            return MaterialPageRoute(builder: (context) => Home_Two());
          default:
            return MaterialPageRoute(builder: (context) => Home_One());
        }
      },
    );
  }
}
