import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Vertical_Grid extends StatefulWidget {
  const Vertical_Grid({super.key});

  @override
  State<Vertical_Grid> createState() => _Vertical_GridState();
}

class _Vertical_GridState extends State<Vertical_Grid> {
  List<String> weeks = ["Sun", "Mon", "Tue", "Wed", "Thu", "Fri", "Sat"];
  List<String> Dates = [];
  List<List<String>> newList = [];
  final startpostionController = TextEditingController();
  final lastDayofMonthContoller = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    monthDatesVertical();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    startpostionController.dispose();
    lastDayofMonthContoller.dispose();
  }

  void monthDatesVertical() {
    Dates.clear();
    newList.clear();
    int startPostion = int.tryParse(startpostionController.text) ?? 7;
    int endDateofMonth = int.tryParse(lastDayofMonthContoller.text) ?? 30;
    for (int i = 1; i <= 35; i++) {
      if (startPostion <= 5) {
        int number = i - startPostion + 1;
        if (number <= 0) {
          Dates.add("");
        } else if (number <= endDateofMonth) {
          Dates.add(number.toString());
        } else {
          Dates.add("");
        }
      } else {
        int diff = i - startPostion + 1;
        if (diff <= 0) {
          if (35 + diff > endDateofMonth) {
            Dates.add("");
          } else {
            Dates.add("${35 + diff}");
          }
        } else if (diff <= endDateofMonth) {
          Dates.add(diff.toString());
        }
      }
    }
    // for (int i = 1; i <= 35; i++) {
    //   Dates.add(startPostion == 1
    //       ? i.toString()
    //       : (startPostion == 6 || startPostion == 7) &&
    //               (endDateofMonth == 30 || endDateofMonth == 31)
    //           ? i == 1
    //               ? (endDateofMonth == 30 && startPostion == 6)
    //                   ? ""
    //                   : (endDateofMonth == 31 && startPostion == 6)
    //                       ? "31"
    //                       : "30"
    //               : (i == 2 && endDateofMonth == 31 && startPostion == 7)
    //                   ? "31"
    //                   : i >= startPostion
    //                       ? "${i - startPostion + 1}"
    //                       : ""
    //           : "");
    // }

    for (int k = 0; k < weeks.length; k++) {
      List<String> col = [];
      col.add(weeks[k]);

      ///print in column first list
      for (int j = k; j < Dates.length; j += 7) {
        col.add(Dates[j]);
      }
      newList.add(col);
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: startpostionController,
                maxLength: 1,
                inputFormatters: [
                  FilteringTextInputFormatter.allow(RegExp(r'[1-7]'))
                ],
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Enter Start Postion Index: (1-7)"),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                maxLength: 2,
                controller: lastDayofMonthContoller,
                onChanged: (value) {
                  int check = int.tryParse(lastDayofMonthContoller.text) ?? 0;
                  if (check >= 31) {
                    lastDayofMonthContoller.text = 31.toString();
                  }
                },
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Enter Last Day of Month: (28-31)"),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                  onPressed: () {
                    setState(() {
                      monthDatesVertical();
                    });
                  },
                  child: Text("Enter")),
            ),
            Expanded(
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 6,
                  mainAxisSpacing: 4,
                  crossAxisSpacing: 4,
                ),
                itemCount: newList.length * 6,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  int row = index ~/ 6;
                  int column = index % 6;
                  if (row < newList.length && column < newList[row].length) {
                    return Card(
                      child: Center(
                        child: Text(newList[row][column]),
                      ),
                    );
                  } else {
                    return SizedBox();
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
