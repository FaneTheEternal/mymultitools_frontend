import 'package:flutter/material.dart';
import 'package:mymultitools_frontend/KeyWords.dart';

class Schedule extends StatefulWidget {
  @override
  _ScheduleState createState() => _ScheduleState();
}

class _ScheduleState extends State<Schedule> {
  @override
  Widget build(BuildContext context) {
    return Text(KeyWords.schedule.sentenceCase);
  }
}
