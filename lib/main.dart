import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'auth.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => AuthModel()),
      ],
      child: MaterialApp(
        title: 'MyMultiTools',
        home: Scaffold(
          body: Auth(),
        )
      ),
    );
  }
}
