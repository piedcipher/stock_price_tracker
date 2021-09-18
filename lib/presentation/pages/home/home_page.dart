import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stock_price_tracker/api/api_client.dart';
import 'package:stock_price_tracker/blocs/stocks/stocks_bloc.dart';
import 'package:stock_price_tracker/blocs/stocks/stocks_event.dart';
import 'package:stock_price_tracker/blocs/stocks/stocks_state.dart';
import 'package:stock_price_tracker/core/constants/stocks.dart';
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
            onPressed: () {},
            icon: const Icon(Icons.bar_chart),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.play_circle_fill),
          ),
        ],
      ),
      body: Center(
        child: BlocConsumer<StocksBloc, StocksState>(
          bloc: _stocksBloc,
          listener: (context, state) async {},
          builder: (context, state) {
            if (state is StocksLoadedState) {
              final stocks = state.stocks;
              return ListView.builder(
                itemBuilder: (context, index) => ListTile(
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
