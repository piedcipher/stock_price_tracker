import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stock_price_tracker/api/api_client.dart';
import 'package:stock_price_tracker/blocs/stocks/stocks_bloc.dart';
import 'package:stock_price_tracker/blocs/stocks/stocks_event.dart';
import 'package:stock_price_tracker/blocs/stocks/stocks_state.dart';
import 'package:stock_price_tracker/core/constants/stocks.dart';
import 'package:stock_price_tracker/core/navigation/routes.dart';
import 'package:stock_price_tracker/database/database.dart';
import 'package:stock_price_tracker/models/stock.dart' as data_model;

/// home page shows list of stocks
class HomePage extends StatefulWidget {
  /// constructs home page
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late StocksBloc _stocksBloc;
  bool _liveMode = false;
  late StreamSubscription _stockUpdateStreamSubscription;
  List<data_model.Stock> _latestStockValues = [];

  @override
  void initState() {
    super.initState();
    _stocksBloc = StocksBloc(
      context.read<TickerTapeApiClient>(),
      context.read<MyDatabase>(),
    )..add(
        StocksFetchEvent(
          stocksToTrack.values.toList(),
          shouldStoreInDatabase: false,
        ),
      );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Stocks'),
        actions: [
          IconButton(
            onPressed: () async {
              if (_latestStockValues.isNotEmpty) {
                _latestStockValues.sort(
                  (prev, current) => prev.price.compareTo(current.price),
                );
                await Navigator.pushNamed(
                  context,
                  Routes.historyPage,
                  arguments: _latestStockValues.last.sid,
                );
              }
            },
            icon: const Icon(Icons.bar_chart),
          ),
          IconButton(
            onPressed: () {
              setState(() {
                _liveMode = !_liveMode;
              });
              if (_liveMode) {
                _stockUpdateStreamSubscription =
                    Stream<void>.periodic(const Duration(seconds: 5))
                        .listen((event) {
                  _stocksBloc.add(
                    StocksFetchEvent(
                      stocksToTrack.values.toList(),
                    ),
                  );
                });
              } else {
                _stockUpdateStreamSubscription.cancel();
              }
            },
            icon: Icon(
              _liveMode ? Icons.pause : Icons.play_arrow,
            ),
          ),
        ],
      ),
      body: Center(
        child: BlocConsumer<StocksBloc, StocksState>(
          bloc: _stocksBloc,
          listener: (context, state) async {},
          buildWhen: (prev, current) =>
              current is StocksInitialState || current is StocksLoadedState,
          builder: (context, state) {
            if (state is StocksLoadedState) {
              final stocks = state.stocks;
              _latestStockValues = stocks;
              return ListView.builder(
                itemBuilder: (context, index) => ListTile(
                  onTap: () async {
                    await Navigator.pushNamed(
                      context,
                      Routes.historyPage,
                      arguments: stocks[index].sid,
                    );
                  },
                  title: Text(stocks[index].sid),
                  leading: stocks[index].change > 0
                      ? const Icon(
                          Icons.arrow_drop_up,
                          color: Colors.green,
                        )
                      : const Icon(
                          Icons.arrow_drop_down,
                          color: Colors.red,
                        ),
                  trailing: Text(stocks[index].price.toString()),
                ),
                itemCount: stocks.length,
              );
            }

            return const Text('Nothing Yet');
          },
        ),
      ),
    );
  }

  @override
  void dispose() {
    _stocksBloc.close();
    super.dispose();
  }
}
