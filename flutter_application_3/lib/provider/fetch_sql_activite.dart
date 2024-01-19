import 'package:flutter/material.dart';
import 'package:flutter_application_3/utils/dog.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

Database? _database;

Future<Database> get database async {
  if (_database != null) return _database!;

  _database = await initializeDatabase();
  return _database!;
}

Future<Database> initializeDatabase() async {   
  WidgetsFlutterBinding.ensureInitialized();
  return openDatabase(
    join(await getDatabasesPath(), 'doggie_database.db'),
    onCreate: (db, version) {
      return db.execute(
        'CREATE TABLE dogs(id INTEGER PRIMARY KEY AUTOINCREMENT, name TEXT, age INTEGER)',
      );
    },
    version: 1,
  );
}

Future<Dog> getById(int id) async {
  final Database db = await database;
  final List<Map<String, dynamic>> maps =
      await db.rawQuery('SELECT * FROM dogs WHERE id = $id');

  if (maps.isNotEmpty) {
    return Dog(
      id: maps[0]['id'] as int,
      name: maps[0]['name'] as String,
      age: maps[0]['age'] as int,
    );
  }

  throw Exception('Id $id not found');
}

Future<void> insertDog(Dog dog) async {
  final db = await database;
  await db.insert(
    'dogs',
    dog.toMap(),
    conflictAlgorithm: ConflictAlgorithm.replace,
  );
}

Future<List<Dog>> dogs() async {
  // Get a reference to the database.
  final db = await database;

  // Query the table for all The Dogs.
  final List<Map<String, dynamic>> maps = await db.query('dogs');

  // Convert the List<Map<String, dynamic> into a List<Dog>.
  return List.generate(maps.length, (i) {
    return Dog(
      id: maps[i]['id'] as int,
      name: maps[i]['name'] as String,
      age: maps[i]['age'] as int,
    );
  });
}

Future<void> updateDog(Dog dog) async {
  // Get a reference to the database.
  final db = await database;

  // Update the given Dog.
  await db.update(
    'dogs',
    dog.toMap(),
    // Ensure that the Dog has a matching id.
    where: 'id = ?',
    // Pass the Dog's id as a whereArg to prevent SQL injection.
    whereArgs: [dog.id],
  );
}

Future<void> deleteDog(int id) async {
  // Get a reference to the database.
  final db = await database;

  // Remove the Dog from the database.
  await db.delete(
    'dogs',
    // Use a where clause to delete a specific dog.
    where: 'id = ?',
    // Pass the Dog's id as a whereArg to prevent SQL injection.
    whereArgs: [id],
  );
}
