import 'package:flutter/material.dart';
import 'package:trail_demo/Resources/route.dart';

class Home_Two extends StatelessWidget {
  const Home_Two({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Page 2"),
      ),
      body: Center(
        child: Column(
          children: [
            SizedBox(
              height: 30,
            ),
            ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, Routes.homeone);
                },
                child: Text("Home page Two")),
            SizedBox(
              height: 30,
            ),
            ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, Routes.hometwo);
                },
                child: Text("Home Page One"))
          ],
        ),
      ),
    );
  }
}
