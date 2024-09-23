import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AddNote extends StatefulWidget {
  const AddNote({super.key});

  @override
  State<AddNote> createState() => _AddNoteState();
}

class _AddNoteState extends State<AddNote> {
  final TextEditingController _addnoteController = TextEditingController();
  final TextEditingController _addDescription = TextEditingController();
  final List<Map<String, String>> _notes = [];
  final FocusNode _noteFocusNode = FocusNode();
  final FocusNode _descriptionFocusNode = FocusNode();

  @override
  void dispose() {
    // TODO: implement dispose
    _addDescription.dispose();
    _addnoteController.dispose();
    _noteFocusNode.dispose();
    _descriptionFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add Note"),
        backgroundColor: Colors.blue.shade500,
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
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                inputFormatters: [
                  FilteringTextInputFormatter.allow(RegExp(r'[a-zA-Z0-9]'))
                ],
                controller: _addnoteController,
                focusNode: _noteFocusNode,
                textInputAction: TextInputAction.next,
                onSubmitted: (value) {
                  FocusScope.of(context).requestFocus(_descriptionFocusNode);
                },
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Add Note',
                  prefixIcon: Icon(Icons.task),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                focusNode: _descriptionFocusNode,
                controller: _addDescription,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Add Description',
                  prefixIcon: Icon(Icons.task),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                  onPressed: () {
                    setState(() {
                      if (_addDescription.text.isNotEmpty &&
                          _addnoteController.text.isNotEmpty) {
                        _notes.add({
                          'note': _addnoteController.text,
                          'description': _addDescription.text
                        });
                      }
                    });
                  },
                  child: Text("Submit")),
            ),
            Expanded(
                child: ListView.builder(
                    itemCount: _notes.length,
                    itemBuilder: (context, index) {
                      return Card(
                        child: ListTile(
                          title: Text(_notes[index]['note']!),
                          subtitle: Text(_notes[index]['description']!),
                        ),
                      );
                    }))
          ],
        ),
      ),
    );
  }
}
