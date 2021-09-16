import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stock_price_tracker/core/bloc/bloc_observer.dart';
import 'package:stock_price_tracker/core/navigation/routes.dart';

Future<void> main() async {
  Bloc.observer = StockPriceTrackerAppBlocObserver();
  runApp(const MyApp());
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
