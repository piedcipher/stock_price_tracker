// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'stock.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Stock _$StockFromJson(Map<String, dynamic> json) => Stock(
      sid: json['sid'] as String,
      price: (json['price'] as num).toDouble(),
      close: (json['close'] as num).toDouble(),
      change: (json['change'] as num).toDouble(),
      high: (json['high'] as num).toDouble(),
      low: (json['low'] as num).toDouble(),
      volume: json['volume'] as int,
      date: json['date'] as String,
    );

Map<String, dynamic> _$StockToJson(Stock instance) => <String, dynamic>{
      'sid': instance.sid,
      'price': instance.price,
      'close': instance.close,
      'change': instance.change,
      'high': instance.high,
      'low': instance.low,
      'volume': instance.volume,
      'date': instance.date,
    };
