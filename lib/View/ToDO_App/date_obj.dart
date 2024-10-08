import 'dart:async';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Date_Obj extends StatefulWidget {
  const Date_Obj({super.key});

  @override
  State<Date_Obj> createState() => _Date_ObjState();
}

class _Date_ObjState extends State<Date_Obj> {
  DateTime? selectedDate;
  late Timer _timer;
  String currentTime = "";
  String differenceIndays = '';
  String addIndays = "";

  @override
  void initState() {
    super.initState();
    _updateCurrentTime();
    _timer = Timer.periodic(Duration(milliseconds: 1), (timer) {
      _updateCurrentTime();
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  void _updateCurrentTime() {
    final now = DateTime.now();
    setState(() {
      currentTime = DateFormat('HH:mm:ss.SSS').format(now);
    });
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2025),
    );

    if (pickedDate != null && pickedDate != selectedDate) {
      setState(() {
        selectedDate = pickedDate;
        DateTime today = DateTime.now();
        Duration difference = today.difference(selectedDate!);
        differenceIndays = "${difference.inDays} days";

        DateTime future = today.add(Duration(days: 10));
        DateTime past = today.subtract(Duration(days: 13));

        String formattedFuture = DateFormat('yyyy-MM-dd').format(future);
        String formattedPast = DateFormat('yyyy-MM-dd').format(past);

        addIndays = "Future date: $formattedFuture\nPast date: $formattedPast";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    DateTime today = DateTime.now();
    DateTime birthdate = DateTime(2002, 12, 10);
    String formatted_birthdate = DateFormat('yyyy-MM-dd').format(birthdate);
    String formattedDate = DateFormat('yyyy-MM-dd').format(today);
    int currentMiliseconds = today.millisecondsSinceEpoch;
    int birthdateMilliseconds = birthdate.millisecondsSinceEpoch;
    String formatnewdate = selectedDate != null
        ? DateFormat('yyyy-MM-dd').format(selectedDate!)
        : "Select Date";

    return Scaffold(
      appBar: AppBar(
        title: Text("Date Objects"),
        backgroundColor: Colors.cyan,
      ),
      body: Column(
        children: [
          Text("Today's Date:",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25)),
          Text(
            formattedDate,
            style: TextStyle(fontSize: 24),
          ),
          SizedBox(
            height: 20,
          ),
          Text("To Print Birth Date",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25)),
          Text(formatted_birthdate, style: TextStyle(fontSize: 24)),
          SizedBox(
            height: 20,
          ),
          Text("Selected Date: $formatnewdate", style: TextStyle(fontSize: 20)),
          SizedBox(
            height: 20,
          ),
          ElevatedButton(
            onPressed: () => _selectDate(context),
            child: Text("Pick a Date"),
          ),
          Text("Current Time in milliseconds:  $currentMiliseconds"),
          Text(
            "current clock Time: $currentTime",
          ),
          Text("Birthdate in Milliseconds since epoch: $birthdateMilliseconds"),
          Text(
            "Difference between selected date and today's date is: $differenceIndays",
            style: TextStyle(fontSize: 20),
          ),
          Text(addIndays,
              style: TextStyle(fontSize: 20)), // Display future and past dates
        ],
      ),
    );
  }
}
