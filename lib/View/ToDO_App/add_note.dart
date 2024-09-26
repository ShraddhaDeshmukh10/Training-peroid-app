import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AddNote extends StatefulWidget {
  const AddNote({super.key});

  @override
  State<AddNote> createState() => _AddNoteState();
}

class _AddNoteState extends State<AddNote> {
  final GlobalKey<AnimatedListState> _listKey = GlobalKey<AnimatedListState>();
  final TextEditingController _addnoteController = TextEditingController();
  final TextEditingController _addDescription = TextEditingController();
  final List<Map<String, String>> _notes = [];
  final FocusNode _noteFocusNode = FocusNode();
  final FocusNode _descriptionFocusNode = FocusNode();
  int? _selectedIndex;

  @override
  void dispose() {
    _addDescription.dispose();
    _addnoteController.dispose();
    _noteFocusNode.dispose();
    _descriptionFocusNode.dispose();
    super.dispose();
  }

  void _insertItem(Map<String, String> item) {
    setState(() {
      _notes.add(item);
    });
  }

  void _removeItem(int index) {
    setState(() {
      _notes.removeAt(index);
    });
  }

  void _reorderList(int oldIndex, int newIndex) {
    setState(() {
      if (newIndex > oldIndex) {
        newIndex -= 1;
      }
      final item = _notes.removeAt(oldIndex);
      _notes.insert(newIndex, item);
    });
  }

  void _toggleElevation(int index) {
    setState(() {
      _selectedIndex = (_selectedIndex == index) ? null : index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add Note"),
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
              Colors.blue.shade200,
            ],
          ),
        ),
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
                decoration: const InputDecoration(
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
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Add Description',
                  prefixIcon: Icon(Icons.description),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                onPressed: () {
                  if (_addDescription.text.isNotEmpty &&
                      _addnoteController.text.isNotEmpty) {
                    final newNote = {
                      'note': _addnoteController.text,
                      'description': _addDescription.text,
                    };
                    _insertItem(newNote);
                    _addnoteController.clear();
                    _addDescription.clear();
                  }
                },
                child: const Text("Submit"),
              ),
            ),
            Expanded(
              child: ReorderableListView(
                onReorder: _reorderList,
                children: List.generate(_notes.length, (index) {
                  return GestureDetector(
                    key: ValueKey(_notes[index]['note']),
                    onTap: () => _toggleElevation(index),
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 300),
                      margin: const EdgeInsets.all(8.0),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8.0),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.2),
                            blurRadius: _selectedIndex == index ? 10.0 : 0.0,
                            spreadRadius: _selectedIndex == index ? 5.0 : 0.0,
                          ),
                        ],
                      ),
                      child: Card(
                        child: ListTile(
                          title: Text(_notes[index]['note']!),
                          subtitle: Text(_notes[index]['description']!),
                          trailing: IconButton(
                            icon: const Icon(Icons.delete),
                            onPressed: () {
                              _removeItem(index);
                            },
                          ),
                        ),
                      ),
                    ),
                  );
                }),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
