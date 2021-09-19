import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:stock_price_tracker/blocs/history/history_bloc.dart';
import 'package:stock_price_tracker/blocs/history/history_event.dart';
import 'package:stock_price_tracker/blocs/history/history_state.dart';
import 'package:stock_price_tracker/database/database.dart';

/// history page shows history of a stock
class HistoryPage extends StatefulWidget {
  /// constructs history page
  const HistoryPage({Key? key, required this.sid}) : super(key: key);

  /// sid of the stock
  final String sid;

  @override
  _HistoryPageState createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  late HistoryBloc _historyBloc;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('History - ${widget.sid}'),
      ),
      body: Center(
        child: BlocConsumer<HistoryBloc, HistoryState>(
          bloc: _historyBloc,
          listener: (context, state) async {},
          builder: (context, state) {
            if (state is HistoryLoadingState) {
              return const CircularProgressIndicator();
            } else if (state is HistoryLoadedState) {
              final history = state.history;
              if (history.isEmpty) {
                return const Text('Nothing to show');
              }
              final highList = state.history.map((e) => e.high).toList()
                ..sort();
              var index = 1;
              return Column(
                children: [
                  const SizedBox(height: 22),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        state.history.last.price.toString(),
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                      if (state.history.last.change > 0)
                        const Icon(
                          Icons.arrow_drop_up,
                          color: Colors.green,
                          size: 50,
                        )
                      else
                        const Icon(
                          Icons.arrow_drop_down,
                          color: Colors.red,
                          size: 50,
                        ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Expanded(
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Container(
                        margin: const EdgeInsets.all(12),
                        padding: const EdgeInsets.all(12),
                        child: SizedBox(
                          width: state.history.length * 150,
                          child: LineChart(
                            LineChartData(
                              minY: 0,
                              maxY: highList.last + 500,
                              minX: 1,
                              maxX: history.length.toDouble(),
                              lineBarsData: [
                                LineChartBarData(
                                  spots: history
                                      .map(
                                        (e) => FlSpot(
                                          (index++).toDouble(),
                                          e.price,
                                        ),
                                      )
                                      .toList(),
                                ),
                              ],
                              titlesData: FlTitlesData(
                                bottomTitles: SideTitles(
                                  showTitles: true,
                                  getTitles: (val) => "${DateFormat(
                                    'dd-MM-yyyy\nhh:mm:ss',
                                  ).format(
                                    DateTime.parse(
                                      history[val.toInt() - 1].fetchedDate,
                                    ).toLocal(),
                                  )}\n",
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              );
            }
            return const Text('Nothing Yet');
          },
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    _historyBloc = HistoryBloc(context.read<MyDatabase>())
      ..add(
        HistoryLoadEvent(widget.sid),
      );
  }

  @override
  void dispose() {
    _historyBloc.close();
    super.dispose();
  }
}
