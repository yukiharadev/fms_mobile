import 'package:flutter/material.dart';
import 'package:my_app/src/screens/company/company_finance_report_screen.dart';
import 'package:my_app/src/screens/company/company_finance_screen.dart';
import 'package:my_app/src/screens/company/company_lead_screen.dart';
import 'package:my_app/src/screens/company/company_overview_screen.dart';
import 'package:my_app/src/screens/company/company_relation_screen.dart';

class CompanyScreen extends StatelessWidget {
  const CompanyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5,
      child: Scaffold(
        appBar: AppBar(
          titleSpacing: -10,
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back_ios),
          ),
          title: Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      "ACB",
                      style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "Ngân hàng thương mại Á Châu",
                      style: TextStyle(
                        fontSize: 11,
                        fontWeight: FontWeight.bold,
                        color: Colors.black54,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          bottom: TabBar(
            tabAlignment: TabAlignment.start,
            labelColor: Color(0xff03307a),
            unselectedLabelColor: Colors.black54,
            indicatorColor: Color(0xff03307a),
            labelPadding: EdgeInsets.symmetric(horizontal: 8),
            labelStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
            isScrollable: true,
            tabs: [
              Tab(text: "Tổng quan"),
              Tab(text: "Tài chính"),
              Tab(text: "Lãnh đạo"),
              Tab(
                text: "Công ty con & Liên kết",
              ),
              Tab(
                text: "Báo cáo tài chính",
              )
            ],
          ),
        ),
        body: TabBarView(
          children: [CompanyOverviewScreen(), CompanyFinanceScreen(), CompanyLeadScreen(), CompanyRelationScreen(), CompanyFinanceReportScreen()],
        ),
      ),
    );
  }
}
