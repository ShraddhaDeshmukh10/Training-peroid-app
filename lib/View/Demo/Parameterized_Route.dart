import 'package:flutter/material.dart';

class Parameterized_Route extends StatelessWidget {
  final String? text;

  const Parameterized_Route({super.key, this.text});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Parameterized Route"),
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: Text(text == null ? "This is blank" : text!,
            style: const TextStyle(fontSize: 24)),
      ),
    );
  }
}
