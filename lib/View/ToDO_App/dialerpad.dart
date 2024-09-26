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
      '',
      "call",
      ""
    ];
    return Scaffold(
      appBar: AppBar(title: Text("Dailer Pad")),
      body: Column(
        children: [
          Expanded(
            child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  crossAxisSpacing: 10.0,
                  mainAxisSpacing: 2.0,
                  childAspectRatio: 2.0,
                ),
                itemCount: dialpadnumbers.length,
                itemBuilder: (context, index) {
                  final dialpadText = dialpadnumbers[index];
                  if (dialpadText.isEmpty) {
                    return SizedBox();
                  } else if (dialpadText == "call") {
                    return CircleAvatar(
                      radius: 20,
                      backgroundColor: Colors.green,
                      child: IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.call),
                      ),
                    );
                  } else {
                    return CircleAvatar(
                      radius: 20,
                      child: Text(dialpadText),
                    );
                  }
                }),
          )
          // GridView.count(
          //   crossAxisCount: 3,
          //   crossAxisSpacing: 10.0,
          //   mainAxisSpacing: 10.0,
          //   shrinkWrap: true,
          //   childAspectRatio: 3.0,
          //   children: dialpadnumbers
          //       .map((e) => e.isEmpty
          //           ? SizedBox()
          //           : CircleAvatar(radius: 1, child: Text(e)))
          //       .toList(),
          // ),
        ],
      ),
    );
  }
}
