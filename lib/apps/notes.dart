import 'package:flutter/material.dart';
import 'package:mymultitools_frontend/KeyWords.dart';

class Notes extends StatefulWidget {
  @override
  _NotesState createState() => _NotesState();
}

class _NotesState extends State<Notes> {
  @override
  Widget build(BuildContext context) {
    return Text(KeyWords.notes.sentenceCase);
  }
}
