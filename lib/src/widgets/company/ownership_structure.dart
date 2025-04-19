import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class OwnershipStructure extends StatefulWidget {
  const OwnershipStructure({super.key});

  @override
  State<OwnershipStructure> createState() => _OwnershipStructureState();
}

class _OwnershipStructureState extends State<OwnershipStructure> {
  List<ChartData> data = [
    ChartData("Công ty TNHH bảo hiểm nhân thọ Prudential Việt Nam", 1.56, Colors.blue),
    ChartData("Đặng Thu Hà", 1.03, Colors.pinkAccent),
    ChartData("Nhóm quỹ ngoại DragonCapital", 3.8, Colors.purpleAccent),
    ChartData("CTCP Đầu tư thương mại Bách Thanh", 1.25, Colors.amber),
    ChartData("CTCP Đầu tư thương mại Giang Sen", 1.8, Colors.deepPurple),
    ChartData("VOF FE Holding 5 Limited", 1.72, Colors.green),
    ChartData("Whistler Invesment Limited", 1.26, Colors.red),
    ChartData("BCH Công đoàn Ngân hàng TMCP Á Châu", 1.25, Colors.orange),
    ChartData("Công ty TNHH Đầu tư tài chính Bảo Việt", 2.51, Colors.teal),
    ChartData("Công ty TNHH Đầu tư tài chính Bảo Việt", 1.84, Colors.teal),
    ChartData("Đặng thu thuỷ", 1.19, Colors.tealAccent),
    ChartData("Trần Hùng Huy", 3.43, Colors.lightBlueAccent),
    ChartData("Khác", 77.37, Colors.cyan),
  ];

  @override
  Widget build(BuildContext context) {
    return SfCircularChart(
      legend: Legend(isVisible: true),
      series: <CircularSeries>[
        PieSeries<ChartData, String>(
          dataSource: data,
          xValueMapper: (ChartData data, _) => data.name,
          yValueMapper: (ChartData data, _) => data.percentage,
          pointColorMapper: (ChartData data, _) => data.color,
          dataLabelMapper: (ChartData data, _) => data.percentage.toString(),
          startAngle: 120,
          endAngle: 120,
          explodeAll: true,
          explodeOffset: '3%',
          explode: true,
          dataLabelSettings: DataLabelSettings(isVisible: true, labelPosition: ChartDataLabelPosition.outside, textStyle: const TextStyle(fontSize: 10)),
        ),
      ],
    );
  }
}

class ChartData {
  final String name;
  final double percentage;
  final Color color;

  ChartData(this.name, this.percentage, this.color);
}
