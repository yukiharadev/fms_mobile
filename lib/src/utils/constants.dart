class Constants {
  static const String baseUrl = "http://172.31.112.1:52999";
  static const String marketChartUrl = "https://apipubaws.tcbs.com.vn/stock-insight/v2/stock/bars-long-term";
  static const String topCompanyUrl = "https://api-finance-t19.24hmoney.vn/v1/ios/stock-recommend/top-fluctuation?floor=";
  static const String businessAnalyticsUrl =
      "https://api-finance-t19.24hmoney.vn/v1/web/announcement/report-analytics-search-symbols?device_id=web1741843txk686ha2zsgeqyqslc6w4bsu2094e1l514416&device_name=INVALID&device_model=Windows+11&network_carrier=INVALID&connection_type=INVALID&os=Chrome&os_version=135.0.0.0&access_token=INVALID&push_token=INVALID&locale=vi&browser_id=web1741843txk686ha2zsgeqyqslc6w4bsu2094e1l514416&keyword=&";
  static const String companyServiceUrl = "${baseUrl}/company-service";
  static const String companyOverviewUrl = "${companyServiceUrl}/companies/get-by-symbol/";
  static const String companyOwnershipUrl = "${companyServiceUrl}/companies/get-ownership/";
  static const String companyLeadershipUrl = "${companyServiceUrl}/employees/get-by-company/";
  static const String financialReportUrl = "${baseUrl}/finance-service/";
  static const String searchCompanyUrl = "${baseUrl}/company-service/companies/search/";
  static const String financialFieldUrl = "${baseUrl}/finance-service/finance-reports/fieldData";
  static const String financialIndexUrl = "https://api-finance-t19.24hmoney.vn/v2/ios/companies/index?os=Chrome&os_version=135.0.0.0&symbol=";
  static const String financialChartUrl = "https://api-finance-t19.24hmoney.vn/v1/ios/company/financial-graph?";

  static const String pageCompanyUrl = "${baseUrl}/company-service/companies/get-page";
}
