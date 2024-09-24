import 'package:flutter/material.dart';

class Stack_flexible extends StatefulWidget {
  const Stack_flexible({super.key});

  @override
  State<Stack_flexible> createState() => _Stack_flexibleState();
}

class _Stack_flexibleState extends State<Stack_flexible> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            color: Colors.orange.shade400,
          ),
          Container(
            color: Colors.white,
          ),
          Container(
            color: Colors.blue.shade900,
          ),
          Container(
            color: Colors.green,
          ),
        ],
      ),
    );
  }
}
