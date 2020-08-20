import 'dart:io';

import 'package:mymultitools_frontend/UserModel.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DBProvider {
  static const DBName = 'MMT.db';
  static const UserTable = 'User';
  DBProvider._();
  static final DBProvider db = DBProvider._();

  static Database _database;

  Future<Database> get database async {
    if (_database != null) {
      return _database;
    }

    _database = await initDB();
    return _database;
  }

  initDB() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = documentsDirectory.path + DBName;
    return await openDatabase(path, version: 1, onOpen: (db) {},
        onCreate: (Database db, int version) async {
      await db.execute("""
          CREATE TABLE $UserTable (
            id INTEGER PRIMARY KEY,
            token TEXT
          )
          """);
    });
  }

  newUser(User newUser) async {
    final db = await database;
    var res = await db.insert(UserTable, newUser.toJson());
    return res;
  }

  getUser(String username, String password) async {
    final db = await database;
    var res = await db.query(UserTable,
        where: 'token = ?', whereArgs: ['$username$password']);
    return res.isNotEmpty ? User.fromJson(res.first) : null;
  }
}
