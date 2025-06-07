import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_app/src/blocs/home/top_company/top_company_bloc.dart';
import 'package:my_app/src/widgets/follow/table_follow_widget.dart';
import '../../DependencyInjection/service_locator.dart';
import '../../models/follow/user_follow_response.dart';
import '../../models/home/response/top_company_floor_response.dart';
import '../../repositories/top_company_repository.dart';

class FollowScreen extends StatefulWidget {
  const FollowScreen({super.key});

  @override
  State<FollowScreen> createState() => _FollowScreenState();
}

class _FollowScreenState extends State<FollowScreen> {
  final List<UserFollowResponse> testFollowList = [
    UserFollowResponse(symbol: "ACB", companyName: "Ngân hàng thương mại cổ phần Á Châu"),
    UserFollowResponse(symbol: "VHM", companyName: "Tập đoàn Vinhomes"),
    UserFollowResponse(symbol: "FPT", companyName: "Công ty cổ phần FPT"),
    UserFollowResponse(symbol: "VCB", companyName: "Công Ty cổ phần VCB"),
  ];

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
            BlocProvider(
              create: (_) => TopCompanyBloc(topCompanyRepository: getIt<TopCompanyRepository>())..add(TopCompanyRequested(centerId: "02")),
              child: const SuggestListItem(),
            ),
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
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TopCompanyBloc, TopCompanyState>(
      builder: (context, state) {
        if (state is TopCompanyLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is TopCompanyError) {
          return Center(child: Text('Lỗi tải dữ liệu: ${state.message}'));
        } else if (state is TopCompanySuccess) {
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
                ["STT", "Mã", "Tên công ty", "Khối lượng", "Giá sàn"],
                isHeader: true,
                context: context,
              ),
              ...state.topCompanyFloorResponse.asMap().entries.map((entry) {
                final index = entry.key + 1;
                final company = entry.value;
                return _buildTableRow(
                  [
                    index.toString(),
                    company.symbol,
                    company.companyName,
                    company.volume.toString(),
                    company.floorPrice.toString(),
                  ],
                  rowIndex: index,
                  context: context,
                  company: company,
                );
              }),
            ],
          );
        } else {
          return const Center(child: Text('Không có dữ liệu'));
        }
      },
    );
  }

  TableRow _buildTableRow(
    List<dynamic> cells, {
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
