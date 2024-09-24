import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:trail_demo/Resources/route.dart';

class Stack_Flexible extends StatefulWidget {
  const Stack_Flexible({super.key});

  @override
  State<Stack_Flexible> createState() => _Stack_FlexibleState();
}

class _Stack_FlexibleState extends State<Stack_Flexible> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
              width: double.infinity,
              height: 200,
              // decoration: BoxDecoration(
              //     image:
              //         DecorationImage(image: AssetImage("assets/mogra.jpg"))),
              child: Stack(
                children: [
                  Image.asset(
                    "assets/mogra.jpg",
                    fit: BoxFit.cover,
                  ),
                  Positioned(
                      top: 90,
                      left: 20,
                      child: Container(
                        child: Text("Container 1 with Stack- Click to Home"),
                        width: 100,
                        height: 80,
                        color: Colors.purple,
                      )),
                  Positioned(
                      top: 140,
                      left: 22,
                      child: IconButton(
                          onPressed: () {
                            Navigator.pushNamed(context, Routes.homescreen);
                          },
                          icon: Icon(Icons.home)))
                ],
              )),
          Flexible(
            flex: 2,
            child: Container(
              child: Text("flex 1- container 2"),
              color: Colors.orange.shade400,
            ),
          ),
          Flexible(
            flex: 1,
            child: Container(
              child: Text("flex 2- container 3"),
            ),
          ),
          Flexible(
            flex: 1,
            child: Container(
              child: Text("flex 2- container 4"),
              color: Colors.blue.shade900,
            ),
          ),
          Flexible(
            flex: 2,
            child: Container(
              child: Text("flex 1- container 5"),
              color: Colors.green,
            ),
          ),
        ],
      ),
    );
  }
}
