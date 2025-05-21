import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_app/src/models/follow/user_suggest_response.dart';
import 'package:my_app/src/widgets/follow/table_follow_widget.dart';
import '../../models/follow/user_follow_response.dart';

class FollowScreen extends StatefulWidget {
  FollowScreen({super.key});

  @override
  State<FollowScreen> createState() => _FollowScreenState();
}

class _FollowScreenState extends State<FollowScreen> {
  final List<UserFollowResponse> testFollowList = [
    UserFollowResponse(
      symbol: "ACB",
      companyName: "Ngân hàng thương mại cổ phần Á Châu",
    ),
    UserFollowResponse(
      symbol: "VHM",
      companyName: "Tập đoàn Vinhomes",
    ),
    UserFollowResponse(
      symbol: "FPT",
      companyName: "Công ty cổ phần FPT",
    ),
    UserFollowResponse(companyName: "Công Ty cổ phần VCB", symbol: "VCB"),
  ];
  @override
  void initState() {
    super.initState();
    // You can add any initialization logic here if needed
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Theo dõi",
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(1),
          child: Container(
            color: Colors.grey[300],
            height: 1,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
              child: Text(
                "Gợi ý cho bạn",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                  decoration: TextDecoration.underline,
                ),
              ),
            ),
            SuggestListItem(),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
              child: Text(
                "Danh sách theo dõi",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                  decoration: TextDecoration.underline,
                ),
              ),
            ),
            TableFollowWidget(followList: testFollowList),
          ],
        ),
      ),
    );
  }
}

class SuggestListItem extends StatefulWidget {
  const SuggestListItem({super.key});

  @override
  State<SuggestListItem> createState() => _SuggestListItemState();
}

class _SuggestListItemState extends State<SuggestListItem> {
  final List<UserSuggestResponse> suggestList = [
    UserSuggestResponse(
      symbol: "HPG",
      companyName: "Công ty cổ phần Tập đoàn Hòa Phát",
      volume: 1786200,
      analysticCount: 38169,
    ),
    UserSuggestResponse(
      symbol: "FPT",
      companyName: "Công ty Cổ phần FPT",
      volume: 1936500,
      analysticCount: 33349,
    ),
    UserSuggestResponse(
      symbol: "VIC",
      companyName: "Tập đoàn Vingroup - Công ty Cổ phần",
      volume: 840500,
      analysticCount: 29463,
    ),
    UserSuggestResponse(
      symbol: "VHM",
      companyName: "Công ty Cổ phần Vinhomes",
      volume: 1200000,
      analysticCount: 28900,
    ),
  ];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Table(
      border: TableBorder.all(color: Colors.grey[300]!),
      columnWidths: {
        0: FixedColumnWidth(MediaQuery.of(context).size.width * 0.12),
        1: FixedColumnWidth(MediaQuery.of(context).size.width * 0.12),
        2: const FlexColumnWidth(),
        3: FixedColumnWidth(MediaQuery.of(context).size.width * 0.2),
        4: FixedColumnWidth(MediaQuery.of(context).size.width * 0.2),
      },
      children: [
        _buildTableRow(
          ["STT", "Mã", "Tên công ty", "Khối lượng", "Độ quan tâm"],
          isHeader: true,
          context: context,
        ),
        if (suggestList.isEmpty)
          _buildTableRow(
            ["", "Không có dữ liệu", "", "", ""],
            context: context,
          )
        else
          ...suggestList.asMap().entries.map((entry) {
            final index = entry.key + 1;
            final company = entry.value;
            return _buildTableRow(
              [
                index.toString(),
                company.symbol,
                company.companyName,
                company.volume.toString(),
                company.analysticCount.toString(),
              ],
              rowIndex: index,
              context: context,
              company: company,
            );
          }),
      ],
    );
  }

  TableRow _buildTableRow(
    List<dynamic> cells, {
    bool isHeader = false,
    int rowIndex = 0,
    required BuildContext context,
    UserSuggestResponse? company,
  }) {
    return TableRow(
      decoration: BoxDecoration(
        color: isHeader ? Colors.blue[200] : (rowIndex % 2 == 0 ? Colors.blue[50] : Colors.white),
      ),
      children: cells.asMap().entries.map((entry) {
        final index = entry.key;
        final cell = entry.value;
        return Container(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            cell.toString(),
            style: TextStyle(
              fontSize: 14,
              fontWeight: isHeader ? FontWeight.bold : FontWeight.normal,
              color: isHeader ? Colors.white : Colors.black87,
            ),
            overflow: TextOverflow.ellipsis,
          ),
        );
      }).toList(),
    );
  }
}
