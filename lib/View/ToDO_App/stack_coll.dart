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
              child: Stack(
                children: [
                  Image.network(
                    "https://rukminim2.flixcart.com/image/850/1000/xif0q/plant-sapling/i/m/f/annual-no-yes-jasmine-mogra-plant-1-plastic-bag-farmplants-original-imaggechxjqgcarz.jpeg?q=90&crop=false",
                    fit: BoxFit.cover,
                  ),
                  Positioned(
                      top: 90,
                      left: 20,
                      child: Container(
                        width: 50,
                        height: 50,
                        color: Colors.purple,
                      )),
                  Positioned(
                      top: 92,
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
              color: Colors.orange.shade400,
            ),
          ),
          Flexible(
            flex: 1,
            child: Container(
              color: Colors.white,
            ),
          ),
          Flexible(
            flex: 1,
            child: Container(
              color: Colors.blue.shade900,
            ),
          ),
          Flexible(
            flex: 2,
            child: Container(
              color: Colors.green,
            ),
          ),
        ],
      ),
    );
  }
}
