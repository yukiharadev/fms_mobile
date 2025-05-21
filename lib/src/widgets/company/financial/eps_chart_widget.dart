import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_app/src/blocs/company/company_eps/company_eps_bloc.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../../../models/financial/request/third_party_chart_request.dart';
import '../../../models/financial/response/third_party_chart_response.dart';

class ESPChartWidget extends StatefulWidget {
  final String symbol;

  const ESPChartWidget({super.key, required this.symbol});

  @override
  State<ESPChartWidget> createState() => _ESPChartWidgetState();
}

class _ESPChartWidgetState extends State<ESPChartWidget> {
  bool _isMounted = true;

  @override
  void initState() {
    super.initState();
    _isMounted = true;
    context.read<CompanyEpsBloc>().add(GetEPSChartEvent(
          ThirdPartyChartRequest(
            symbol: widget.symbol,
            graphType: 6,
            yearReport: 3,
          ),
        ));
  }

  @override
  void dispose() {
    _isMounted = false;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "P/E, EPS 4QGN",
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          BlocBuilder<CompanyEpsBloc, CompanyEpsState>(
            builder: (context, state) {
              if (!_isMounted) {
                return const SizedBox.shrink();
              }
              if (state is CompanyEpsLoading) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
              if (state is CompanyEpsError) {
                return const Center(
                  child: Text("Có lỗi xảy ra"),
                );
              }
              if (state is CompanyEpsSuccess) {
                final List<XAxis>? xAxis = state.response.xAxis;
                final List<Points>? points = state.response.points;

                if (xAxis == null || xAxis.isEmpty || points == null || points.isEmpty) {
                  return const Center(
                    child: Text("Không có dữ liệu để hiển thị"),
                  );
                }

                final validPoints = points
                    .asMap()
                    .entries
                    .where((entry) {
                      final index = entry.key;
                      final point = entry.value;
                      final xAxisItem = xAxis[index];
                      return point.x != null && point.y != null && point.y1 != null && xAxisItem.name != null;
                    })
                    .map((entry) => entry.value)
                    .toList();

                if (validPoints.isEmpty) {
                  return const Center(
                    child: Text("Không có dữ liệu hợp lệ để hiển thị"),
                  );
                }

                return SizedBox(
                  height: MediaQuery.of(context).size.height * 0.3,
                  child: SfCartesianChart(
                    primaryXAxis: CategoryAxis(
                      majorGridLines: const MajorGridLines(width: 0),
                      labelRotation: 45,
                    ),
                    axes: const [
                      NumericAxis(
                        name: "secondary",
                        opposedPosition: true,
                      ),
                    ],
                    tooltipBehavior: TooltipBehavior(enable: true),
                    series: [
                      ColumnSeries<Points, String>(
                        dataSource: validPoints,
                        xValueMapper: (Points data, int index) => xAxis[index].name!,
                        yValueMapper: (Points data, int index) => data.y!,
                        name: "EPS 4QCN",
                        gradient: LinearGradient(
                          colors: <Color>[
                            Colors.orange.withOpacity(0.8),
                            Colors.orange.withOpacity(0.4),
                          ],
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                        ),
                      ),
                      LineSeries<Points, String>(
                        dataSource: validPoints,
                        xValueMapper: (Points data, int index) => xAxis[index].name!,
                        yValueMapper: (Points data, int index) => data.y1!,
                        name: "P/E",
                        color: Colors.red[400],
                        yAxisName: "secondary",
                        markerSettings: const MarkerSettings(
                          isVisible: true,
                        ),
                      ),
                    ],
                  ),
                );
              }
              return const Center(
                child: Text("Không có dữ liệu"),
              );
            },
          ),
        ],
      ),
    );
  }
}
