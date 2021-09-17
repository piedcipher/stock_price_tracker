import 'package:stock_price_tracker/models/stock.dart';

/// base class for stocks state
abstract class StocksState {
  /// constructs this state
  const StocksState();
}

/// initial state of the bloc
class StocksInitialState extends StocksState {
  /// constructs this state
  const StocksInitialState();
}

/// indicates bloc is processing the request
class StocksLoadingState extends StocksState {
  /// constructs this state
  const StocksLoadingState();
}

/// indicates data is loaded by the bloc
class StocksLoadedState extends StocksState {
  /// constructs this state
  const StocksLoadedState(this.stocks);

  /// list of fetched stocks
  final List<Stock> stocks;
}

/// indicates an error while processing the request by the bloc
class StocksErrorState extends StocksState {
  /// constructs this state
  const StocksErrorState(this.error);

  /// error occurred while processing the request
  final String error;
}
