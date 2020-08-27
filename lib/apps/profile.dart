import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mymultitools_frontend/auth.dart';
import 'package:provider/provider.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Consumer<AuthModel>(
      builder: (context, auth, child) {
        return Column(
          children: [
            Flexible(
              child: Padding(
                padding: EdgeInsets.only(bottom: 200, top: 50),
                child: _about(auth),
              ),
            ),
            _actions(auth)
          ],
        );
      },
    );
  }

  _about(AuthModel auth) {
    return Row(
      children: [
        Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.face,
              size: 200,
            )
          ],
        ),
        Padding(
          padding: EdgeInsets.only(bottom: 100, top: 20),
          child: Center(
            child: Column(
              children: [
                Expanded(
                  child: Text(
                    'First name',
                    style: TextStyle(fontSize: 20),
                  ),
                ),
                Expanded(
                  child: Text(
                    'Last name',
                    style: TextStyle(fontSize: 20),
                  ),
                ),
                Text(
                  'Course',
                  style: TextStyle(fontSize: 20),
                ),
              ],
            ),
          ),
        )
      ],
    );
  }

  _actions(AuthModel auth) {
    return Column(
      children: [
        FlatButton(
          onPressed: () {},
          child: Row(
            children: [
              Icon(Icons.folder),
              Text('Портфолио')
            ],
          ),
        ),
        FlatButton(
          onPressed: () {},
          child: Row(
            children: [
              Icon(Icons.send),
              Text('Обратная связь')
            ],
          ),
        ),
        FlatButton(
          onPressed: () {},
          child: Row(
            children: [
              Icon(Icons.settings),
              Text('Настройки')
            ],
          ),
        ),
        FlatButton(
          onPressed: () {
            setState(() {
              auth.logout();
            });
          },
          child: Row(
            children: [
              Icon(Icons.exit_to_app),
              Text('Выйти из учетной записи')
            ],
          ),
        )
      ],
    );
  }
}
