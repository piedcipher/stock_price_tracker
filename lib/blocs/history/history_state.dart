import 'package:stock_price_tracker/database/database.dart';

/// base class for history state
abstract class HistoryState {
  /// constructs this state
  const HistoryState();
}

/// initial state of the bloc
class HistoryInitialState extends HistoryState {
  /// constructs this state
  const HistoryInitialState();
}

/// indicates bloc is processing the request
class HistoryLoadingState extends HistoryState {
  /// constructs this state
  const HistoryLoadingState();
}

/// indicates history data is loaded by the bloc
class HistoryLoadedState extends HistoryState {
  /// constructs this state
  const HistoryLoadedState(this.history);

  /// list of fetched history
  final List<Stock> history;
}

/// indicates an error while processing the request by the bloc
class HistoryErrorState extends HistoryState {
  /// constructs this state
  const HistoryErrorState(this.error);

  /// error occurred while processing the request
  final String error;
}
