import 'package:hive/hive.dart';
import 'package:my_app/src/models/company/response/company_overview_response.dart';
import 'package:my_app/src/models/tools/analytics/response/analytics_report_response.dart';

import '../models/home/response/top_company_floor_response.dart';

void registerAdapters() {
  Hive.registerAdapter(TopCompanyFloorResponseAdapter());
  Hive.registerAdapter(AnalyticsReportResponseAdapter());
  Hive.registerAdapter(CompanyOverviewResponseAdapter());
}
