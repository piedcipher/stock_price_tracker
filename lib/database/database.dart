import 'dart:io';

import 'package:moor/ffi.dart';
import 'package:moor/moor.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';

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
  Stream<List<Stock>> get watchStocks => select(stocks).watch();

  /// add a stock
  Future<int> addStock(StocksCompanion entry) => into(stocks).insert(entry);

  /// bump this number whenever you change or add a table definition.
  @override
  int get schemaVersion => 1;
}
