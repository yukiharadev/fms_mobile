import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:k_chart/chart_style.dart';
import 'package:k_chart/entity/index.dart';
import 'package:k_chart/flutter_k_chart.dart';
import 'package:k_chart/k_chart_widget.dart';
import 'package:my_app/src/blocs/market/market_chart_bloc.dart';
import 'package:talker/talker.dart';

class MarketChartScreen extends StatefulWidget {
  final String symbol;

  const MarketChartScreen({super.key, required this.symbol});

  @override
  State<MarketChartScreen> createState() => _MarketChartScreenState();
}

class _MarketChartScreenState extends State<MarketChartScreen> {
  List<KLineEntity>? datas;
  bool showLoading = true;
  final MainState _mainState = MainState.MA;
  bool isLine = false;

  ChartStyle chartStyle = ChartStyle();
  ChartColors chartColors = ChartColors();

  @override
  void initState() {
    super.initState();

    context.read<MarketChartBloc>().stream.listen((state) {
      if (state is MarketChartSuccess) {
        setState(() {
          datas = state.marketChart.marketValueResponse?.map((response) {
            final timestamp = DateTime.parse(response.tradingDate).millisecondsSinceEpoch;

            return KLineEntity.fromCustom(
              open: response.open,
              high: response.high,
              low: response.low,
              close: response.close,
              vol: response.volume,
              time: timestamp,
              amount: response.volume,
            );
          }).toList();

          // Calculate indicators (e.g., MA) if needed
          if (datas != null && datas!.isNotEmpty) {
            DataUtil.calculate(datas!); // Ensure DataUtil is imported if used
          }

          Talker talker = Talker();
          talker.info("Market data loaded: ${datas?.length ?? 0} entries");
          showLoading = false;
        });
      } else if (state is MarketChartError) {
        setState(() {
          showLoading = false;
        });
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Failed to load market data')),
        );
      }
    });
    context.read<MarketChartBloc>().add(MarketChartRequested(symbol: widget.symbol));

    // Lock orientation to landscape
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
    ]);
  }

  @override
  void dispose() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
    ]);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.symbol,
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: KChartWidget(datas, chartStyle, chartColors, isTrendLine: false),
      ),
    );
  }
}
