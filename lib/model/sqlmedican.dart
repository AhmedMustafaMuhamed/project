import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:project/model/medican.dart';

class sqlmedican {
  opendatabase() async {
    final database = openDatabase(
      // Set the path to the database. Note: Using the `join` function from the
      // `path` package is best practice to ensure the path is correctly
      // constructed for each platform.
      join(await getDatabasesPath(), 'doggie_database.db'),
      // When the database is first created, create a table to store dogs.
      onCreate: (db, version) {
        return db.execute(
          "CREATE TABLE medican(name TEXT PRIMARY KEY, timesofit INTEGER, timetostart TXT)",
        );
      },
      // Set the version. This executes the onCreate function and provides a
      // path to perform database upgrades and downgrades.
      version: 1,
    );
    return database;
  }

  insert(medican obj) async {
    final Database db = await opendatabase();
    await db.insert('medican', obj.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  delete(String name) async {
    final Database db = await opendatabase();
    await db.delete('medican', where: 'name=?', whereArgs: [name]);
  }
}
