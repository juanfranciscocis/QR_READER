


import 'dart:io';

import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite/sqlite_api.dart';
import 'package:path/path.dart';

import '../models/scan_model_model.dart';
export '../models/scan_model_model.dart';

class DBProvider{

  static Database? _database;
  static final DBProvider db = DBProvider._();

  DBProvider._();

  Future<Database?> get database async {
    if(_database != null) return _database;
    _database = await initDB();
    return _database;
  }

  Future<Database> initDB() async{

    //path where the database will be stored
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    final path = join(documentsDirectory.path, 'ScansDB.db');
    print(path);

    //Create the database
    return await openDatabase(
      path,
      version: 1,
      onOpen: (db){},
      onCreate: (Database db, int version) async{
        await db.execute('''
          CREATE TABLE Scans (
          id INTEGER PRIMARY KEY,
          tipo TEXT,
          valor TEXT
          )
        ''');

      }
    );

  }

  //Create a new Scan
  Future<int?> newScanRaw(ScanModel scan) async{

    final id  = scan.id;
    final tipo = scan.tipo;
    final valor = scan.valor;

    //Get the database
    final db = await database;

    //Insert the new Scan
    final response = await db?.rawInsert('''
      INSERT INTO Scans (id, tipo, valor)
      VALUES ( $id , '$tipo', '$valor')
    '''
    );

    return response;

  }

//Create a new Scan Store it in the database and return the id
  Future<int?> newScan (ScanModel scan) async{
     final db = await database;
     final response = await db?.insert('Scans', scan.toJson());
     print(response);
     return response;
  }


  //Get Scans by int id
  Future<ScanModel>getScanById ( int index ) async {
    final db = await database;
    final response = await db?.query('Scans', where: 'id = ?', whereArgs: [index]);
    return ScanModel.fromJson(response!.first);
  }



  //Get All Scans
  Future<List<ScanModel>> getAllScans () async {
    final db = await database;
    final response = await db?.query('Scans');
    return response!.map((scan) => ScanModel.fromJson(scan)).toList();
  }

  //Get Scans by type
  Future<List<ScanModel>>getScanByType ( String type ) async {
    final db = await database;
    final response = await db!.rawQuery('''
      SELECT * FROM Scans
      WHERE tipo = '$type'
    ''');

    return response.isNotEmpty? response.map((scan) => ScanModel.fromJson(scan)).toList():[];
  }

  //Update Scan data
  Future<int> updateScan (ScanModel scan) async {
    final db = await database;
    final response  = await db!.update('Scans', scan.toJson(), where: 'id = ?', whereArgs: [scan.id]);
    return response;
  }

  //Delete Scan data
  Future<int> deleteScan (int index) async {
    final db = await database;
    final response = await db!.delete('Scans', where: 'id = ?', whereArgs: [index]);
    return response;
  }

  //Delete All Scans data
  Future<int> deleteAllScans () async {
    final db = await database;
    final response = await db!.delete('Scans');
    return response;
  }


}