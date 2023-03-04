import 'dart:developer';
import 'dart:io';
import 'package:synapsysid_challenge_app/src/core/data/model/user.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

import '../../../feature/Auth/models/auth_request_model.dart';

class DB {
  static late DB _db;
  static late Database _database;

  String userTable = 'userTable';
  String idColumn = 'id';
  String nameColumn = 'name';
  String phoneColumn = 'phone';
  String emailColumn = 'email';
  String passwordColumn = 'password';

  DB._createInstance();

  factory DB() {
    _db = DB._createInstance();

    return _db;
  }

  Future<Database> get database async {
    _database = await initializeDatabase();

    return _database;
  }

  Future<Database> initializeDatabase() async {
    Directory directory = await getApplicationDocumentsDirectory();
    String path = '${directory.path}authSqliteDB.db';

    var authSqliteDB =
        await openDatabase(path, version: 1, onCreate: _createDb);
    return authSqliteDB;
  }

  void _createDb(Database db, int newVersion) async {
    await db.execute(_userTable);
  }

  insertUser(User user) async {
    Database db = await database;

    var res = await db.insert(userTable, user.toMap());
    List<Map> list = await db.rawQuery('SELECT * FROM userTable');
    log("$list");
    return res;
  }

  getUser(AuthRequestModel auth) async {
    Database db = await database;
    log(' ${auth.email}, ${auth.password}');
    log('tst');
    var res = await db.rawQuery("SELECT * FROM $userTable WHERE $emailColumn = ? AND $passwordColumn = ?", [auth.email, auth.password]);
    log("$res}");

    return res;
  }
  getUserTST(String email) async{
      Database db = await database;
      var res = await db.query(userTable, where: "$emailColumn = ?" , whereArgs: [email]);

      return res;
    } 

  String get _userTable => '''
    CREATE TABLE userTable (
      $idColumn INTEGER PRIMARY KEY AUTOINCREMENT,
      $nameColumn TEXT,
      $phoneColumn TEXT,
      $emailColumn TEXT,
      $passwordColumn TEXT
    )
  ''';
}
