import 'package:flutter/material.dart';
import 'package:my_app/src/models/follow/user_follow_response.dart';
import '../../screens/company/company_screen.dart';

class TableFollowWidget extends StatelessWidget {
  final List<UserFollowResponse> followList;
  TableFollowWidget({super.key, required this.followList});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Table(
        border: TableBorder.all(color: Colors.grey[300]!),
        columnWidths: {
          0: FixedColumnWidth(MediaQuery.of(context).size.width * 0.15),
          1: FixedColumnWidth(MediaQuery.of(context).size.width * 0.2),
          2: FlexColumnWidth(),
          3: FixedColumnWidth(MediaQuery.of(context).size.width * 0.2),
        },
        children: [
          _buildTableRow(["STT", "Mã", "Tên công ty", "Theo dõi"], isHeader: true, context: context),
          if (followList.isEmpty)
            _buildTableRow(["", "Không có dữ liệu", "", ""], context: context)
          else
            ...followList.asMap().entries.map((entry) {
              int index = entry.key + 1;
              UserFollowResponse company = entry.value;
              return _buildTableRow(
                [
                  index.toString(),
                  company.symbol,
                  company.companyName,
                  InkWell(
                    child: Icon(Icons.add),
                  )
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
    List<dynamic> cells, {
    bool isHeader = false,
    int rowIndex = 0,
    required BuildContext context,
    UserFollowResponse? company,
  }) {
    return TableRow(
      decoration: BoxDecoration(
        color: isHeader ? Colors.blue[200] : (rowIndex % 2 == 0 ? Colors.blue[50] : Colors.white),
      ),
      children: cells.asMap().entries.map((entry) {
        int index = entry.key;
        dynamic cell = entry.value;

        return GestureDetector(
          onTap: isHeader || cell is Widget
              ? null
              : () {
                  if (company != null) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => CompanyScreen(symbol: company.symbol, companyName: company.companyName),
                      ),
                    );
                  }
                },
          child: Container(
            padding: const EdgeInsets.all(8.0),
            child: cell is String
                ? Text(
                    cell.toString(),
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: isHeader ? FontWeight.bold : FontWeight.normal,
                      color: isHeader ? Colors.white : Colors.black87,
                    ),
                    overflow: TextOverflow.ellipsis,
                  )
                : cell is Widget
                    ? cell
                    : const Text('Invalid cell type'),
          ),
        );
      }).toList(),
    );
  }
}
