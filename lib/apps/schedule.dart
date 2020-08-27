import 'dart:collection';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Subject {
  String name;
  String teacher;
  String audience;
  String type;
  Widget time;

  Subject(
      {@required this.name,
      this.teacher = '',
      this.audience = '',
      this.type = '',
      this.time = const Text('-')});

  get color => type == 'пр'
      ? Colors.yellow
      : type == 'лк' ? Colors.red : type == 'лб' ? Colors.green : Colors.black;
}

class Schedule extends ChangeNotifier {
  final List<List<Subject>> _schedule = [];
  bool _beInit = false;

  List<Subject> at(int index) {
    if (!_beInit) _init();
    return _schedule.elementAt(index);
  }

  UnmodifiableListView get schedule => UnmodifiableListView(_schedule);

  int get count {
    if (!_beInit) _init();
    return _schedule.length;
  }

  _init() {
    final List<List<Subject>> template = [
      [
        Subject(
            name: 'Предмет1',
            audience: '###',
            type: 'лк',
            teacher: 'Преподаватель П.П.'),
        Subject(
            name: 'Предмет2',
            audience: '###',
            type: 'пр',
            teacher: 'Преподаватель П.П.'),
        Subject(
            name: 'Предмет3',
            audience: '###',
            type: 'лб',
            teacher: 'Преподаватель П.П.'),
      ],
      [
        Subject(
            name: 'Предмет1',
            audience: '###',
            type: 'лк',
            teacher: 'Преподаватель П.П.'),
        Subject(
            name: 'Предмет2',
            audience: '###',
            type: 'пр',
            teacher: 'Преподаватель П.П.'),
        Subject(
            name: 'Предмет3',
            audience: '###',
            type: 'лб',
            teacher: 'Преподаватель П.П.'),
      ],
      [
        Subject(
            name: 'Предмет1',
            audience: '###',
            type: 'лк',
            teacher: 'Преподаватель П.П.'),
        Subject(
            name: 'Предмет2',
            audience: '###',
            type: 'пр',
            teacher: 'Преподаватель П.П.'),
        Subject(
            name: 'Предмет3',
            audience: '###',
            type: 'лб',
            teacher: 'Преподаватель П.П.'),
      ],
      [
        Subject(
            name: 'Предмет1',
            audience: '###',
            type: 'лк',
            teacher: 'Преподаватель П.П.'),
        Subject(
            name: 'Предмет2',
            audience: '###',
            type: 'пр',
            teacher: 'Преподаватель П.П.'),
        Subject(
            name: 'Предмет3',
            audience: '###',
            type: 'лб',
            teacher: 'Преподаватель П.П.'),
      ],
      [
        Subject(
            name: 'Предмет1',
            audience: '###',
            type: 'лк',
            teacher: 'Преподаватель П.П.'),
        Subject(
            name: 'Предмет2',
            audience: '###',
            type: 'пр',
            teacher: 'Преподаватель П.П.'),
        Subject(
            name: 'Предмет3',
            audience: '###',
            type: 'лб',
            teacher: 'Преподаватель П.П.'),
      ],
      [
        Subject(
            name: 'Предмет1',
            audience: '###',
            type: 'лк',
            teacher: 'Преподаватель П.П.'),
        Subject(
            name: 'Предмет2',
            audience: '###',
            type: 'пр',
            teacher: 'Преподаватель П.П.'),
        Subject(
            name: 'Предмет3',
            audience: '###',
            type: 'лб',
            teacher: 'Преподаватель П.П.'),
      ],
    ];

    final List<Widget> timeTemplate = [
      Column(
        children: [
          Text('08:20'),
          Text('09:40')
        ],
      ),
      Column(
        children: [
          Text('09:50'),
          Text('11:10')
        ],
      ),
      Column(
        children: [
          Text('11:40'),
          Text('13:00')
        ],
      ),
      Column(
        children: [
          Text('13:30'),
          Text('14:50')
        ],
      ),
      Column(
        children: [
          Text('15:00'),
          Text('16:20')
        ],
      ),
      Column(
        children: [
          Text('16:40'),
          Text('18:00')
        ],
      ),
      Column(
        children: [
          Text('18:10'),
          Text('19:30')
        ],
      ),
      Column(
        children: [
          Text('19:40'),
          Text('21:00')
        ],
      ),
    ];

    template.forEach((element) {
      for (int i = 0; i < element.length; i++) {
        element.elementAt(i).time = timeTemplate.elementAt(i);
      }
      _schedule.add(element);
    });
    _beInit = true;
  }
}

class ScheduleList extends StatefulWidget {
  @override
  _ScheduleListState createState() => _ScheduleListState();
}

class _ScheduleListState extends State<ScheduleList> {
  @override
  Widget build(BuildContext context) {
    return Consumer<Schedule>(
      builder: (context, schedule, child) {
        return Scaffold(
          body: Column(
            children: [
              Flexible(
                child: ListView.builder(
                  itemCount: schedule.count,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: ScheduleDay(schedule: schedule.at(index)),
                    );
                  },
                ),
              )
            ],
          ),
        );
      },
    );
  }
}

class ScheduleDay extends StatelessWidget {
  final List<Subject> schedule;

  ScheduleDay({@required this.schedule});

  @override
  Widget build(BuildContext context) {
    return Card(
        child: Column(
      children: [
        for (Subject i in schedule) _tileSubject(subject: i)
      ],
    ));
  }

  _tileSubject({Subject subject}) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Expanded(
            child: Row(
              children: [
                subject.time,
                Container(
                  height: 50,
                  child: VerticalDivider(
                    color: subject.color,
                    thickness: 2,
                    width: 10,
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      subject.name,
                      style: TextStyle(
                        fontSize: 20
                      ),
                    ),
                    Text(
                      '${subject.audience}, ${subject.type}',
                      style: TextStyle(
                        color: Colors.grey,
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
          Container(
            child: Text(
              subject.teacher
            ),
          )
        ],
      ),
    );
  }
}
