import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_app/src/models/financial/request/financial_report_request.dart';
import 'package:my_app/src/models/financial/response/financial_response.dart';
import 'package:talker/talker.dart';

import '../../blocs/financial/financial_report/financial_report_bloc.dart';

class CompanyFinanceReportScreen extends StatefulWidget {
  final String symbol;
  const CompanyFinanceReportScreen({super.key, required this.symbol});

  @override
  State<CompanyFinanceReportScreen> createState() => _CompanyFinanceReportScreenState();
}

class _CompanyFinanceReportScreenState extends State<CompanyFinanceReportScreen> {
  String? _selectedValue = "Theo quý";
  String? _selectedReportTab = "Cân đối KT";

  late int _year = DateTime.now().year - 1;

  final List<String> _options = ["Theo quý", "Theo năm"];
  final List<String> _reportTabs = ["Cân đối KT", "LC Tiền tệ", "Kết quả KD"];

  final Map<String, String> _reportTypeMap = {
    "Cân đối KT": "bsheet",
    "LC Tiền tệ": "cflow",
    "Kết quả KD": "incsta",
  };

  @override
  void initState() {
    super.initState();
    _fetchFinancialReport();
  }

  void _fetchFinancialReport() {
    final bloc = context.read<FinancialReportBloc>();
    final type = _reportTypeMap[_selectedReportTab]!;
    final quarter = _selectedValue == "Theo năm" ? 0 : 4;

    bloc.add(GetFinancialReport(
      request: FinancialReportRequest(
        symbol: widget.symbol,
        type: type,
        quarter: quarter,
        year: _year,
      ),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
              child: Row(
                children: [
                  Container(
                    height: 40,
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(color: Colors.grey[300]!),
                    ),
                    child: DropdownButton<String>(
                      value: _selectedValue,
                      isExpanded: false,
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
                          _fetchFinancialReport();
                        });
                      },
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: SizedBox(
                      height: 40,
                      child: ListView.separated(
                        scrollDirection: Axis.horizontal,
                        itemCount: _reportTabs.length,
                        separatorBuilder: (context, index) => const SizedBox(width: 5),
                        itemBuilder: (context, index) {
                          final tab = _reportTabs[index];
                          final bool isSelected = tab == _selectedReportTab;

                          return Container(
                            padding: const EdgeInsets.symmetric(horizontal: 5),
                            decoration: BoxDecoration(
                              color: isSelected ? Colors.blueAccent : Colors.grey[300],
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: isSelected ? Colors.blueAccent : Colors.grey[300],
                                elevation: 0,
                              ),
                              onPressed: () {
                                setState(() {
                                  _selectedReportTab = tab;
                                  _fetchFinancialReport();
                                });
                              },
                              child: Text(
                                tab,
                                style: TextStyle(
                                  fontSize: 13,
                                  fontWeight: FontWeight.bold,
                                  color: isSelected ? Colors.white : Colors.black87,
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      InkWell(
                        onTap: () {
                          setState(() {
                            _year++;
                            _fetchFinancialReport();
                          });
                        },
                        child: Container(
                          margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                          child: Icon(
                            Icons.arrow_back_ios,
                            size: 14,
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          setState(() {
                            _year--;
                            _fetchFinancialReport();
                          });
                        },
                        child: Container(
                          margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                          child: Icon(
                            Icons.arrow_forward_ios,
                            size: 14,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Text(
                    "Đơn vị: Tỷ VNĐ",
                    style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: Colors.black),
                  ),
                ],
              ),
            ),
            BlocBuilder<FinancialReportBloc, FinancialReportState>(
              builder: (context, state) {
                if (state is FinancialReportLoading) {
                  return const Center(child: CircularProgressIndicator());
                } else if (state is FinancialReportSuccess) {
                  final response = state.response;
                  return _buildDataTable(response);
                } else if (state is FinancialReportFailure) {
                  return Center(child: Text("Lỗi: ${state.error}"));
                }
                return const Center(child: Text("Vui lòng chọn báo cáo"));
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDataTable(FinancialResponse response) {
    final headers = response.headers ?? [];
    final values = response.financialData ?? [];

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Column(
        children: [
          DataTable(
            columnSpacing: 5,
            dataRowHeight: 48,
            headingRowHeight: 40,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey[300]!),
            ),
            columns: [
              DataColumn(
                label: Container(
                  width: MediaQuery.of(context).size.width * 0.3,
                  padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                  child: const Center(
                    child: Text(
                      "#",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                        fontFamily: "SFProDisplay",
                        fontSize: 12,
                      ),
                    ),
                  ),
                ),
              ),
              ...headers.map((h) => DataColumn(
                    label: Container(
                      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                      child: Center(
                        child: Text(
                          _selectedValue == "Theo năm" ? "${h.year}" : "${h.quarter}/${h.year}",
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.black87,
                            fontFamily: "SFProDisplay",
                            fontSize: 12,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  )),
            ],
            rows: values.map((item) {
              return DataRow(
                cells: [
                  DataCell(
                    Container(
                      width: MediaQuery.of(context).size.width * 0.3,
                      padding: const EdgeInsets.all(8),
                      child: Text(
                        item.categoryName,
                        style: const TextStyle(
                          fontSize: 11,
                          fontWeight: FontWeight.bold,
                          color: Colors.black87,
                          fontFamily: "SFProDisplay",
                        ),
                        maxLines: 2,
                        softWrap: true,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ),
                  ...item.value.map(
                    (v) => DataCell(
                      Container(
                        padding: const EdgeInsets.all(8),
                        child: Text(
                          v.toStringAsFixed(2),
                          style: const TextStyle(
                            fontSize: 11,
                            color: Colors.black87,
                            fontFamily: "SFProDisplay",
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ),
                ],
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}
