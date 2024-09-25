import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:trail_demo/Resources/route.dart';

class Stack_Flexible extends StatefulWidget {
  const Stack_Flexible({super.key});

  @override
  State<Stack_Flexible> createState() => _Stack_FlexibleState();
}

class _Stack_FlexibleState extends State<Stack_Flexible> {
  int count = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Example of Stack, flexile...."),
        backgroundColor: Colors.blue.shade500,
        actions: [
          Stack(alignment: Alignment.topRight, children: [
            IconButton(
                tooltip: "Click to add count",
                onPressed: () {
                  setState(() {
                    count++;
                  });
                },
                icon: Icon(Icons.shopping_cart)),
            CircleAvatar(
              radius: 9,
              child: Text(
                '$count',
                style: TextStyle(fontSize: 12),
              ),
            )
          ])
        ],
      ),
      body: Container(
        width: double.infinity,
        child: Column(
          children: [
            Container(
                alignment: Alignment.center,
                child: Stack(
                  alignment: Alignment.bottomRight,
                  children: [
                    CircleAvatar(
                      radius: 85,
                      backgroundColor: Colors.green,
                      child: CircleAvatar(
                        radius: 80,
                        backgroundImage: AssetImage("assets/mogra.jpg"),
                      ),
                    ),
                    Positioned(
                      top: 118,
                      right: 0,
                      child: CircleAvatar(
                          backgroundColor: Colors.green,
                          child: IconButton(
                              tooltip: "Go To Home Screen",
                              color: Colors.white,
                              onPressed: () {
                                Navigator.pushNamed(context, Routes.homescreen);
                              },
                              icon: Icon(Icons.home))),
                    ),
                  ],
                )),
            Container(
              color: Colors.blue,
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Flexible(
                    flex: 3,
                    child: Container(
                        color: Colors.yellow,
                        width: 200,
                        child: Text("flex 1- container 2")),
                  ),
                  Flexible(
                    flex: 1,
                    child: Container(
                        width: 200, child: Text("flex 2- container 3")),
                  ),
                  Flexible(
                    flex: 2,
                    child: Container(
                        color: Colors.green,
                        width: 200,
                        child: Text("flex 2- container 4")),
                  ),
                  Flexible(
                    flex: 3,
                    child: Container(
                        width: 200, child: Text("flex 1- container 5")),
                  ),
                ],
              ),
            ),
            Container(
              child: Text("Implementaion of Grid view"),
            ),
            Container(
                child: Expanded(
              child: GridView.count(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10.0,
                  mainAxisSpacing: 10.0,
                  shrinkWrap: true,
                  childAspectRatio: 2.0,
                  children: List.generate(20, (index) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, Routes.dialerpad);
                      },
                      child: Container(
                          decoration: const BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage(
                            "assets/mogra.jpg",
                          ))),
                          child: Center(
                            child: const Text(
                              "Home Screen",
                              style: TextStyle(
                                  color: Colors.blue,
                                  fontWeight: FontWeight.bold),
                            ),
                          )),
                    );
                  })),
            ))
          ],
        ),
      ),
    );
  }
}
