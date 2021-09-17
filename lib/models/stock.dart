import 'package:json_annotation/json_annotation.dart';

part 'stock.g.dart';

/// api response for stock
@JsonSerializable()
class Stock {
  /// constructs stock model
  Stock({
    required this.sid,
    required this.price,
    required this.close,
    required this.change,
    required this.high,
    required this.low,
    required this.volume,
    required this.date,
  });

  /// constructs stock object from json
  factory Stock.fromJson(Map<String, dynamic> json) => _$StockFromJson(json);

  /// constructs json from stock object
  Map<String, dynamic> toJson() => _$StockToJson(this);

  /// sid
  final String sid;

  /// price
  final double price;

  /// close
  final double close;

  /// change
  final double change;

  /// high
  final double high;

  /// low
  final double low;

  /// price
  final int volume;

  /// date
  final String date;
}
