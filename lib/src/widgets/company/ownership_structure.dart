import 'dart:math';
import 'package:flutter/material.dart';
import 'package:my_app/src/models/company/response/ownership_response.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class OwnershipStructure extends StatefulWidget {
  final List<OwnershipResponse> data;
  const OwnershipStructure({super.key, required this.data});

  @override
  State<OwnershipStructure> createState() => _OwnershipStructureState();
}

class _OwnershipStructureState extends State<OwnershipStructure> {
  final List<MaterialColor> _availableColors = List.from(Colors.primaries);
  final Random _random = Random();

  MaterialColor _getUniqueColor(int index) {
    if (_availableColors.isEmpty) {
      return Colors.primaries[index % Colors.primaries.length];
    }

    final colorIndex = _random.nextInt(_availableColors.length);
    final selectedColor = _availableColors[colorIndex];

    _availableColors.removeAt(colorIndex);

    return selectedColor;
  }

  @override
  void initState() {
    super.initState();
    _availableColors.clear();
    _availableColors.addAll(Colors.primaries);
  }

  @override
  Widget build(BuildContext context) {
    return SfCircularChart(
      legend: const Legend(isVisible: true),
      series: <CircularSeries>[
        PieSeries<OwnershipResponse, String>(
          dataSource: widget.data,
          xValueMapper: (OwnershipResponse data, _) => data.name,
          yValueMapper: (OwnershipResponse data, _) => data.value ?? 0.0,
          pointColorMapper: (OwnershipResponse data, int index) => _getUniqueColor(index),
          dataLabelMapper: (OwnershipResponse data, _) => data.value.toString(),
          startAngle: 120,
          endAngle: 120,
          explodeAll: true,
          explodeOffset: '3%',
          explode: true,
          dataLabelSettings: const DataLabelSettings(
            isVisible: true,
            labelPosition: ChartDataLabelPosition.outside,
            textStyle: TextStyle(fontSize: 10),
          ),
        ),
      ],
    );
  }
}
