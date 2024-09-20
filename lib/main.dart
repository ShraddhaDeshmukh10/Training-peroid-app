import 'package:flutter/material.dart';
import 'package:trail_demo/Resources/route.dart';
import 'package:trail_demo/View/home_one.dart';
import 'package:trail_demo/View/home_three.dart';
import 'package:trail_demo/View/home_two.dart';
import 'View/Parameterized_Route.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      initialRoute: Routes.homeone,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const Home_One(),
      debugShowCheckedModeBanner: false,
      routes: {
        Routes.homeone: (context) => const Home_One(),
        Routes.hometwo: (context) => const Home_Two(),
        // Routes.parameterizedroute: (context) =>
        //     const Parameterized_Route(text: "Hello I am Shraddha"),
        Routes.homethree: (context) => const Home_three(),
      },
      onGenerateRoute: (settings) {
        switch (settings.name) {
          case Routes.parameterizedroute:
            {
              final args = settings.arguments as String;
              return MaterialPageRoute(
                  builder: (context) => Parameterized_Route(text: args));
            }
          case Routes.homeone:
            return MaterialPageRoute(builder: (context) => const Home_One());
          case Routes.hometwo:
            return MaterialPageRoute(builder: (context) => const Home_Two());
          default:
            return MaterialPageRoute(builder: (context) => const Home_One());
        }
      },
    );
  }
}
