import 'package:flutter/material.dart';
import 'package:my_app/src/models/financial/response/financial_response.dart';

class CompanyFinanceReportScreen extends StatefulWidget {
  const CompanyFinanceReportScreen({super.key});

  @override
  State<CompanyFinanceReportScreen> createState() => _CompanyFinanceReportScreenState();
}

class _CompanyFinanceReportScreenState extends State<CompanyFinanceReportScreen> {
  String? _selectedValue = "Theo quý";
  String? _selectedReportTab = "Cân đối KT";
  late List<Headers> headers;
  late List<FinancialData> value;

  final List<String> _options = [
    "Theo quý","Theo năm",
  ];

  final List<String> _reportTabs = [
    "Cân đối KT",
    "LC Tiền tệ",
    "Kết quả KD",
  ];



  @override
  void initState() {
    super.initState();
    // Fake parse dữ liệu từ JSON mẫu
    headers = [
      Headers( quarter: 1, year: 2024),
      Headers( quarter: 2, year: 2023),
      Headers( quarter: 3, year: 2022),
      Headers( quarter: 4, year: 2021),
    ];

    value = [
      FinancialData(categoryName: "TỔNG TÀI SẢN", value: [727297.968, 769678.7, 777392.922, 864005.703]),
      FinancialData(categoryName: "Tiền mặt, vàng bạc, đá quý", value: [6470.319, 6594.138, 5870.526, 5696.449]),
    ];
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
                      border:  Border.all(
                        color: Colors.grey[300]!,
                      ),
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
            //Table
            Container(
              padding: const EdgeInsets.all(12),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child:DataTable(
                  columnSpacing: 5,
                  columns: [
                    const DataColumn(
                      label: Text(
                        "#",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    ...headers.map((h) => DataColumn(
                      label: Text(
                        "${h.quarter}/${h.year}",
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                    )),
                  ],
                  rows: value.map((item) {
                    return DataRow(
                      cells: [
                        DataCell(
                          Text(
                            item.categoryName,
                            style: const TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        ...item.value.map(
                              (v) => DataCell(
                            Container(
                              padding: const EdgeInsets.all(8),
                              child: Text(v.toStringAsFixed(2),
                                  style: const TextStyle(fontSize: 12)),
                            ),
                          ),
                        ),
                      ],
                    );
                  }).toList(),
                )
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text("Đơn vị: tỷ đồng")
              ],
            )
          ],
        ),
      ),
    );
  }
}
