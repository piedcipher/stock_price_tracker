import 'package:json_annotation/json_annotation.dart';

part 'api_response.g.dart';

/// base response for api response
@JsonSerializable(genericArgumentFactories: true)
class ApiResponse<T> {
  /// constructs ApiResponse model
  ApiResponse({
    required this.success,
    required this.data,
  });

  /// constructs api response object from json
  factory ApiResponse.fromJson(
          Map<String, dynamic> json, T Function(Object? json) fromJsonT) =>
      _$ApiResponseFromJson<T>(json, fromJsonT);

  /// constructs json from api response object
  Map<String, dynamic> toJson(Object Function(T value) toJsonT) =>
      _$ApiResponseToJson(this, toJsonT);

  /// response data
  final T data;

  /// flag to indicate whether request was successful or not
  final bool success;
}
