import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CardModel {
  String name;
  String description;
  String uid;

  CardModel({this.name, this.description, this.uid});
}

class Cards extends ChangeNotifier {
  final List<CardModel> _cards = [
    CardModel(name: 'Пропуск', description: 'Пропуск в университет'),
    CardModel(name: 'Профком', description: 'Карта профкома')
  ];

  add(CardModel card) {
    _cards.add(card);
    notifyListeners();
  }

  at(int index) {
    return _cards.elementAt(index);
  }

  int get count => _cards.length;
  UnmodifiableListView get cards => UnmodifiableListView(_cards);
}

class CardTile extends StatelessWidget {
  final CardModel _card;

  CardTile({Key key, @required card}) : _card = card;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10),
      child: Card(
        child: FlatButton(
          onPressed: () {},
          child: ListTile(
            title: Text(_card.name),
            subtitle: Text(_card.description),
          ),
        ),
      ),
    );
  }
}

class CardsList extends StatefulWidget {
  @override
  _CardsListState createState() => _CardsListState();
}

class _CardsListState extends State<CardsList> {
  @override
  Widget build(BuildContext context) {
    return Consumer<Cards>(
      builder: (context, cards, child) {
        return Scaffold(
          body: Column(
            children: [
              Flexible(
                child: ListView.builder(
                    itemCount: cards.count,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: CardTile(card: cards.at(index)),
                      );
                    }),
              )
            ],
          ),
          floatingActionButton: FloatingActionButton(
            child: Icon(Icons.add),
            onPressed: () {},
          ),
        );
      },
    );
  }
}
