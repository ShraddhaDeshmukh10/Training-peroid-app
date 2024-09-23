import 'package:flutter/material.dart';
import 'package:trail_demo/Resources/route.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController _controller = TextEditingController();
  final List<String> _tasks = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("List of Tasks"),
        backgroundColor: Colors.blue.shade500,
        actions: [
          IconButton(
              onPressed: () {
                Navigator.pushReplacementNamed(context, Routes.addnote);
              },
              icon: Icon(Icons.note_add))
        ],
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.bottomRight,
                end: Alignment.topLeft,
                colors: [
              const Color.fromARGB(255, 8, 128, 226),
              Colors.white,
              Colors.blue.shade200
            ])),
        child: Column(
          children: [
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: _controller,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Enter a task',
                        prefixIcon: Icon(Icons.task),
                      ),
                    ),
                  ),
                  IconButton(
                    icon: Icon(Icons.add),
                    onPressed: () {
                      setState(() {
                        if (_controller.text.isNotEmpty) {
                          _tasks.add(_controller.text);
                          _controller.clear();
                        }
                      });
                    },
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: _tasks.length,
                itemBuilder: (context, index) {
                  return Card(
                    child: ListTile(
                      title: Text(_tasks[index]),
                      trailing: IconButton(
                        icon: Icon(Icons.delete),
                        onPressed: () {
                          setState(() {
                            _tasks.removeAt(index);
                          });
                        },
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
