import 'package:flutter/material.dart';
import 'package:trail_demo/Resources/route.dart';
import 'package:trail_demo/View/parameterized_route.dart';

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
        title: Text("Welcome to Page One"),
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: Column(
          children: [
            SizedBox(
              height: 30,
            ),
            ElevatedButton(
              child: Text("Home page 1"),
              onPressed: () {
                Navigator.pushNamed(context, Routes.homeone);
              },
            ),
            SizedBox(
              height: 30,
            ),
            ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, Routes.hometwo);
                },
                child: Text("Home Page 2")),
            SizedBox(
              height: 30,
            ),
            ElevatedButton(
                onPressed: () {
                  Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                          builder: (context) => Parameterized_Route()),
                      (route) => true);
                },
                child: Text("Parameterized Route"))
          ],
        ),
      ),
    );
  }
}
