import 'package:flutter/material.dart';
import 'package:my_app/src/models/home/response/top_company_floor_response.dart';
import 'package:my_app/src/screens/company/company_screen.dart';

class TableCompanyWidget extends StatelessWidget {
  final List<TopCompanyFloorResponse> companies;

  const TableCompanyWidget({super.key, required this.companies});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Table(
        border: TableBorder.all(color: Colors.grey[300]!),
        columnWidths: {
          0: FixedColumnWidth(MediaQuery.of(context).size.width * 0.1),
          1: FixedColumnWidth(MediaQuery.of(context).size.width * 0.3),
          2: FlexColumnWidth(),
          3: FixedColumnWidth(MediaQuery.of(context).size.width * 0.2),
        },
        children: [
          _buildTableRow(['STT', 'Mã CK', 'KL CP', 'Giá'], isHeader: true, context: context),
          ...companies.asMap().entries.map((entry) {
            int index = entry.key + 1;
            final company = entry.value;
            return _buildTableRow(
              [
                index.toString(),
                company.symbol,
                company.volume.toString(),
                company.ceilPrice.toStringAsFixed(2),
              ],
              rowIndex: index,
              context: context,
              company: company,
            );
          }),
        ],
      ),
    );
  }

  TableRow _buildTableRow(
    List<String> cells, {
    bool isHeader = false,
    int rowIndex = 0,
    required BuildContext context,
    TopCompanyFloorResponse? company,
  }) {
    return TableRow(
      decoration: BoxDecoration(
        color: isHeader ? Colors.blue[200] : (rowIndex % 2 == 0 ? Colors.blue[50] : Colors.white),
      ),
      children: cells.map((cell) {
        return GestureDetector(
          onTap: isHeader || company == null
              ? null
              : () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => CompanyScreen(
                        symbol: company.symbol,
                        companyName: company.companyName,
                      ),
                    ),
                  );
                },
          child: Container(
            padding: const EdgeInsets.all(8.0),
            alignment: Alignment.centerLeft,
            child: Text(
              cell,
              style: TextStyle(
                fontSize: 14,
                fontWeight: isHeader ? FontWeight.bold : FontWeight.normal,
                color: isHeader ? Colors.white : Colors.black87,
              ),
              overflow: TextOverflow.ellipsis,
            ),
          ),
        );
      }).toList(),
    );
  }
}
