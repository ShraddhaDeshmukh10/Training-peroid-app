import 'package:flutter/material.dart';
import 'package:trail_demo/Resources/route.dart';

class Home_One extends StatefulWidget {
  const Home_One({super.key});

  @override
  State<Home_One> createState() => _Home_OneState();
}

class _Home_OneState extends State<Home_One> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Welcome to Page One"),
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamedAndRemoveUntil(
                    context, Routes.homeone, (route) => false);
              },
              child: const Text("Home Page 1"),
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, Routes.hometwo);
              },
              child: const Text("Home Page 2"),
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamedAndRemoveUntil(
                    context,
                    Routes.parameterizedroute,
                    arguments:
                        "Hello , I am Shraddha. Passed this through Argument",
                    (route) => false);
              },
              child: const Text("Parameterized Route"),
            ),
          ],
        ),
      ),
    );
  }
}
