import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stock_price_tracker/api/api_client.dart';
import 'package:stock_price_tracker/blocs/stocks/stocks_event.dart';
import 'package:stock_price_tracker/blocs/stocks/stocks_state.dart';

/// takes care of state-management & business logic for home and history pages
class StocksBloc extends Bloc<StocksEvent, StocksState> {
  /// constructs this bloc
  StocksBloc(this._tickerTapeApiClient) : super(const StocksInitialState());

  final TickerTapeApiClient _tickerTapeApiClient;

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
      yield StocksLoadedState(stocks.data);
    } on Exception catch (e) {
      yield StocksErrorState(e.toString());
    }
  }
}
