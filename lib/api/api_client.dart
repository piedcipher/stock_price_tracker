import 'package:dio/dio.dart' hide Headers;
import 'package:retrofit/retrofit.dart';
import 'package:stock_price_tracker/models/api_response.dart';
import 'package:stock_price_tracker/models/stock.dart';

part 'api_client.g.dart';

/// rest client for TickerTape's API.
@RestApi(baseUrl: 'https://api.tickertape.in/')
abstract class TickerTapeApiClient {
  /// constructs rest client for TickerTape's API.
  factory TickerTapeApiClient(
    Dio dio,
  ) = _TickerTapeApiClient;

  /// fetches list of stocks
  @GET('/stocks/quotes')
  Future<ApiResponse<List<Stock>>> getStocks(
    @Queries() Map<String, dynamic> stocks,
  );
}
