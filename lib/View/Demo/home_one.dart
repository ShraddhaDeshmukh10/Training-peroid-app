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
                    context, Routes.homescreen, (route) => false);
              },
              child: const Text("Home Page 1"),
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, Routes.addnote);
              },
              child: const Text("Home Page 2"),
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: () {
                // Navigator.pushNamedAndRemoveUntil(
                //     context,
                //     Routes.stackflexible,
                //     arguments:
                //         "Hello , I am Shraddha. Passed this through Argument",
                //     (route) => false);
                Navigator.pushNamed(context, Routes.stackflexible);
              },
              child: const Text("Parameterized Route"),
            ),
          ],
        ),
      ),
    );
  }
}
