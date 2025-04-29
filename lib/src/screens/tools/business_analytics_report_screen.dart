import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_app/src/blocs/tools/analytics/business_analytics_bloc.dart';
import 'package:talker/talker.dart';
import '../../models/tools/analytics/request/business_analytics_request.dart';
import '../../models/tools/analytics/response/analytics_report_response.dart';
import 'analytics_report_detail_screen.dart';

class BusinessAnalyticsReportScreen extends StatefulWidget {
  const BusinessAnalyticsReportScreen({super.key});

  @override
  State<BusinessAnalyticsReportScreen> createState() => _BusinessAnalyticsReportScreenState();
}

class _BusinessAnalyticsReportScreenState extends State<BusinessAnalyticsReportScreen> {
  final TextEditingController symbolController = TextEditingController();
  int _currentPage = 1;

  @override
  void initState() {
    super.initState();
    _fetchReports("");
  }

  @override
  void dispose() {
    symbolController.dispose();
    super.dispose();
  }

  void _fetchReports(String symbols) {
    Talker talker = Talker();
    talker.info("Fetching reports for symbols: $symbols");
    context.read<BusinessAnalyticsBloc>().add(
          BusinessAnalyticsRequested(
            request: BusinessAnalyticsRequest(
              symbols: symbols,
              page: _currentPage,
            ),
          ),
        );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            "Báo cáo phân tích doanh nghiệp",
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
        body: ListView(
          children: [
            Container(
              width: MediaQuery.of(context).size.width * 0.85,
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
              margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              decoration: BoxDecoration(
                color: Colors.black12,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                children: [
                  Padding(padding: const EdgeInsets.only(left: 10)),
                  Expanded(
                    child: TextField(
                      controller: symbolController,
                      decoration: const InputDecoration(
                        hintText: "Tìm kiếm mã công ty",
                        hintStyle: TextStyle(fontWeight: FontWeight.bold),
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      _fetchReports(symbolController.text);
                    },
                    icon: Container(
                      decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      padding: const EdgeInsets.all(8),
                      child: Icon(
                        Icons.search,
                        color: Colors.white,
                        size: 20,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            BlocBuilder<BusinessAnalyticsBloc, BusinessAnalyticsState>(
              builder: (context, state) {
                if (state is BusinessAnalyticsLoading) {
                  return const Center(
                    child: CircularProgressIndicator(color: Colors.blue),
                  );
                } else if (state is BusinessAnalyticsError) {
                  return const Center(
                    child: Text("Có lỗi xảy ra trong quá trình tải dữ liệu"),
                  );
                } else if (state is BusinessAnalyticsSuccess) {
                  return Column(spacing: 10, children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        IconButton(
                          onPressed: () {
                            if (_currentPage > 1) {
                              setState(() {
                                _currentPage--;
                              });
                              _fetchReports(symbolController.text);
                            }
                          },
                          icon: const Icon(Icons.arrow_back_ios),
                        ),
                        Text("$_currentPage"),
                        IconButton(
                          onPressed: () {
                            setState(() {
                              _currentPage++;
                            });
                            _fetchReports(symbolController.text);
                          },
                          icon: const Icon(Icons.arrow_forward_ios),
                        ),
                      ],
                    ),
                    ...state.businessAnalytics.map((report) {
                      return AnalysisReportWidget(
                        report: report,
                      );
                    }),
                  ]);
                }
                return const SizedBox();
              },
            ),
          ],
        ),
      ),
    );
  }
}

class AnalysisReportWidget extends StatelessWidget {
  final AnalyticsReportResponse report;
  const AnalysisReportWidget({super.key, required this.report});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => AnalyticsReportDetailScreen(report: report),
          ),
        );
      },
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 10),
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey[300]!),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            report.thumbnail != null && report.thumbnail!.isNotEmpty
                ? CachedNetworkImage(
                    width: MediaQuery.of(context).size.width * 0.25,
                    height: MediaQuery.of(context).size.height * 0.15,
                    fit: BoxFit.cover,
                    imageUrl: report.thumbnail!,
                    errorWidget: (context, url, error) => Image.asset(
                      "assets/images/profile/bg-profile.jpg",
                      width: MediaQuery.of(context).size.width * 0.25,
                      height: MediaQuery.of(context).size.height * 0.15,
                      fit: BoxFit.cover,
                    ),
                  )
                : Image.asset(
                    "assets/images/profile/bg-profile.jpg",
                    width: MediaQuery.of(context).size.width * 0.25,
                    height: MediaQuery.of(context).size.height * 0.15,
                    fit: BoxFit.cover,
                  ),
            const SizedBox(width: 10),
            Expanded(
              child: Column(
                spacing: 4,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    report.title,
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Text(
                    "Mã CK: ${report.source}",
                    style: TextStyle(fontSize: 14),
                  ),
                  Text(
                    "Ngày phát hành: ${report.publishDate}",
                    style: TextStyle(fontSize: 14),
                  ),
                  Text(
                    "Nguồn: ${report.symbols}",
                    style: TextStyle(fontSize: 14),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
