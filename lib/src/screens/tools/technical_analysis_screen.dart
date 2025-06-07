import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_app/src/blocs/company/all_company/all_company_bloc.dart';
import 'package:my_app/src/models/company/response/page_company_response.dart';
import 'package:my_app/src/models/general/get_page_request.dart';

import '../market_chart/market_chart_screen.dart';

class TechnicalAnalysisScreen extends StatefulWidget {
  const TechnicalAnalysisScreen({super.key});

  @override
  State<TechnicalAnalysisScreen> createState() => _TechnicalAnalysisScreenState();
}

class _TechnicalAnalysisScreenState extends State<TechnicalAnalysisScreen> {
  int pageIndex = 0;
  @override
  void initState() {
    context.read<AllCompanyBloc>().add(AllCompanyLoadEvent(GetPageRequest(
          pageIndex: pageIndex,
          pageSize: 30,
        )));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Phân tích kỹ thuật",
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        bottom: const PreferredSize(
          preferredSize: Size.fromHeight(1),
          child: Divider(color: Colors.grey),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text("Danh sách các công ty",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      )),
                  Text("Bấm vào tên công ty để xem phân tích",
                      style: TextStyle(
                        fontStyle: FontStyle.italic,
                        fontSize: 12,
                      )),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: 10,
                  ),
                  Row(
                    spacing: 5,
                    children: [
                      InkWell(
                        onTap: () {
                          if (pageIndex > 0) {
                            setState(() {
                              pageIndex--;
                            });
                            context.read<AllCompanyBloc>().add(AllCompanyLoadEvent(GetPageRequest(
                                  pageIndex: pageIndex,
                                  pageSize: 30,
                                )));
                          }
                        },
                        child: Icon(Icons.arrow_back_ios_new, size: 20),
                      ),
                      Text("${(pageIndex + 1) * 30}", style: TextStyle(fontSize: 16)),
                      InkWell(
                        onTap: () {
                          setState(() {
                            pageIndex++;
                          });
                          context.read<AllCompanyBloc>().add(AllCompanyLoadEvent(GetPageRequest(
                                pageIndex: pageIndex,
                                pageSize: 30,
                              )));
                        },
                        child: Icon(Icons.arrow_forward_ios, size: 20),
                      )
                    ],
                  )
                ],
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                      width: MediaQuery.sizeOf(context).width * 0.15,
                      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                      decoration: BoxDecoration(
                          color: Colors.blue[50],
                          border: Border(
                            right: BorderSide(color: Colors.black, width: 1, style: BorderStyle.solid),
                            bottom: BorderSide(color: Colors.black, width: 1, style: BorderStyle.solid),
                          )),
                      child: Text("Mã", style: TextStyle(fontWeight: FontWeight.bold))),
                  Container(
                      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                      width: MediaQuery.sizeOf(context).width * 0.8,
                      decoration: BoxDecoration(color: Colors.blue[50], border: Border(bottom: BorderSide(color: Colors.black, width: 1, style: BorderStyle.solid))),
                      child: Text("Tên Công ty", style: TextStyle(fontWeight: FontWeight.bold))),
                ],
              ),
              BlocBuilder<AllCompanyBloc, AllCompanyState>(
                builder: (context, state) {
                  if (state is AllCompanyLoading) {
                    return Center(child: CircularProgressIndicator());
                  }
                  if (state is AllCompanyFailure) {
                    return Center(child: Text("Lỗi"));
                  }
                  if (state is AllCompanySuccess) {
                    return Column(
                      children: [
                        ...state.companies.map((e) => CompanyPageRowWidget(response: e)),
                      ],
                    );
                  }
                  return Container();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CompanyPageRowWidget extends StatelessWidget {
  final PageCompanyResponse response;

  const CompanyPageRowWidget({super.key, required this.response});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => MarketChartScreen(symbol: response.symbol),
        ));
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
              width: MediaQuery.sizeOf(context).width * 0.15,
              padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
              decoration: BoxDecoration(
                  border: Border(
                right: BorderSide(color: Colors.black, width: 1, style: BorderStyle.solid),
                bottom: BorderSide(color: Colors.black, width: 1, style: BorderStyle.solid),
              )),
              child: Text(
                response.symbol,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.start,
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
                softWrap: false,
              )),
          Container(
              padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
              width: MediaQuery.sizeOf(context).width * 0.8,
              decoration: BoxDecoration(border: Border(bottom: BorderSide(color: Colors.black, width: 1, style: BorderStyle.solid))),
              child: Text(
                response.companyName,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.start,
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
                softWrap: false,
              )),
        ],
      ),
    );
  }
}
