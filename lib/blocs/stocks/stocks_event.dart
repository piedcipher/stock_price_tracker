/// base class for stocks event
abstract class StocksEvent {
  /// constructs this event
  const StocksEvent();
}

/// fetches list of stocks from API
class StocksFetchEvent extends StocksEvent {
  /// constructs this event
  const StocksFetchEvent(this.stocks);

  /// stocks fetched from server
  final List<String> stocks;
}
