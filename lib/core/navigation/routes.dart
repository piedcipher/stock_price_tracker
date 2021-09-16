import 'package:flutter/material.dart';
import 'package:stock_price_tracker/presentation/pages/home/home_page.dart';
import 'package:stock_price_tracker/presentation/pages/history/history_page.dart';

/// Routes for Stock Price Tracker App
abstract class Routes {
  /// Home (initial) Page
  static const String homePage = '/';

  /// History of a Stock
  static const String historyPage = '/history';

  /// Route Generation
  static PageRoute onGenerateRoute(
    RouteSettings routeSettings,
  ) {
    switch (routeSettings.name) {
      case Routes.homePage:
        return MaterialPageRoute<void>(
          builder: (context) => const HomePage(),
        );

      case Routes.historyPage:
        return MaterialPageRoute<void>(
          builder: (context) => HistoryPage(),
        );
    }

    return MaterialPageRoute<void>(
      builder: (context) => const Text('404 - Unknown Route'),
    );
  }
}
