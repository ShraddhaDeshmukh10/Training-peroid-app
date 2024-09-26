import 'package:flutter/material.dart';

class Dialer_pad extends StatefulWidget {
  const Dialer_pad({super.key});

  @override
  State<Dialer_pad> createState() => _Dialer_padState();
}

class _Dialer_padState extends State<Dialer_pad> {
  List numberbuttons = [];
  List dialpadextra = ['*', '0', '#', "", 'call', ""];

  @override
  void initState() {
    super.initState();
    printNum();
  }

  void printNum() {
    for (int i = 1; i <= 9; i++) {
      numberbuttons.add(CircleAvatar(
        radius: 20,
        child: Text(i.toString()),
      ));
    }
    for (var item in dialpadextra) {
      if (item.isEmpty) {
        numberbuttons.add(SizedBox());
      } else if (item == 'call') {
        numberbuttons.add(CircleAvatar(
            backgroundColor: Colors.green,
            radius: 30,
            child: IconButton(onPressed: () {}, icon: Icon(Icons.call))));
      } else {
        numberbuttons.add(CircleAvatar(
          radius: 20,
          child: Text(item),
        ));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Dailer Pad")),
      body: Column(
        children: [
          Expanded(
            child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  crossAxisSpacing: 0,
                  mainAxisSpacing: 2.0,
                  childAspectRatio: 2.0,
                ),
                itemCount: numberbuttons.length,
                itemBuilder: (context, index) {
                  return numberbuttons[index];
                }),
          ),
          // Expanded(
          //   child: GridView.builder(
          //     gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          //         crossAxisCount: 3,
          //         crossAxisSpacing: 0,
          //         mainAxisSpacing: 0,
          //         childAspectRatio: 2.0),
          //     itemCount: dialpadextra.length,
          //     itemBuilder: (context, index) {
          //       if (dialpadextra[index].isEmpty) {
          //         return const SizedBox();
          //       } else if (dialpadextra[index] == "call") {
          //         return CircleAvatar(
          //             backgroundColor: Colors.green,
          //             radius: 30,
          //             child:
          //                 IconButton(onPressed: () {}, icon: Icon(Icons.call)));
          //       } else
          //         return CircleAvatar(
          //           radius: 20,
          //           child: Text(dialpadextra[index]),
          //         );
          //     },
          //   ),
          // )
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
