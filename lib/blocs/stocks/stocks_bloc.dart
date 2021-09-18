import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stock_price_tracker/api/api_client.dart';
import 'package:stock_price_tracker/blocs/stocks/stocks_event.dart';
import 'package:stock_price_tracker/blocs/stocks/stocks_state.dart';
import 'package:stock_price_tracker/database/database.dart';

/// takes care of state-management & business logic for home and history pages
class StocksBloc extends Bloc<StocksEvent, StocksState> {
  /// constructs this bloc
  StocksBloc(
    this._tickerTapeApiClient,
    this._tickerTapeDatabase,
  ) : super(const StocksInitialState());

  final TickerTapeApiClient _tickerTapeApiClient;
  final MyDatabase _tickerTapeDatabase;

  @override
  Stream<StocksState> mapEventToState(StocksEvent event) async* {
    if (event is StocksFetchEvent) {
      yield* _mapStocksFetchEventToState(event);
    }
  }

  Stream<StocksState> _mapStocksFetchEventToState(
    StocksFetchEvent event,
  ) async* {
    try {
      yield const StocksLoadingState();
      final stocks = await _tickerTapeApiClient.getStocks(
        <String, dynamic>{
          'sids': event.stocks.join(','),
        },
      );
      if (stocks.success) {
        await _tickerTapeDatabase.addStocks(
          stocks.data.map(stockDataModelToStockCompanion).toList(),
        );
        yield StocksLoadedState(stocks.data);
      } else {
        yield const StocksErrorState('Error');
      }
    } on Exception catch (e) {
      yield StocksErrorState(e.toString());
    }
  }
}
