# Stock Price Tracker

An application for the real-time tracking of stock prices. The main feature of the app is the ability to track and record prices of stock and visualize the data.

## Features

- **Home Page**

  - Shows the data of predefined list of stocks.
  - Clicking on `play` button start fetching stock prices every 5 seconds. Data is persisted locally.
  - Clicking on `chart` button opens history of the most expensive stock as per the last received API response.
  - Clicking on an individual stock shows the history of that stock.

- **History Page**

  - Shows the current price of the stock.
  - Shows the history (recorded via play button) chart of the stock.

## Dependencies

| Package / Plugin | Usage |
| --- | --- |
| [fl_chart](https://pub.dev/packages/fl_chart) | For drawing chart. |
| [flutter_bloc](https://pub.dev/packages/flutter_bloc) | For state-management and decoupling business logic from UI. |
| [internet_connection_checker](https://pub.dev/packages/internet_connection_checker) | For checking internet connectivity. |
| [intl](https://pub.dev/packages/intl) | For date-time parsing and formatting. |
| [json_annotation](https://pub.dev/packages/json_annotation) | For designing data-models. |
| [moor](https://pub.dev/packages/moor) | For reactive local database (Persistence). |
| [path](https://pub.dev/packages/path) | For file path manipulation. |
| [path_provider](https://pub.dev/packages/path_provider) | For reactive local database (Persistence). |
| [retrofit](https://pub.dev/packages/retrofit) | For http network calls. |
| [sqlite3_flutter_libs](https://pub.dev/packages/sqlite3_flutter_libs) | For reactive local database (Persistence). |
| [build_runner](https://pub.dev/packages/build_runner) | For codegen. |
| [json_serializable](https://pub.dev/packages/json_serializable) | For designing data-models. |
| [moor_generator](https://pub.dev/packages/moor_generator) | For reactive local database (Persistence). |
| [retrofit_generator](https://pub.dev/packages/retrofit_generator) | For http network calls. |
| [very_good_analysis](https://pub.dev/packages/very_good_analysis) | For linting. |

## Getting Started

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://flutter.dev/docs/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://flutter.dev/docs/cookbook)

For help getting started with Flutter, view our
[online documentation](https://flutter.dev/docs), which offers tutorials,
samples, guidance on mobile development, and a full API reference.
