import 'dart:async';

import 'package:simple_note_app/models/note.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DbHelper {
  Database? _db;

  Future<Database?> get db async {
    _db ??= await initializeDb();
    return _db;
  }

  Future<Database?> initializeDb() async {
    String dbPath = join(await getDatabasesPath(), "goal.db");

    var db = openDatabase(dbPath, version: 1, onCreate: onCreateDb);

    return db;
  }

  void onCreateDb(Database db, int version) async {
    await db.execute(
        "CREATE TABLE note (id integer primary key, time integer, noteTitle text, noteDescription text)");
  }

  Future<List<Note>?> getNotes() async {
    Database? dbx = await db;

    var result = await dbx?.query("note");

    if (result != null) {
      return List.generate(
        result.length,
        (index) => Note.fromObject(result[index]),
      );
    }
  }

  Future<int?> insert(Note nNote) async {
    Database? db = await this.db;
    var result = await db?.insert('note', nNote.toMap());
    return result;
  }

  Future<int?> delete(int id) async {
    Database? db = await this.db;
    var result = await db?.rawDelete("delete from note where id = $id");
    return result;
  }
}
