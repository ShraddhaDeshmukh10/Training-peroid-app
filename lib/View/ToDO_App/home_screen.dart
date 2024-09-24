import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
              icon: Icon(Icons.note_add)),
          IconButton(
              onPressed: () {
                Navigator.pushNamed(context, Routes.userform);
              },
              icon: Icon(Icons.feed)),
          IconButton(
              onPressed: () {
                Navigator.pushNamed(context, Routes.stackcollection);
              },
              icon: Icon(Icons.stacked_bar_chart))
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
                      keyboardType: TextInputType.name,
                      inputFormatters: [
                        FilteringTextInputFormatter.allow(
                            RegExp(r'[a-zA-Z0-9 ]')),
                        FilteringTextInputFormatter.deny(
                          RegExp(r'^\s+'),
                        )
                      ],
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
                        String task = _controller.text.trim();
                        if (task.isNotEmpty) {
                          _tasks.add(task);
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
