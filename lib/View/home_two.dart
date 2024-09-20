import 'package:flutter/material.dart';
import 'package:trail_demo/Resources/route.dart';
import 'package:trail_demo/View/home_three.dart';

class Home_Two extends StatelessWidget {
  const Home_Two({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text("Welcome to Page 2"),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, Routes.hometwo);
              },
              child: const Text("Home Page Two"),
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, Routes.homeone);
              },
              child: const Text("Home Page One"),
            ),
            const SizedBox(height: 30),
            IconButton(
              icon: const Icon(Icons.flip_to_back_sharp),
              onPressed: () {
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => const Home_three()),
                  (route) => false,
                );
              },
            ),
            const SizedBox(height: 30),
            const Text("Click on Icon to Visit Page Three-03"),
          ],
        ),
      ),
    );
  }
}
