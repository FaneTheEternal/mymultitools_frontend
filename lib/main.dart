import 'package:flutter/material.dart';

void main() {
  runApp(MyMultiTools());
}

class MyMultiTools extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MyMultiTools',
      home: Scaffold(
        appBar: AppBar(
          title: Text('MyMultiTools'),
        ),
        body: Center(child: Text('To be in development...')),
      ),
    );
  }
}
