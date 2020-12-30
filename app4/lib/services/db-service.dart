//Put all Database methods here. Use
//the Dogs sqLite demo as your template.

import 'dart:ffi';

import 'package:path/path.dart' as pathPackage;
import 'package:sqflite/sqflite.dart' as sqflitePackage;

import 'package:stock_watcher/models/stock.dart';

class DatabaseHelper{
  sqflitePackage.Database db;

  Future<void> getOrCreateDatabase() async{
    var databasePath = await sqflitePackage.getDatabasesPath();
    var path = pathPackage.join(databasePath, 'stock_database.db');
    print("$path");
    db = await sqflitePackage.openDatabase(
      path,
      onCreate: (sqflitePackage.Database db1, int version) async{
        await db1.execute(
          "CREATE TABLE stocks(symbol TEXT PRIMARY KEY, name TEXT, price INTEGER)"
        );
      },
      version: 1
    );
    print('$db');
  }

  Future<void> insertStock(Stock stock) async{
    await db.insert(
      'stocks',
      stock.toMap(),
      conflictAlgorithm: sqflitePackage.ConflictAlgorithm.replace
    );
  }

  Future<List<Stock>> getStocksFromDB() async{
    final List<Map<String, dynamic>> stockMap = await db.query('stocks');
    return List.generate(stockMap.length, (i){
      return Stock(
        stockMap[i]['symbol'], 
        stockMap[i]['name'], 
        stockMap[i]['price'],
        );
    });
  }

  Future<void> printStocksFromDB() async{
    List<Stock> listOfStock = await this.getStocksFromDB();
    if (listOfStock.length == 0){
      print('No stock in list');
    }
    else{
      listOfStock.forEach((element) {
        print('symbol: ${element.symbol}, name: ${element.name}, price ${element.price}');
       });
    }
  }

  Future<void> deleteStock(Stock stock) async{
    await db.delete(
      'stocks',
      where: "symbol = ?",
      whereArgs: [stock.symbol]
    );
  }
}