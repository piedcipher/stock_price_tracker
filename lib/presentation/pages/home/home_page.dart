import 'package:flutter/material.dart';

/// home page shows list of stocks
class HomePage extends StatefulWidget {
  /// constructs home page
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
      body: Center(),
    );
  }
}
