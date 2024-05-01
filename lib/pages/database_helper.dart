import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import '../pages/vehicle_data.dart';

class DatabaseHelper {
  static Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;

    // If _database is null, initialize it
    _database = await initDatabase();
    return _database!;
  }

  Future<Database> initDatabase() async {
    // Get a location using getDatabasesPath
    var databasesPath = await getDatabasesPath();
    String path = join(databasesPath, 'your_database_name.db');

    // Open the database, can also create the database here
    return await openDatabase(path, version: 1, onCreate: _createTable);
  }

  Future<void> _createTable(Database db, int version) async {
    await db.execute('''
      CREATE TABLE IF NOT EXISTS vehicles (
        id INTEGER PRIMARY KEY,
        vehicleNumber TEXT,
        vehicleMake TEXT,
        vehicleModel TEXT,
        fuelType TEXT
      )
    ''');
  }

  Future<VehicleData> fetchDataFromDatabase(int containerId) async {
    final db = await database;
    List<Map<String, dynamic>> maps = await db.query(
      'vehicles',
      where: 'id = ?',
      whereArgs: [containerId],
    );

    if (maps.isNotEmpty) {
      return VehicleData.fromMap(maps.first);
    } else {
      throw Exception('No data found for containerId: $containerId');
    }
  }

// Add other database operations such as insert, update, delete here
}
