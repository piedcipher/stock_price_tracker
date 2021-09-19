import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stock_price_tracker/blocs/history/history_event.dart';
import 'package:stock_price_tracker/blocs/history/history_state.dart';
import 'package:stock_price_tracker/database/database.dart';

/// takes care of state-management & business logic for history page
class HistoryBloc extends Bloc<HistoryEvent, HistoryState> {
  /// constructs this bloc
  HistoryBloc(this._tickerTapeDatabase) : super(const HistoryInitialState());

  final MyDatabase _tickerTapeDatabase;
  StreamSubscription? _stockHistoryStreamSubscription;

  @override
  Stream<HistoryState> mapEventToState(HistoryEvent event) async* {
    if (event is HistoryLoadEvent) {
      yield* _mapHistoryLoadEventToState(event);
    } else if (event is HistoryDispatchEvent) {
      yield* _mapHistoryDispatchEventToState(event);
    }
  }

  Stream<HistoryState> _mapHistoryLoadEventToState(
    HistoryLoadEvent event,
  ) async* {
    try {
      yield const HistoryLoadingState();
      await _stockHistoryStreamSubscription?.cancel();
      _stockHistoryStreamSubscription =
          _tickerTapeDatabase.watchStock(event.sid).listen(
        (history) async {
          add(HistoryDispatchEvent(history));
        },
      );
    } on Exception catch (e) {
      yield HistoryErrorState(e.toString());
    }
  }

  Stream<HistoryState> _mapHistoryDispatchEventToState(
    HistoryDispatchEvent event,
  ) async* {
    yield HistoryLoadedState(event.history);
  }
}
