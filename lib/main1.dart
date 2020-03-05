import 'dart:html';

import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';

//import 'package:sqflite/sqlite_api.dart';
import 'package:path/path.dart';
import 'package:convert/convert.dart';
import 'package:async/async.dart';

//var database ;
void main() async {
/*  final database = openDatabase(
    // Set the path to the database. Note: Using the `join` function from the
    // `path` package is best practice to ensure the path is correctly
    // constructed for each platform.
    join(await getDatabasesPath(), 'doggie_database.db'),
    // When the database is first created, create a table to store dogs.
    onCreate: (db, version) {
      return db.execute(
        "CREATE TABLE dogs(id INTEGER PRIMARY KEY, name TEXT, age INTEGER)",
      );
    },
    // Set the version. This executes the onCreate function and provides a
    // path to perform database upgrades and downgrades.
    version: 1,
  );*/
//insertDog(Dog(1, 'lol', 2));
//opendatabase();
  return runApp(MaterialApp(
    home: MyHomePage(),
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
      primaryColor: Colors.blueGrey,
      backgroundColor: Colors.grey,
    ),
  ));
}

  opendatabase() async {
  final database = openDatabase(
    // Set the path to the database. Note: Using the `join` function from the
    // `path` package is best practice to ensure the path is correctly
    // constructed for each platform.
    join(await getDatabasesPath(), 'doggie_database.db'),
    // When the database is first created, create a table to store dogs.
    onCreate: (db, version) {
      return db.execute(
        "CREATE TABLE dogs(id INTEGER PRIMARY KEY, name TEXT, age INTEGER)",
      );
    },
    // Set the version. This executes the onCreate function and provides a
    // path to perform database upgrades and downgrades.
    version: 1,
  );
  return database;
}
//
/*class Dog {
  final int id;
  final String name;
  final int age;

  Dog(this.id, this.name, this.age);

  Map<String, dynamic> tomap() {
    return {'id': id, 'name': name, 'age': age};
  }
}*/
//
//Future<Database> database;
//
//createTable(name) async {
//  database = openDatabase(
//    join(await getDatabasesPath(), 'doginfo.db'),
//    onCreate: (db, version) {
//      return db.execute(
//          'CREATE TABLE dog ( id INTEGER PRIMARY KEY, name TEXT, age INTEGER )');
//    },
//    version: 1,
//  );
//}
//
insert(obj, tableName) async {
  final Database db = await opendatabase();
  await db.insert(tableName, obj,
      conflictAlgorithm: ConflictAlgorithm.replace);
}
/*Future<void> insertDog(Dog dog) async {
  // Get a reference to the database.
  final Database db = await database;

  // Insert the Dog into the correct table. Also specify the
  // `conflictAlgorithm`. In this case, if the same dog is inserted
  // multiple times, it replaces the previous data.
  await db.insert(
    'dogs',
    dog.tomap(),
    conflictAlgorithm: ConflictAlgorithm.replace,
  );
}*/
/*Future<List<Dog>> retrive(tableName) async {
  final Database db = await database;
  final List<Map<String, dynamic>> maps = await db.query(tableName);
  return List.generate(maps.length, (indx) {
    return Dog(maps[indx]['id'], maps[indx]['name'], maps[indx]['age']);
  });
}*/
//
//update(obj, tableName) async {
//  final Database db = await database;
//  await db.update(tableName, obj.tomap, where: 'id=?', whereArgs: [obj.id]);
//}
//
//delete(int id, tableName) async {
//  final Database db = await database;
//  await db.delete(tableName, where: 'id=?', whereArgs: [id]);
//}

class Dog {
  final int id;
  final String name;
  final int age;

  Dog({this.id, this.name, this.age});

  Map<String, dynamic> tomap() {
    return {
      'id': id,
      'name': name,
      'age': age,
    };
  }

  // Implement toString to make it easier to see information about
  // each dog when using the print statement.
  @override
  String toString() {
    return 'Dog{id: $id, name: $name, age: $age}';
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var str0, str1, str2, str3;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
//    createTable(str0);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: <Widget>[
          SafeArea(
            child: TextField(
              decoration: InputDecoration(
                  border: OutlineInputBorder(), hintText: 'Enter a table name'),
              onChanged: (str) {
                setState(() {
                  str0 = str;
                });
              },
            ),
          ),
          Row(
            children: <Widget>[
              Expanded(
                  child: TextField(
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Enter a search id'),
                onChanged: (str) {
                  setState(() {
                    str1 = str;
                  });
                },
              )),
              Expanded(
                  child: TextField(
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Enter a search name'),
                onChanged: (str) {
                  setState(() {
                    str2 = str;
                  });
                },
              )),
              Expanded(
                  child: TextField(
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Enter a search age'),
                onChanged: (str) {
                  setState(() {
                    str3 = str;
                  });
                },
              )),
            ],
          ),
          Padding(
            padding: EdgeInsets.all(20),
            child: Row(
              children: <Widget>[
                Expanded(
                    child: FlatButton(
                        onPressed: () async {
//                      createTable(str0);
                          /*await insertDog(Dog(
                              id: int.parse(str1),
                              name: str2,
                              age: int.parse(str3)));*/
                          insert(Dog(
                              id: int.parse(str1),
                              name: str2,
                              age: int.parse(str3)), str0);
                          print(await dogs());
                        },
                        child: Text('insert'))),
                Expanded(
                    child: FlatButton(
                        onPressed: () async {
//                        update(Dog(int.parse(str1), str2, int.parse(str3)), str0);
                          await updateDog(Dog(
                              id: int.parse(str1),
                              name: str2,
                              age: int.parse(str3)));
                          print(await dogs());
                        },
                        child: Text('update'))),
                Expanded(
                    child: FlatButton(
                        onPressed: () async {
//                        delete(int.parse(str1), str0);
                          await deleteDog(int.parse(str1));
                        },
                        child: Text('delete'))),
                Expanded(
                    child: FlatButton(
                        onPressed: () async {
//                       print(retrive(str0));
                          print(await dogs());
                        },
                        child: Text('retrive'))),
              ],
            ),
          )
        ],
      ),
    );
  }
}

///////////////////example////////
/*
import 'dart:async';

import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';


*/

//void main1() async {
/*final database = openDatabase(
    // Set the path to the database. Note: Using the `join` function from the
    // `path` package is best practice to ensure the path is correctly
    // constructed for each platform.
    join(await getDatabasesPath(), 'doggie_database.db'),
    // When the database is first created, create a table to store dogs.
    onCreate: (db, version) {
      return db.execute(
        "CREATE TABLE dogs(id INTEGER PRIMARY KEY, name TEXT, age INTEGER)",
      );
    },
    // Set the version. This executes the onCreate function and provides a
    // path to perform database upgrades and downgrades.
    version: 1,
  );*/

Future<void> insertDog(Dog dog) async {
  // Get a reference to the database.
  final Database db = await opendatabase();

  // Insert the Dog into the correct table. Also specify the
  // `conflictAlgorithm`. In this case, if the same dog is inserted
  // multiple times, it replaces the previous data.
  await db.insert(
    'dogs',
    dog.tomap(),
    conflictAlgorithm: ConflictAlgorithm.replace,
  );
}

Future<List<Dog>> dogs() async {
  // Get a reference to the database.
  final Database db = await opendatabase();

  // Query the table for all The Dogs.
  final List<Map<String, dynamic>> maps = await db.query('dogs');

  // Convert the List<Map<String, dynamic> into a List<Dog>.
  return List.generate(maps.length, (i) {
    return Dog(
      id: maps[i]['id'],
      name: maps[i]['name'],
      age: maps[i]['age'],
    );
  });
}

Future<void> updateDog(Dog dog) async {
  // Get a reference to the database.
  final db = await opendatabase();

  // Update the given Dog.
  await db.update(
    'dogs',
    dog.tomap(),
    // Ensure that the Dog has a matching id.
    where: "id = ?",
    // Pass the Dog's id as a whereArg to prevent SQL injection.
    whereArgs: [dog.id],
  );
}

Future<void> deleteDog(int id) async {
  // Get a reference to the database.
  final db = await opendatabase();

  // Remove the Dog from the database.
  await db.delete(
    'dogs',
    // Use a `where` clause to delete a specific dog.
    where: "id = ?",
    // Pass the Dog's id as a whereArg to prevent SQL injection.
    whereArgs: [id],
  );
}

var fido = Dog(
  id: 0,
  name: 'Fido',
  age: 35,
);

// Insert a dog into the database.
//  await insertDog(fido);

// Print the list of dogs (only Fido for now).
//  print(await dogs());

// Update Fido's age and save it to the database.
//  fido = Dog(
//    id: fido.id,
//    name: fido.name,
//    age: fido.age + 7,
//  );
//  await updateDog(fido);

// Print Fido's updated information.
//  print(await dogs());

// Delete Fido from the database.
//  await deleteDog(fido.id);

// Print the list of dogs (empty).
//  print(await dogs());
//}
/*
class Dog {
  final int id;
  final String name;
  final int age;

  Dog({this.id, this.name, this.age});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'age': age,
    };
  }

  // Implement toString to make it easier to see information about
  // each dog when using the print statement.
  @override
  String toString() {
    return 'Dog{id: $id, name: $name, age: $age}';
  }
}*/
