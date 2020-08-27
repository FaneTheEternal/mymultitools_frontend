import 'package:flutter/material.dart';
import 'package:mymultitools_frontend/KeyWords.dart';
import 'package:mymultitools_frontend/apps/cards.dart';
import 'package:mymultitools_frontend/apps/notes.dart';
import 'package:mymultitools_frontend/apps/profile.dart';
import 'package:mymultitools_frontend/apps/schedule.dart';
import 'package:provider/provider.dart';

class MyMultiTools extends StatefulWidget {
  @override
  _MyMultiToolsState createState() => _MyMultiToolsState();
}

class _MyMultiToolsState extends State<MyMultiTools> {
  int _selectedIndex = 0;

  static List<Widget> _widgetOptions = [
    Schedule(),
    CardsList(),
    NotesList(),
    Profile(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('MyMultiTools'),
      ),
      body: Center(
        child: MultiProvider(
            providers: [
              ChangeNotifierProvider(create: (context) => Notes()),
              ChangeNotifierProvider(create: (context) => Cards())
            ],
            child: _widgetOptions.elementAt(_selectedIndex)
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.assignment),
            title: Text(KeyWords.schedule.sentenceCase)
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.credit_card),
              title: Text(KeyWords.cards.sentenceCase)
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.note),
              title: Text(KeyWords.notes.sentenceCase)
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.account_box),
              title: Text(KeyWords.profile.sentenceCase)
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.blue[800],
        unselectedItemColor: Colors.blue,
        onTap: _onItemTapped,
      ),
    );
  }
}
