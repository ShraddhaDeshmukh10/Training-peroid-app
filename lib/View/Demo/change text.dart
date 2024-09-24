import 'package:flutter/material.dart';

class Change_Text extends StatefulWidget {
  @override
  _Change_TextState createState() => _Change_TextState();
}

class _Change_TextState extends State<Change_Text> {
  String _text = "Hello";

  void _changeText() {
    setState(() {
      _text = _text == "Hello" ? "Text Changed" : "Hello";
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Change Text'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                _text,
                style: TextStyle(fontSize: 24),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: _changeText,
                child: Text('Click to Change Text'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
