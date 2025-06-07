import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_app/src/DependencyInjection/service_locator.dart';
import 'package:my_app/src/blocs/auth/auth/auth_bloc.dart';
import 'package:my_app/src/blocs/auth/user_info/user_info_bloc.dart';
import 'package:my_app/src/blocs/ceo/info/person_info_bloc.dart';
import 'package:my_app/src/blocs/ceo/work/get_work_bloc.dart';
import 'package:my_app/src/blocs/company/all_company/all_company_bloc.dart';
import 'package:my_app/src/blocs/company/company_cash_stock/company_cash_stock_bloc.dart';
import 'package:my_app/src/blocs/company/company_eps/company_eps_bloc.dart';
import 'package:my_app/src/blocs/company/company_leadership/company_leadership_bloc.dart';
import 'package:my_app/src/blocs/company/company_overview/company_overview_bloc.dart';
import 'package:my_app/src/blocs/company/company_ownership/company_ownership_bloc.dart';
import 'package:my_app/src/blocs/company/search_company/search_company_bloc.dart';
import 'package:my_app/src/blocs/file/file_bloc.dart';
import 'package:my_app/src/blocs/financial/financial_field/financial_field_report_bloc.dart';
import 'package:my_app/src/blocs/financial/financial_index/financial_index_bloc.dart';
import 'package:my_app/src/blocs/financial/financial_report/financial_report_bloc.dart';
import 'package:my_app/src/blocs/market/market_chart_bloc.dart';
import 'package:my_app/src/blocs/tools/analytics/business_analytics_bloc.dart';
import 'package:my_app/src/configs/constants.dart';
import 'package:my_app/src/configs/theme.dart';
import 'package:my_app/src/screens/login/login_screen.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => getIt<AuthBloc>(),
        ),
        BlocProvider(
          create: (context) => getIt<FileBloc>(),
        ),
        BlocProvider(
          create: (context) => getIt<BusinessAnalyticsBloc>(),
        ),
        BlocProvider(
          create: (context) => getIt<CompanyOverviewBloc>(),
        ),
        BlocProvider(
          create: (context) => getIt<CompanyOwnershipBloc>(),
        ),
        BlocProvider(
          create: (context) => getIt<CompanyLeadershipBloc>(),
        ),
        BlocProvider(
          create: (context) => getIt<FinancialReportBloc>(),
        ),
        BlocProvider(create: (context) => getIt<SearchCompanyBloc>()),
        BlocProvider(create: (context) => getIt<FinancialIndexBloc>()),
        BlocProvider(create: (context) => getIt<CompanyEpsBloc>()),
        BlocProvider(create: (context) => getIt<CompanyCashStockBloc>()),
        BlocProvider(create: (context) => getIt<AllCompanyBloc>()),
        BlocProvider(create: (context) => getIt<UserInfoBloc>()),
        BlocProvider(create: (context) => getIt<MarketChartBloc>()),
        BlocProvider(create: (context) => getIt<PersonInfoBloc>()),
        BlocProvider(create: (context) => getIt<GetWorkBloc>()),
      ],
      child: MaterialApp(
        title: Constants.appName,
        theme: appTheme,
        home: LoginScreen(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
