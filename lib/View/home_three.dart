import 'package:flutter/material.dart';

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
            onPressed: () {},
          ),
          SizedBox(
            height: 30,
          ),
          Text("Click Here for Visit of Page One")
        ],
      ),
    );
  }
}
