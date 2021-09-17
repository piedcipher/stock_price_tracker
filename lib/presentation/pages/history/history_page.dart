import 'package:flutter/material.dart';

/// history page shows history of a stock
class HistoryPage extends StatefulWidget {
  /// constructs history page
  const HistoryPage({Key? key}) : super(key: key);

  @override
  _HistoryPageState createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('History'),
      ),
      body: const Center(),
    );
  }
}
