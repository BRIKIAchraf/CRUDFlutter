import 'package:sqflite/sqflite.dart' as sql;
class SQLHelper {
  static Future<void> createTables(sql.Database database) async {
    await database.execute("""CREATE TABLE data(
    id INTEGER PRIMARY KEY AUTOINCREAMENT NOT NULL,
    title TEXT,
    desc TEXT,
    createdAt TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
    )""");
  }
  static Future<sql.Database> db() async{
    return sql.openDatabase("database_name.db" , version: 1,
      onCreate: (sql.Database database, int version)async{
      await createTables(database);
      });
  }
}