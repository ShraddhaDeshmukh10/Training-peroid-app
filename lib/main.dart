import 'package:flutter/material.dart';
import 'package:trail_demo/Resources/route.dart';
import 'package:trail_demo/View/ToDO_App/add_note.dart';
import 'package:trail_demo/View/ToDO_App/home_screen.dart';
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
      initialRoute: Routes.homescreen,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const HomeScreen(),
      debugShowCheckedModeBanner: false,
      routes: {
        Routes.homescreen: (context) => const HomeScreen(),
        Routes.addnote: (context) => const AddNote(),
        Routes.parameterizedroute: (context) => const Parameterized_Route(),
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
          case Routes.homescreen:
            return MaterialPageRoute(builder: (context) => const Home_One());
          case Routes.addnote:
            return MaterialPageRoute(builder: (context) => const Home_Two());
          default:
            return MaterialPageRoute(builder: (context) => const Home_One());
        }
      },
    );
  }
}
