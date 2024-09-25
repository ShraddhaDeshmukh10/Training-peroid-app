import 'package:flutter/material.dart';

class Dialer_pad extends StatefulWidget {
  const Dialer_pad({super.key});

  @override
  State<Dialer_pad> createState() => _Dialer_padState();
}

class _Dialer_padState extends State<Dialer_pad> {
  @override
  Widget build(BuildContext context) {
    final List<String> dialpadnumbers = [
      '1',
      '2',
      '3',
      '4',
      '5',
      '6',
      '7',
      '8',
      '9',
      '*',
      '0',
      '#',
    ];
    return Scaffold(
      appBar: AppBar(title: Text("Dailer Pad")),
      body: Column(
        children: [
          GridView.count(
            crossAxisCount: 3,
            crossAxisSpacing: 10.0,
            mainAxisSpacing: 10.0,
            shrinkWrap: true,
            childAspectRatio: 2.0,
            children: List.generate(12, (index) {
              return CircleAvatar(
                  radius: 10, child: Text(dialpadnumbers[index]));
            }),
          ),
          SizedBox(
            height: 15,
          ),
          CircleAvatar(
            radius: 30,
            backgroundColor: Colors.green,
            child: IconButton(onPressed: () {}, icon: Icon(Icons.call)),
          )
        ],
      ),
    );
  }
}
