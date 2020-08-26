import 'dart:collection';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:mymultitools_frontend/KeyWords.dart';
import 'package:provider/provider.dart';

class Note {
  String name;
  String data;

  Note({this.name, this.data});

  save(String name, String data) {
    this.name = name;
    this.data = data;
  }
}


class Notes extends ChangeNotifier {
  final List<Note> _notes = [];

  add(Note note) {
    _notes.add(note);
    notifyListeners();
  }

  remove(int index) {
    _notes.removeAt(index);
    notifyListeners();
  }

  Note at(int index) {
    return _notes[index];
  }

  int get count => _notes.length;
  UnmodifiableListView get notes => UnmodifiableListView(_notes);
}

class NotesList extends StatefulWidget {
  @override
  _NotesListState createState() => _NotesListState();
}

class _NotesListState extends State<NotesList> {
  @override
  Widget build(BuildContext context) {
    return Consumer<Notes>(
      builder: (context, notes, child) {
        return Column(
          children: [
            Flexible(
              child: ListView.builder(
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Row(
                      children: [
                        Expanded(child: Text('${notes.at(index).name}')),
                        IconButton(
                          icon: Icon(Icons.delete),
                          onPressed: () {
                            Provider.of<Notes>(context).remove(index);
                          },
                        ),
                      ],
                    ),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => NoteDetail(
                                note: notes.at(index), index: index)
                        )
                      );
                    },
                  );
                },
                itemCount: notes.count,
              ),
            ),
            Row(
              textDirection: TextDirection.rtl,
              children: [
                FloatingActionButton(
                  child: Icon(Icons.add),
                  onPressed: () {
                    var note = Note(name: 'new', data: '');
                    notes.add(note);
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => NoteDetail(
                              note: note,
                              index: notes.count - 1,
                              isNew: true
                          )
                      )
                    );
                  },
                )
              ],
            )
          ],
        );
      },
    );
  }
}

class NoteDetail extends StatefulWidget {
  final Note note;
  final bool isNew;
  final int index;

  NoteDetail({Key key, @required this.note, @required this.index, this.isNew});

  @override
  _NoteDetailState createState() => _NoteDetailState();
}

class _NoteDetailState extends State<NoteDetail> {
  Note note;
  bool editMode;

  final nameController = TextEditingController();
  final dataController = TextEditingController();

  @override
  void initState() {
    note = widget.note;
    editMode = widget.isNew ?? false;
    _initControllers();
    super.initState();
  }

  _initControllers() {
    nameController.text = note.name;
    dataController.text = note.data;
  }

  @override
  Widget build(BuildContext context) {
    return editMode ? _editMode() : _viewMode();
  }

  _viewMode() {
    return Scaffold(
      appBar: AppBar(
        title: Text(note.name),
        actions: [
          IconButton(
            icon: Icon(Icons.edit),
            onPressed: () {
              setState(() {
                _initControllers();
                editMode = true;
              });
            },
          )
        ],
      ),
      body: Center(
        child: Text(note.data),
      ),
    );
  }

  _editMode() {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            setState(() {
              if (nameController.text.isNotEmpty) {
                editMode = false;
              }
            });
          },
        ),
        title: Text(note.name),
        actions: [
          IconButton(
            icon: Icon(Icons.save),
            onPressed: () {
              setState(() {
                if (nameController.text.isNotEmpty) {
                  note.save(nameController.text, dataController.text);
                  nameController.clear();
                  dataController.clear();
                  editMode = false;
                }
              });
            },
          )
        ],
      ),
      body: Column(
        children: [
          TextField(
            controller: nameController,
            decoration: InputDecoration(
              labelText: KeyWords.title.sentenceCase,
              errorText: nameController.text.isEmpty ? KeyWords.emptyText.sentenceCase : null
            ),
          ),
          TextField(
            controller: dataController,
            decoration: InputDecoration(
              labelText: KeyWords.content.sentenceCase
            ),
          )
        ],
      ),
    );
  }

  @override
  void dispose() {
    nameController.dispose();
    dataController.dispose();
    super.dispose();
  }
}
