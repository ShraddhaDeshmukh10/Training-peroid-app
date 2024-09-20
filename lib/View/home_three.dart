import 'package:flutter/material.dart';
import 'package:trail_demo/View/home_one.dart';

class Home_three extends StatelessWidget {
  const Home_three({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Welcome to Page 3"),
        backgroundColor: Colors.blue,
        centerTitle: true,
      ),
      body: Row(
        children: [
          IconButton(
            icon: Icon(Icons.flip_to_back_sharp),
            onPressed: () {
              Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => Home_One()),
                  (route) => false);
            },
          ),
          SizedBox(
            height: 30,
          ),
          Text("Click on Icon to Visit Page One")
        ],
      ),
    );
  }
}
