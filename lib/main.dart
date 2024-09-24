import 'package:flutter/material.dart';
import 'package:trail_demo/Resources/route.dart';
import 'package:trail_demo/View/ToDO_App/add_note.dart';
import 'package:trail_demo/View/ToDO_App/home_screen.dart';
import 'package:trail_demo/View/ToDO_App/stack_coll.dart';
import 'package:trail_demo/View/ToDO_App/user_details.dart';

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
        //Routes.stackflexible: (context) => const Stack_flexible(),
        Routes.userform: (context) => const User_Details_Feedbackform(),
        Routes.stackcollection: (context) => Stack_Flexible()
      },
      // onGenerateRoute: (settings) {
      //   switch (settings.name) {
      //     case Routes.stackflexible:
      //       {
      //         final args = settings.arguments as String;
      //         return MaterialPageRoute(
      //             builder: (context) => Parameterized_Route(text: args));
      //       }
      //     case Routes.homescreen:
      //       return MaterialPageRoute(builder: (context) => const Home_One());
      //     case Routes.addnote:
      //       return MaterialPageRoute(builder: (context) => const Home_Two());
      //     default:
      //       return MaterialPageRoute(builder: (context) => const Home_One());
      //   }
      // },
    );
  }
}
