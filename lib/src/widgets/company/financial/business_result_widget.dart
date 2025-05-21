import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:my_app/src/blocs/financial/financial_field/financial_field_report_bloc.dart';
import 'package:my_app/src/models/financial/request/financial_field_report_request.dart';
import 'package:my_app/src/models/financial/response/financial_response.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:talker/talker.dart';

class BusinessResultWidget extends StatefulWidget {
  final String symbol;
  const BusinessResultWidget({super.key, required this.symbol});

  @override
  State<BusinessResultWidget> createState() => _BusinessResultWidgetState();
}

class _BusinessResultWidgetState extends State<BusinessResultWidget> {
  String? _selectedValue = "Tổng lợi nhuận trước thuế";
  final List<String> _options = [
    "Tổng lợi nhuận trước thuế",
    "Lợi nhuận sau thuế",
    "Lợi nhuận tài chính",
    "Lợi nhuận khác",
  ];

  final talker = Talker();
  Timer? _debounceTimer;

  @override
  void dispose() {
    _debounceTimer?.cancel();
    super.dispose();
  }

  void _fetchFinancialData() {
    _debounceTimer?.cancel();
    _debounceTimer = Timer(const Duration(milliseconds: 500), () {
      talker.info("Fetching financial data for symbol: ${widget.symbol} and type: $_selectedValue");
      context.read<FinancialFieldReportBloc>().add(
            GetFinancialFieldReport(
              request: FinancialFieldReportRequest(
                symbol: widget.symbol,
                type: _selectedValue!,
                quarter: 4,
                widgetType: "business_result",
              ),
            ),
          );
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    const _titleStyle = TextStyle(fontSize: 16, fontWeight: FontWeight.bold);
    const _subTitleStyle = TextStyle(fontSize: 12, color: Colors.black);
    const _captionStyle = TextStyle(fontSize: 10, color: Colors.black);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
          child: Column(
            spacing: 5,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Lợi nhuận", style: _titleStyle),
                  Text("Đơn vị: tỷ đồng", style: _subTitleStyle),
                ],
              ),
              Text("Bấm vào mỗi chỉ tiêu để xem biểu đồ tương ứng", style: _captionStyle),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                width: size.width * 0.4,
                height: 40,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black54, width: 0.5),
                  borderRadius: BorderRadius.circular(5),
                ),
                child: DropdownButton<String>(
                  value: _selectedValue,
                  isExpanded: true,
                  borderRadius: BorderRadius.circular(10),
                  dropdownColor: Colors.white,
                  icon: const Icon(Icons.keyboard_arrow_down),
                  underline: const SizedBox.shrink(),
                  items: _options.map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(
                        value,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(fontSize: 13, fontWeight: FontWeight.bold),
                      ),
                    );
                  }).toList(),
                  onChanged: (String? value) {
                    setState(() {
                      _selectedValue = value;
                    });
                    _fetchFinancialData();
                  },
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 10),
        SizedBox(
          height: size.height * 0.25,
          child: BlocBuilder<FinancialFieldReportBloc, FinancialFieldReportState>(
            builder: (context, state) {
              if (state is FinancialFieldReportLoading && state.widgetType == "business_result") {
                return const Center(child: CircularProgressIndicator());
              } else if (state is FinancialFieldReportSuccess && state.widgetType == "business_result") {
                final response = state.responses;

                if (response.financialData == null) {
                  return const Center(child: Text('Không có dữ liệu', style: TextStyle(color: Colors.orange)));
                }

                final financialData = response.financialData!.firstWhere(
                  (e) => e.categoryName.trim().toLowerCase() == _selectedValue!.trim().toLowerCase(),
                  orElse: () => FinancialData(categoryName: _selectedValue!, value: []),
                );

                if (financialData.value == null || financialData.value.isEmpty) {
                  return const Center(child: Text('Không có dữ liệu để hiển thị', style: TextStyle(color: Colors.orange)));
                }

                final dataSource = [
                  for (int i = 0; i < response.headers.length; i++)
                    FinancialChart(
                      "Q${response.headers[i].quarter}/${response.headers[i].year}",
                      financialData.value.length > i ? financialData.value[i] : 0,
                    )
                ];

                if (dataSource.every((e) => e.y == 0)) {
                  return const Center(child: Text('Không có dữ liệu để hiển thị', style: TextStyle(color: Colors.orange)));
                }

                return SfCartesianChart(
                  primaryXAxis: CategoryAxis(
                    labelAlignment: LabelAlignment.start,
                    labelPlacement: LabelPlacement.onTicks,
                  ),
                  primaryYAxis: NumericAxis(
                    numberFormat: NumberFormat.compact(),
                    opposedPosition: true,
                  ),
                  series: [
                    SplineAreaSeries<FinancialChart, String>(
                      dataSource: dataSource,
                      xValueMapper: (FinancialChart data, _) => data.x,
                      yValueMapper: (FinancialChart data, _) => data.y,
                      enableTooltip: true,
                      gradient: LinearGradient(
                        colors: <Color>[
                          Colors.orange.withOpacity(0.8),
                          Colors.orange.withOpacity(0.4),
                        ],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                      ),
                      name: _selectedValue!,
                      markerSettings: const MarkerSettings(isVisible: true),
                    ),
                  ],
                );
              } else if (state is FinancialFieldReportFailure && state.widgetType == "business_result") {
                return Center(child: Text('Lỗi: ${state.error}', style: const TextStyle(color: Colors.red)));
              }
              return const Center(child: Text('Không có dữ liệu'));
            },
          ),
        ),
      ],
    );
  }
}

class FinancialChart {
  FinancialChart(this.x, this.y);
  final String x;
  final double y;

  @override
  String toString() => 'FinancialChart(x: $x, y: $y)';
}
