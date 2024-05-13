import 'package:flutter/material.dart';

void main() {
  runApp(const NoteController());
}

class NoteController extends StatelessWidget {
  const NoteController({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Notes',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: const NoteList(),
    );
  }
}

class NoteList extends StatefulWidget {
  const NoteList({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _NoteListState createState() => _NoteListState();
}

class _NoteListState extends State<NoteList> {
  final List<String> _notes = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Notes'),
      ),
      body: ListView.builder(
        itemCount: _notes.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(_notes[index]),
            onTap: () {
              _editNote(context, index);
            },
            onLongPress: () {
              _deleteNote(index);
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _addNote(context);
        },
        child: const Icon(Icons.add),
      ),
    );
  }

  void _addNote(BuildContext context) async {
    String newNote = await Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => NoteEditor(
                note: '',
              )),
    );
    setState(() {
      _notes.add(newNote);
    });
  }

  void _editNote(BuildContext context, int index) async {
    String editedNote = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => NoteEditor(note: _notes[index])),
    );
    setState(() {
      _notes[index] = editedNote;
    });
  }

  void _deleteNote(int index) {
    setState(() {
      _notes.removeAt(index);
    });
  }
}

class NoteEditor extends StatefulWidget {
  final String note;

  NoteEditor({required this.note});

  @override
  _NoteEditorState createState() => _NoteEditorState();
}

class _NoteEditorState extends State<NoteEditor> {
  late TextEditingController _textEditingController;

  @override
  void initState() {
    super.initState();
    _textEditingController = TextEditingController(text: widget.note);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Note'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: TextField(
          controller: _textEditingController,
          autofocus: true,
          maxLines: null,
          keyboardType: TextInputType.multiline,
          decoration: const InputDecoration(
            hintText: 'Enter your note here...',
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          String editedNote = _textEditingController.text.trim();
          Navigator.pop(context, editedNote);
        },
        child: const Icon(Icons.save),
      ),
    );
  }

  @override
  void dispose() {
    _textEditingController.dispose();
    super.dispose();
  }
}
