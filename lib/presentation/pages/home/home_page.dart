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

/// home page shows list of stocks
class HomePage extends StatefulWidget {
  /// constructs home page
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late StocksBloc _stocksBloc;
  int _stockUpdateQueue = 0;
  bool _liveMode = false;
  late StreamSubscription _stockUpdateStreamSubscription;

  @override
  void initState() {
    super.initState();
    _stocksBloc = StocksBloc(
      context.read<TickerTapeApiClient>(),
      context.read<MyDatabase>(),
    )..add(StocksFetchEvent(stocksToTrack.values.toList()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Stocks'),
        actions: [
          IconButton(
            onPressed: () async {
              await Navigator.pushNamed(context, Routes.historyPage);
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
                  if (_stockUpdateQueue == 0) {
                    _stocksBloc.add(
                      StocksFetchEvent(
                        stocksToTrack.values.toList(),
                      ),
                    );
                  }
                  _stockUpdateQueue++;
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
          listener: (context, state) async {
            if (state is StocksLoadedState && _stockUpdateQueue != 0) {
              _stockUpdateQueue--;
              _stocksBloc.add(StocksFetchEvent(stocksToTrack.values.toList()));
            }
          },
          buildWhen: (prev, current) =>
              current is StocksInitialState || current is StocksLoadedState,
          builder: (context, state) {
            if (state is StocksLoadedState) {
              final stocks = state.stocks;
              return ListView.builder(
                itemBuilder: (context, index) => ListTile(
                  onTap: () async {
                    await Navigator.pushNamed(context, Routes.historyPage);
                  },
                  title: Text(stocks[index].sid),
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
