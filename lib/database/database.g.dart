// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// **************************************************************************
// MoorGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps, unnecessary_this
class Stock extends DataClass implements Insertable<Stock> {
  /// stock id for uniqueness
  final int id;

  /// sid (short id) of the stock
  final String sid;

  /// price of the stock
  final double price;

  /// close of the stock
  final double close;

  /// change of the stock
  final double change;

  /// high of the stock
  final double high;

  /// low of the stock
  final double low;

  /// volume of the stock
  final int volume;

  /// date of the stock
  final String date;
  Stock(
      {required this.id,
      required this.sid,
      required this.price,
      required this.close,
      required this.change,
      required this.high,
      required this.low,
      required this.volume,
      required this.date});
  factory Stock.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return Stock(
      id: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}id'])!,
      sid: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}sid'])!,
      price: const RealType()
          .mapFromDatabaseResponse(data['${effectivePrefix}price'])!,
      close: const RealType()
          .mapFromDatabaseResponse(data['${effectivePrefix}close'])!,
      change: const RealType()
          .mapFromDatabaseResponse(data['${effectivePrefix}change'])!,
      high: const RealType()
          .mapFromDatabaseResponse(data['${effectivePrefix}high'])!,
      low: const RealType()
          .mapFromDatabaseResponse(data['${effectivePrefix}low'])!,
      volume: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}volume'])!,
      date: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}date'])!,
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['sid'] = Variable<String>(sid);
    map['price'] = Variable<double>(price);
    map['close'] = Variable<double>(close);
    map['change'] = Variable<double>(change);
    map['high'] = Variable<double>(high);
    map['low'] = Variable<double>(low);
    map['volume'] = Variable<int>(volume);
    map['date'] = Variable<String>(date);
    return map;
  }

  StocksCompanion toCompanion(bool nullToAbsent) {
    return StocksCompanion(
      id: Value(id),
      sid: Value(sid),
      price: Value(price),
      close: Value(close),
      change: Value(change),
      high: Value(high),
      low: Value(low),
      volume: Value(volume),
      date: Value(date),
    );
  }

  factory Stock.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return Stock(
      id: serializer.fromJson<int>(json['id']),
      sid: serializer.fromJson<String>(json['sid']),
      price: serializer.fromJson<double>(json['price']),
      close: serializer.fromJson<double>(json['close']),
      change: serializer.fromJson<double>(json['change']),
      high: serializer.fromJson<double>(json['high']),
      low: serializer.fromJson<double>(json['low']),
      volume: serializer.fromJson<int>(json['volume']),
      date: serializer.fromJson<String>(json['date']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'sid': serializer.toJson<String>(sid),
      'price': serializer.toJson<double>(price),
      'close': serializer.toJson<double>(close),
      'change': serializer.toJson<double>(change),
      'high': serializer.toJson<double>(high),
      'low': serializer.toJson<double>(low),
      'volume': serializer.toJson<int>(volume),
      'date': serializer.toJson<String>(date),
    };
  }

  Stock copyWith(
          {int? id,
          String? sid,
          double? price,
          double? close,
          double? change,
          double? high,
          double? low,
          int? volume,
          String? date}) =>
      Stock(
        id: id ?? this.id,
        sid: sid ?? this.sid,
        price: price ?? this.price,
        close: close ?? this.close,
        change: change ?? this.change,
        high: high ?? this.high,
        low: low ?? this.low,
        volume: volume ?? this.volume,
        date: date ?? this.date,
      );
  @override
  String toString() {
    return (StringBuffer('Stock(')
          ..write('id: $id, ')
          ..write('sid: $sid, ')
          ..write('price: $price, ')
          ..write('close: $close, ')
          ..write('change: $change, ')
          ..write('high: $high, ')
          ..write('low: $low, ')
          ..write('volume: $volume, ')
          ..write('date: $date')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(
      id.hashCode,
      $mrjc(
          sid.hashCode,
          $mrjc(
              price.hashCode,
              $mrjc(
                  close.hashCode,
                  $mrjc(
                      change.hashCode,
                      $mrjc(
                          high.hashCode,
                          $mrjc(low.hashCode,
                              $mrjc(volume.hashCode, date.hashCode)))))))));
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Stock &&
          other.id == this.id &&
          other.sid == this.sid &&
          other.price == this.price &&
          other.close == this.close &&
          other.change == this.change &&
          other.high == this.high &&
          other.low == this.low &&
          other.volume == this.volume &&
          other.date == this.date);
}

class StocksCompanion extends UpdateCompanion<Stock> {
  final Value<int> id;
  final Value<String> sid;
  final Value<double> price;
  final Value<double> close;
  final Value<double> change;
  final Value<double> high;
  final Value<double> low;
  final Value<int> volume;
  final Value<String> date;
  const StocksCompanion({
    this.id = const Value.absent(),
    this.sid = const Value.absent(),
    this.price = const Value.absent(),
    this.close = const Value.absent(),
    this.change = const Value.absent(),
    this.high = const Value.absent(),
    this.low = const Value.absent(),
    this.volume = const Value.absent(),
    this.date = const Value.absent(),
  });
  StocksCompanion.insert({
    this.id = const Value.absent(),
    required String sid,
    required double price,
    required double close,
    required double change,
    required double high,
    required double low,
    required int volume,
    required String date,
  })  : sid = Value(sid),
        price = Value(price),
        close = Value(close),
        change = Value(change),
        high = Value(high),
        low = Value(low),
        volume = Value(volume),
        date = Value(date);
  static Insertable<Stock> custom({
    Expression<int>? id,
    Expression<String>? sid,
    Expression<double>? price,
    Expression<double>? close,
    Expression<double>? change,
    Expression<double>? high,
    Expression<double>? low,
    Expression<int>? volume,
    Expression<String>? date,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (sid != null) 'sid': sid,
      if (price != null) 'price': price,
      if (close != null) 'close': close,
      if (change != null) 'change': change,
      if (high != null) 'high': high,
      if (low != null) 'low': low,
      if (volume != null) 'volume': volume,
      if (date != null) 'date': date,
    });
  }

  StocksCompanion copyWith(
      {Value<int>? id,
      Value<String>? sid,
      Value<double>? price,
      Value<double>? close,
      Value<double>? change,
      Value<double>? high,
      Value<double>? low,
      Value<int>? volume,
      Value<String>? date}) {
    return StocksCompanion(
      id: id ?? this.id,
      sid: sid ?? this.sid,
      price: price ?? this.price,
      close: close ?? this.close,
      change: change ?? this.change,
      high: high ?? this.high,
      low: low ?? this.low,
      volume: volume ?? this.volume,
      date: date ?? this.date,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (sid.present) {
      map['sid'] = Variable<String>(sid.value);
    }
    if (price.present) {
      map['price'] = Variable<double>(price.value);
    }
    if (close.present) {
      map['close'] = Variable<double>(close.value);
    }
    if (change.present) {
      map['change'] = Variable<double>(change.value);
    }
    if (high.present) {
      map['high'] = Variable<double>(high.value);
    }
    if (low.present) {
      map['low'] = Variable<double>(low.value);
    }
    if (volume.present) {
      map['volume'] = Variable<int>(volume.value);
    }
    if (date.present) {
      map['date'] = Variable<String>(date.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('StocksCompanion(')
          ..write('id: $id, ')
          ..write('sid: $sid, ')
          ..write('price: $price, ')
          ..write('close: $close, ')
          ..write('change: $change, ')
          ..write('high: $high, ')
          ..write('low: $low, ')
          ..write('volume: $volume, ')
          ..write('date: $date')
          ..write(')'))
        .toString();
  }
}

class $StocksTable extends Stocks with TableInfo<$StocksTable, Stock> {
  final GeneratedDatabase _db;
  final String? _alias;
  $StocksTable(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  late final GeneratedColumn<int?> id = GeneratedColumn<int?>(
      'id', aliasedName, false,
      typeName: 'INTEGER',
      requiredDuringInsert: false,
      defaultConstraints: 'PRIMARY KEY AUTOINCREMENT');
  final VerificationMeta _sidMeta = const VerificationMeta('sid');
  late final GeneratedColumn<String?> sid = GeneratedColumn<String?>(
      'sid', aliasedName, false,
      typeName: 'TEXT', requiredDuringInsert: true);
  final VerificationMeta _priceMeta = const VerificationMeta('price');
  late final GeneratedColumn<double?> price = GeneratedColumn<double?>(
      'price', aliasedName, false,
      typeName: 'REAL', requiredDuringInsert: true);
  final VerificationMeta _closeMeta = const VerificationMeta('close');
  late final GeneratedColumn<double?> close = GeneratedColumn<double?>(
      'close', aliasedName, false,
      typeName: 'REAL', requiredDuringInsert: true);
  final VerificationMeta _changeMeta = const VerificationMeta('change');
  late final GeneratedColumn<double?> change = GeneratedColumn<double?>(
      'change', aliasedName, false,
      typeName: 'REAL', requiredDuringInsert: true);
  final VerificationMeta _highMeta = const VerificationMeta('high');
  late final GeneratedColumn<double?> high = GeneratedColumn<double?>(
      'high', aliasedName, false,
      typeName: 'REAL', requiredDuringInsert: true);
  final VerificationMeta _lowMeta = const VerificationMeta('low');
  late final GeneratedColumn<double?> low = GeneratedColumn<double?>(
      'low', aliasedName, false,
      typeName: 'REAL', requiredDuringInsert: true);
  final VerificationMeta _volumeMeta = const VerificationMeta('volume');
  late final GeneratedColumn<int?> volume = GeneratedColumn<int?>(
      'volume', aliasedName, false,
      typeName: 'INTEGER', requiredDuringInsert: true);
  final VerificationMeta _dateMeta = const VerificationMeta('date');
  late final GeneratedColumn<String?> date = GeneratedColumn<String?>(
      'date', aliasedName, false,
      typeName: 'TEXT', requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns =>
      [id, sid, price, close, change, high, low, volume, date];
  @override
  String get aliasedName => _alias ?? 'stocks';
  @override
  String get actualTableName => 'stocks';
  @override
  VerificationContext validateIntegrity(Insertable<Stock> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('sid')) {
      context.handle(
          _sidMeta, sid.isAcceptableOrUnknown(data['sid']!, _sidMeta));
    } else if (isInserting) {
      context.missing(_sidMeta);
    }
    if (data.containsKey('price')) {
      context.handle(
          _priceMeta, price.isAcceptableOrUnknown(data['price']!, _priceMeta));
    } else if (isInserting) {
      context.missing(_priceMeta);
    }
    if (data.containsKey('close')) {
      context.handle(
          _closeMeta, close.isAcceptableOrUnknown(data['close']!, _closeMeta));
    } else if (isInserting) {
      context.missing(_closeMeta);
    }
    if (data.containsKey('change')) {
      context.handle(_changeMeta,
          change.isAcceptableOrUnknown(data['change']!, _changeMeta));
    } else if (isInserting) {
      context.missing(_changeMeta);
    }
    if (data.containsKey('high')) {
      context.handle(
          _highMeta, high.isAcceptableOrUnknown(data['high']!, _highMeta));
    } else if (isInserting) {
      context.missing(_highMeta);
    }
    if (data.containsKey('low')) {
      context.handle(
          _lowMeta, low.isAcceptableOrUnknown(data['low']!, _lowMeta));
    } else if (isInserting) {
      context.missing(_lowMeta);
    }
    if (data.containsKey('volume')) {
      context.handle(_volumeMeta,
          volume.isAcceptableOrUnknown(data['volume']!, _volumeMeta));
    } else if (isInserting) {
      context.missing(_volumeMeta);
    }
    if (data.containsKey('date')) {
      context.handle(
          _dateMeta, date.isAcceptableOrUnknown(data['date']!, _dateMeta));
    } else if (isInserting) {
      context.missing(_dateMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Stock map(Map<String, dynamic> data, {String? tablePrefix}) {
    return Stock.fromData(data, _db,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $StocksTable createAlias(String alias) {
    return $StocksTable(_db, alias);
  }
}

abstract class _$MyDatabase extends GeneratedDatabase {
  _$MyDatabase(QueryExecutor e) : super(SqlTypeSystem.defaultInstance, e);
  late final $StocksTable stocks = $StocksTable(this);
  @override
  Iterable<TableInfo> get allTables => allSchemaEntities.whereType<TableInfo>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [stocks];
}
