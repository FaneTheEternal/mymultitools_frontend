import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'KeyWords.dart';
import 'app.dart';

class Auth extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<AuthModel>(
      builder: (context, auth, child) {
        return auth.isLogin ? MyMultiTools() : LoginForm();
      },
    );
  }
}

class AuthModel extends ChangeNotifier {
  String username;
  String password;

  bool get isLogin => username != null && password != null;

  void login(String username, String password) {
    this.username = username;
    this.password = password;
    notifyListeners();
  }

  void logout() {
    this.username = null;
    this.password = null;
    notifyListeners();
  }
}

class LoginForm extends StatefulWidget {
  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  bool _validate = true;

  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(KeyWords.login.sentenceCase),
        TextField(
          controller: usernameController,
          decoration: InputDecoration(
              labelText: KeyWords.username.sentenceCase,
              errorText: _validate ? null : KeyWords.emptyText.sentenceCase),
        ),
        TextField(
          controller: passwordController,
          decoration: InputDecoration(
              labelText: KeyWords.password.sentenceCase,
              errorText: _validate ? null : KeyWords.emptyText.sentenceCase),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 16),
          child: RaisedButton(
            onPressed: () {
              setState(() {
                _validate = usernameController.text.isEmpty ||
                        passwordController.text.isEmpty
                    ? false
                    : true;
              });
              if (_validate) {
                Provider.of<AuthModel>(context, listen: false)
                    .login(usernameController.text, passwordController.text);
              }
            },
            child: Text(KeyWords.loginEnter.sentenceCase),
            color: Colors.yellow,
            textColor: Colors.white,
          ),
        )
      ],
    );
  }

  @override
  void dispose() {
    usernameController.dispose();
    passwordController.dispose();
    super.dispose();
  }
}
