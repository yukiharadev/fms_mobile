import 'package:flutter/material.dart';
import 'package:my_app/src/configs/talker_config.dart';
import 'package:my_app/src/screens/company/company_screen.dart';

class TableCompanyWidget extends StatelessWidget {
  const TableCompanyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Table(
      columnWidths: const {
        0: FixedColumnWidth(35),
        1: FixedColumnWidth(40),
        2: FlexColumnWidth(),
        3: FixedColumnWidth(70),
      },
      children: [
        _buildTableRow(["STT", "Mã", "Tên công ty", "Theo dõi"], isHeader: true, context: context),
        _buildTableRow(["1", "AAA", "Ngân hàng thương mại Á Châu", true], rowIndex: 1, context: context),
        _buildTableRow(["2", "VCB", "Ngân hàng thương mại Việt Nam", false], rowIndex: 2, context: context),
        _buildTableRow(["3", "VPB", "Ngân hàng thịnh vượng", false], rowIndex: 3, context: context),
        _buildTableRow(["4", "BBB", "Công ty cổ phần DDD", false], rowIndex: 4, context: context),
        _buildTableRow(["5", "BBB", "Công ty cổ phần EEE", false], rowIndex: 5, context: context),
        _buildTableRow(["6", "BBB", "Công ty cổ phần BBB", false], rowIndex: 6, context: context),
        _buildTableRow(["7", "BBB", "Công ty cổ phần BBB", false], rowIndex: 7, context: context),
        _buildTableRow(["8", "BBB", "Công ty cổ phần BBB", false], rowIndex: 8, context: context),
        _buildTableRow(["9", "BBB", "Công ty cổ phần BBB", false], rowIndex: 9, context: context),
        _buildTableRow(["10", "BBB", "Công ty cổ phần BBB", false], rowIndex: 10, context: context),
      ],
    );
  }

  TableRow _buildTableRow(List<dynamic> cells, {bool isHeader = false, int rowIndex = 0, required BuildContext context}) {
    return TableRow(
      decoration: BoxDecoration(
        color: isHeader ? Colors.blue : (rowIndex % 2 == 0 ? Colors.blue[200] : Colors.white),
      ),
      children: cells.asMap().entries.map((entry) {
        int index = entry.key;
        var cell = entry.value;

        return GestureDetector(
          onTap: isHeader
              ? null
              : () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => CompanyScreen(),
                    ),
                  );
                },
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
            child: Align(
              alignment: (index == 0 || index == 1 || index == 3) ? Alignment.center : Alignment.centerLeft,
              child: isHeader
                  ? Text(cell.toString(), style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 12))
                  : (index == 3
                      ? InkWell(
                          onTap: () {
                            TalkerConfig.talker.log("Follow company: $rowIndex");
                          },
                          child: Icon(cell ? Icons.check : Icons.add, color: Colors.black),
                        )
                      : Text(cell.toString(), style: const TextStyle(fontSize: 12))),
            ),
          ),
        );
      }).toList(),
    );
  }
}
