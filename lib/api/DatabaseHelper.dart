import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHelper {
  String dbName="example.db";
  DatabaseHelper._privateConstructor();

  static final DatabaseHelper instance = DatabaseHelper._privateConstructor();

  static Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }


  Future<Database> _initDatabase() async {
    String path = join(await getDatabasesPath(), "example.db");
    return await openDatabase(
      path,
      version: 4,
      onCreate: _onCreate,
    );
  }

  // Create the tables
  Future _onCreate(Database db, int version) async {
    await db.execute(
      "CREATE TABLE items(id INTEGER PRIMARY KEY AUTOINCREMENT, ticketName TEXT, date TEXT)",
    );
    await db.execute(
      "CREATE TABLE users(id INTEGER PRIMARY KEY, username TEXT, email TEXT)",
    );
  }
  Future<void> insertItem2<T extends DatabaseModel>(T item,String modelName) async {
    final db = await database;
    await db.insert(
      modelName,
      item.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }
  // Insert item
  Future<void> insertItem(Item item) async {
    final db = await database;
    await db.insert(
      'items',
      item.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  // Get all items
  Future<List<Item>> getItems() async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query('items');
    return List.generate(maps.length, (i) {
      return Item(
        id:maps[i]['id'],
        ticketName: maps[i]['ticketName'],
        date: maps[i]['date'],
      );
    });
  }

  // Update item
  // Future<void> updateItem<T extends DatabaseModel>(T item,String modelName,String updateValue) async{
   Future<void> updateItem(Item item,String modelName,String updateValue) async{
    final db = await database;
    await db.update(
      modelName,
      item.toMap(),
      where: "ticketName= ?",
      whereArgs: [item.ticketName],
    );
  }

  // Delete item
  Future<void> deleteItem(int id) async {
    final db = await database;
    await db.delete(
      'items',
      where: "id = ?",
      whereArgs: [id],
    );
  }

  // Insert user
  Future<void> insertUser(User user) async {
    final db = await database;
    await db.insert(
      'users',
      user.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  // Get all users
  Future<List<User>> getUsers() async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query('users');
    return List.generate(maps.length, (i) {
      return User(
        id: maps[i]['id'],
        username: maps[i]['username'],
        email: maps[i]['email'],
      );
    });
  }

  // Update user
  Future<void> updateUser(User user) async {
    final db = await database;
    await db.update(
      'users',
      user.toMap(),
      where: "id = ?",
      whereArgs: [user.id],
    );
  }

  // Delete user
  Future<void> deleteUser(int id) async {
    final db = await database;
    await db.delete(
      'users',
      where: "id = ?",
      whereArgs: [id],
    );
  }
}

// Define the Item model
class Item implements DatabaseModel{
  final int id;
  final String ticketName;
  final String date;

  Item({required this.id, required this.ticketName, required this.date});

  Map<String, dynamic> toMap() {
    return {
      'id':id,
      'ticketName': ticketName,
      'date': date,
    };
  }
}

// Define the User model
class User implements DatabaseModel {
  final int id;
  final String username;
  final String email;

  User({required this.id, required this.username, required this.email});

  @override
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'username': username,
      'email': email,
    };
  }

  @override
  String toString() {
    return 'User{id: $id, username: $username, email: $email}';
  }
}

abstract class DatabaseModel {
  Map<String, dynamic> toMap();
}
