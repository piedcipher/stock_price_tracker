import 'package:stock_price_tracker/database/database.dart';

/// base class for history event
abstract class HistoryEvent {
  /// constructs this event
  const HistoryEvent();
}

/// loads data history of a stock from local storage
class HistoryLoadEvent extends HistoryEvent {
  /// constructs this event
  const HistoryLoadEvent(this.sid);

  /// sid of the stock
  final String sid;
}

/// dispatches data history of a stock from local storage to UI
class HistoryDispatchEvent extends HistoryEvent {
  /// constructs this event
  const HistoryDispatchEvent(this.history);

  /// data history of a stock from local storage
  final List<Stock> history;
}
