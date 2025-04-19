import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class CompanyFinanceScreen extends StatelessWidget {
  const CompanyFinanceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 10,
          children: [
            FinancialDataLabelWidget(),
            Divider(
              color: Colors.black,
              thickness: 0.5,
            ),
            FinancialDataLabelWidget(),
            Divider(
              color: Colors.black,
              thickness: 0.5,
            ),
            FinancialDataLabelWidget(),
            Divider(
              color: Colors.black,
              thickness: 0.5,
            )
          ],
        ),
      ),
    );
  }
}

class FinancialDataLabelWidget extends StatefulWidget {
  const FinancialDataLabelWidget({
    super.key,
  });

  @override
  State<FinancialDataLabelWidget> createState() => _FinancialDataLabelWidgetState();
}

class _FinancialDataLabelWidgetState extends State<FinancialDataLabelWidget> {
  String? _selectedValue = "Tổng tài sản";
  final List<String> _options = [
    "Tổng tài sản",
    "Tổng nợ phải trả",
    "Tổng vốn chủ sở hữu",
    "Doanh thu thuần",
    "Lợi nhuận gộp",
    "Lợi nhuận trước thuế",
    "Lợi nhuận sau thuế",
  ];

  final List<FinancialData> _financialDataList = [
    FinancialData(1, 844008),
    FinancialData(2, 814321),
    FinancialData(3, 824008),
    FinancialData(4, 864008),
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 3,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Các chỉ tiêu chính",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                )),
            Text("Đơn vị: tỷ đồng",
                style: TextStyle(
                  fontSize: 12.5,
                  color: Colors.black,
                ))
          ],
        ),
        Text("Bấm vào mỗi chỉ tiêu để xem biểu đồ tương ứng",
            style: TextStyle(
              fontSize: 10,
              color: Colors.black,
            )),
        //Dropdown button
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          width: MediaQuery.of(context).size.width * 0.4,
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
            icon: Icon(Icons.keyboard_arrow_down),
            underline: SizedBox.shrink(),
            items: _options.map((String value) {
              return DropdownMenuItem<String>(
                  value: value, child: Text(value, maxLines: 1, overflow: TextOverflow.ellipsis, style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold)));
            }).toList(),
            onChanged: (String? value) {
              setState(() {
                _selectedValue = value;
              });
            },
          ),
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.25,
          child: SfCartesianChart(
            primaryXAxis: CategoryAxis(
              labelAlignment: LabelAlignment.start,
              labelPlacement: LabelPlacement.onTicks,
            ),
            primaryYAxis: NumericAxis(
              interval: 20000,
              numberFormat: NumberFormat.compact(),
              opposedPosition: true,
            ),
            series: [
              SplineAreaSeries<FinancialData, String>(
                dataSource: _financialDataList,
                xValueMapper: (FinancialData data, _) => "${data.x}/2023",
                yValueMapper: (FinancialData data, _) => data.y,
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
                markerSettings: MarkerSettings(isVisible: true),
              ),
            ],
          ),
        )
      ],
    );
  }
}

class FinancialData {
  FinancialData(this.x, this.y);
  final int x;
  final double y;
}
