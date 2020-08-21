import 'package:flutter/material.dart';
import 'package:mymultitools_frontend/KeyWords.dart';

class Cards extends StatefulWidget {
  @override
  _CardsState createState() => _CardsState();
}

class _CardsState extends State<Cards> {
  @override
  Widget build(BuildContext context) {
    return Text(KeyWords.cards.sentenceCase);
  }
}
