///handler will help to ccreate function CRUD SQLite
///
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqlite/models/user.dart';

class DBHandler {
  //1. Initialiase DB

  Future<Database> initialiseDB() async {
    String path = await getDatabasePath();
    return openDatabase(
      join(path, 'mydatabase.db'),
      onCreate: (db, version) async {
        await db.execute(
            'CREATE TABLE users(id INTEGER PRIMARY KEY AUTOINCREMENT, name TEXT, age INTEGER, country TEXT, email TEXT');
      },
      version: 1,
    );
  }
  //2. Insert Initial Data

  Future<int> insertUsers(List<User> users) async {
    int result = 0;
    final Database db = await initialiseDB();
    //do a loop to insert
    for (var user in users) {
      result = await db.insert('users', user.toMap());
    }
    return result; //if successful will tell how manu data inserted
  }

  //3. Insert Data
  Future<int> insertUser(User user) async {
    int result = 0;
    final Database db = await initialiseDB();
    //do a loop to insert
    // for (var users in user) {
    result = await db.insert('users', user.toMap());
    // }
    return result; //if successful will tell how manu data inserted
  }

  //4. Read Data

  Future<List<User>> retrieveUsers() async {
    final Dtabase db = await initialiseDB();
    List<Map<String, Object?>> queryResult = await db.query('users');
    return queryResult.map((e) => User.fromMap(e)).toList();
  }

  //5. Update Data
  Future<void> updateUser(User user) async {
    final Database db = await initialiseDB();
    await db.update(
      'users',
      user.toMap(),
      where: 'id = ?',
      whereArgs: [user.id],

    );
  }
  //6.delete 
    Future<void> deleteUser(int id) async {
    final Database db = await initialiseDB();
    await db.delete(
      'users',
      where: 'id = ?',
      whereArgs: [id],
    );
  }
}
