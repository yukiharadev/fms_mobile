import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_app/src/blocs/company/company_overview/company_overview_bloc.dart';
import 'package:my_app/src/screens/company/company_finance_report_screen.dart';
import 'package:my_app/src/screens/company/company_finance_screen.dart';
import 'package:my_app/src/screens/company/company_lead_screen.dart';
import 'package:my_app/src/screens/company/company_overview_screen.dart';
import 'package:my_app/src/screens/company/company_relation_screen.dart';

class CompanyScreen extends StatefulWidget {
  final String symbol;
  final String companyName;

  const CompanyScreen({
    super.key,
    required this.symbol,
    required this.companyName,
  });

  @override
  State<CompanyScreen> createState() => _CompanyScreenState();
}

class _CompanyScreenState extends State<CompanyScreen> {
  @override
  void initState() {
    super.initState();
    context.read<CompanyOverviewBloc>().add(GetCompanyOverview(symbol: widget.symbol));
  }

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
            icon: const Icon(Icons.arrow_back_ios),
          ),
          title: Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      widget.symbol,
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      widget.companyName,
                      style: const TextStyle(
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
          bottom: const TabBar(
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
              Tab(text: "Công ty con & Liên kết"),
              Tab(text: "Báo cáo tài chính"),
            ],
          ),
        ),
        body: BlocBuilder<CompanyOverviewBloc, CompanyOverviewState>(
          builder: (context, state) {
            return TabBarView(
              children: [
                // Tab 1: Tổng quan
                _buildOverviewTab(state),
                // Tab 2: Tài chính
                const CompanyFinanceScreen(),
                // Tab 3: Lãnh đạo
                _buildLeadTab(state),
                // Tab 4: Công ty con & Liên kết
                const CompanyRelationScreen(),
                // Tab 5: Báo cáo tài chính
                CompanyFinanceReportScreen(
                  symbol: widget.symbol,
                ),
              ],
            );
          },
        ),
      ),
    );
  }

  Widget _buildOverviewTab(CompanyOverviewState state) {
    if (state is CompanyOverviewLoading) {
      return const Center(child: CircularProgressIndicator());
    } else if (state is CompanyOverviewError) {
      return Center(child: Text("Error: ${state.message}"));
    } else if (state is CompanyOverviewSuccess) {
      return CompanyOverviewScreen(
        symbol: widget.symbol,
        companyOverview: state.response,
      );
    }
    return const Center(child: Text("Unknown state"));
  }

  Widget _buildLeadTab(CompanyOverviewState state) {
    if (state is CompanyOverviewSuccess) {
      return CompanyLeadScreen(companyId: state.response.company!.id);
    }
    // Fallback while loading or in error
    return const Center(child: Text("Waiting for company data..."));
  }
}
