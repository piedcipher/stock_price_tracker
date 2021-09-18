import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stock_price_tracker/api/api_client.dart';
import 'package:stock_price_tracker/core/bloc/bloc_observer.dart';
import 'package:stock_price_tracker/core/navigation/routes.dart';
import 'package:stock_price_tracker/database/database.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = StockPriceTrackerAppBlocObserver();
  runApp(
    MultiRepositoryProvider(
      providers: [
        RepositoryProvider<TickerTapeApiClient>(
          create: (context) => TickerTapeApiClient(Dio()),
        ),
        RepositoryProvider<MyDatabase>(
          create: (context) => MyDatabase(),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

/// root widget
class MyApp extends StatelessWidget {
  /// constructs root widget
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Stock Price Tracker App',
      initialRoute: Routes.homePage,
      onGenerateRoute: Routes.onGenerateRoute,
    );
  }
}
