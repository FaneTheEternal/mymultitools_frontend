import 'package:flutter/material.dart';
import 'package:mymultitools_frontend/KeyWords.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Text(KeyWords.profile.sentenceCase);
  }
}
