import 'dart:io';

import 'package:moor/ffi.dart';
import 'package:moor/moor.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';
import 'package:stock_price_tracker/models/stock.dart' as data_model;

part 'database.g.dart';

/// Stock Database Table
@DataClassName('Stock')
class Stocks extends Table {
  /// stock id for uniqueness
  IntColumn get id => integer().autoIncrement()();

  /// sid (short id) of the stock
  TextColumn get sid => text()();

  /// price of the stock
  RealColumn get price => real()();

  /// close of the stock
  RealColumn get close => real()();

  /// change of the stock
  RealColumn get change => real()();

  /// high of the stock
  RealColumn get high => real()();

  /// low of the stock
  RealColumn get low => real()();

  /// volume of the stock
  IntColumn get volume => integer()();

  /// date of the stock
  TextColumn get date => text()();
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'stock_price_tracker.sqlite'));
    return VmDatabase(file);
  });
}

/// App Database
@UseMoor(tables: [Stocks])
class MyDatabase extends _$MyDatabase {
  /// we tell the database where to store the data with this constructor
  MyDatabase() : super(_openConnection());

  /// stream of stocks
  Stream<List<Stock>> watchStock(String sid) {
    return (select(stocks)..where((tbl) => tbl.sid.equals(sid))).watch();
  }

  /// add stocks
  Future<void> addStocks(List<StocksCompanion> entries) async {
    await batch((batch) {
      batch.insertAll(stocks, entries);
    });
  }

  /// bump this number whenever you change or add a table definition.
  @override
  int get schemaVersion => 1;
}

/// helper to convert Stock data model to StocksCompanion
StocksCompanion stockDataModelToStockCompanion(data_model.Stock s) {
  return StocksCompanion(
    sid: Value<String>(s.sid),
    price: Value<double>(s.price),
    close: Value<double>(s.close),
    change: Value<double>(s.change),
    high: Value<double>(s.high),
    low: Value<double>(s.low),
    volume: Value<int>(s.volume),
    date: Value<String>(s.date),
  );
}
