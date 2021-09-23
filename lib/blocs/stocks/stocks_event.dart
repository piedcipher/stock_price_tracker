/// base class for stocks event
abstract class StocksEvent {
  /// constructs this event
  const StocksEvent();
}

/// fetches list of stocks from API
class StocksFetchEvent extends StocksEvent {
  /// constructs this event
  const StocksFetchEvent(this.stocks, {this.shouldStoreInDatabase = true});

  /// stocks fetched from server
  final List<String> stocks;

  /// flag to indicate whether to store data in the database or not
  final bool shouldStoreInDatabase;
}
