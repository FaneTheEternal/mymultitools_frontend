import 'package:recase/recase.dart';

class KeyWords {
  static ReCase get login => new ReCase('вход');
  static ReCase get loginEnter => new ReCase('войти');
  static ReCase get emptyText => new ReCase('не может быть пустым');
  static ReCase get username => new ReCase('логин');
  static ReCase get password => new ReCase('пароль');

  static ReCase get schedule => new ReCase('расписание');
  static ReCase get cards => new ReCase('карты');
  static ReCase get notes => new ReCase('заметки');
  static ReCase get profile => new ReCase('профиль');
}
