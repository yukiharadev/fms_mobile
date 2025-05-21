import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:my_app/src/blocs/auth/auth/auth_bloc.dart';
import 'package:my_app/src/blocs/auth/user_info/user_info_bloc.dart';
import 'package:my_app/src/blocs/company/company_eps/company_eps_bloc.dart';
import 'package:my_app/src/blocs/company/company_ownership/company_ownership_bloc.dart';
import 'package:my_app/src/blocs/company/search_company/search_company_bloc.dart';
import 'package:my_app/src/blocs/financial/financial_index/financial_index_bloc.dart';
import 'package:my_app/src/blocs/financial/financial_report/financial_report_bloc.dart';
import 'package:my_app/src/blocs/tools/analytics/business_analytics_bloc.dart';
import 'package:my_app/src/repositories/auth_repository.dart';
import 'package:my_app/src/repositories/company_repository.dart';
import 'package:my_app/src/repositories/financial_report_repository.dart';
import 'package:my_app/src/repositories/third_party_repository.dart';
import 'package:my_app/src/repositories/top_company_repository.dart';
import 'package:my_app/src/services/business_analytics_service.dart';
import 'package:my_app/src/services/company_service.dart';
import 'package:my_app/src/services/dio_client.dart';
import 'package:my_app/src/services/financial_report_service.dart';
import 'package:my_app/src/services/third_party_service.dart';
import 'package:my_app/src/services/top_company_service.dart';
import 'package:my_app/src/services/user_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../blocs/company/all_company/all_company_bloc.dart';
import '../blocs/company/company_cash_stock/company_cash_stock_bloc.dart';
import '../blocs/company/company_leadership/company_leadership_bloc.dart';
import '../blocs/company/company_overview/company_overview_bloc.dart';
import '../blocs/file/file_bloc.dart';
import '../blocs/financial/financial_field/financial_field_report_bloc.dart';
import '../blocs/home/top_company/top_company_bloc.dart';
import '../repositories/business_analytics_repository.dart';
import '../repositories/file_repository.dart';
import '../services/file_service.dart';

final getIt = GetIt.instance;

Future<void> setupLocator() async {
  final sharedPreferences = await SharedPreferences.getInstance();
  getIt.registerSingleton<SharedPreferences>(sharedPreferences);
  getIt.registerSingleton<DioClient>(DioClient(sharedPreferences: sharedPreferences));
  getIt.registerSingleton<Dio>(getIt<DioClient>().dio);

  registerServices();
  registerRepositories();
  registerBlocs();
}

void registerServices() {
  getIt.registerSingleton<UserService>(UserService(dioClient: getIt<DioClient>()));
  getIt.registerSingleton<FileService>(FileService(dioClient: getIt<DioClient>()));
  getIt.registerSingleton<TopCompanyService>(TopCompanyService(dio: getIt<Dio>()));
  getIt.registerSingleton<BusinessAnalyticsService>(BusinessAnalyticsService(dio: getIt<Dio>()));
  getIt.registerSingleton<CompanyService>(CompanyService(dioClient: getIt<DioClient>()));
  getIt.registerSingleton<FinancialReportService>(FinancialReportService(dioClient: getIt<DioClient>()));
  getIt.registerSingleton<ThirdPartyService>(
    ThirdPartyService(
      dio: getIt<Dio>(),
    ),
  );
}

void registerRepositories() {
  getIt.registerSingleton<AuthRepository>(
    AuthRepository(
      userService: getIt<UserService>(),
      sharedPreferences: getIt<SharedPreferences>(),
    ),
  );
  getIt.registerSingleton<FileRepository>(
    FileRepository(
      fileService: getIt<FileService>(),
    ),
  );
  getIt.registerSingleton<TopCompanyRepository>(
    TopCompanyRepository(
      topCompanyService: getIt<TopCompanyService>(),
    ),
  );
  getIt.registerSingleton<BusinessAnalyticsRepository>(
    BusinessAnalyticsRepository(
      service: getIt<BusinessAnalyticsService>(),
    ),
  );
  getIt.registerSingleton<CompanyRepository>(CompanyRepository(service: getIt<CompanyService>()));
  getIt.registerSingleton<FinancialReportRepository>(
    FinancialReportRepository(
      service: getIt<FinancialReportService>(),
    ),
  );
  getIt.registerSingleton<ThirdPartyRepository>(
    ThirdPartyRepository(
      service: getIt<ThirdPartyService>(),
    ),
  );
}

void registerBlocs() {
  getIt.registerCachedFactory<FileBloc>(
    () => FileBloc(fileRepository: getIt<FileRepository>()),
  );
  getIt.registerCachedFactory<AuthBloc>(
    () => AuthBloc(
      authRepository: getIt<AuthRepository>(),
      sharedPreferences: getIt<SharedPreferences>(),
    ),
  );
  getIt.registerCachedFactory<TopCompanyBloc>(
    () => TopCompanyBloc(
      topCompanyRepository: getIt<TopCompanyRepository>(),
    ),
  );
  getIt.registerCachedFactory<BusinessAnalyticsBloc>(
    () => BusinessAnalyticsBloc(
      repository: getIt<BusinessAnalyticsRepository>(),
    ),
  );
  getIt.registerCachedFactory<CompanyOverviewBloc>(
    () => CompanyOverviewBloc(
      repository: getIt<CompanyRepository>(),
    ),
  );
  getIt.registerCachedFactory<CompanyOwnershipBloc>(
    () => CompanyOwnershipBloc(
      repository: getIt<CompanyRepository>(),
    ),
  );
  getIt.registerCachedFactory<CompanyLeadershipBloc>(
    () => CompanyLeadershipBloc(
      repository: getIt<CompanyRepository>(),
    ),
  );
  getIt.registerCachedFactory<FinancialReportBloc>(
    () => FinancialReportBloc(
      repository: getIt<FinancialReportRepository>(),
    ),
  );
  getIt.registerCachedFactory<SearchCompanyBloc>(
    () => SearchCompanyBloc(
      repository: getIt<CompanyRepository>(),
    ),
  );
  getIt.registerCachedFactory<FinancialFieldReportBloc>(
    () => FinancialFieldReportBloc(
      repository: getIt<FinancialReportRepository>(),
    ),
  );
  getIt.registerCachedFactory<FinancialIndexBloc>(
    () => FinancialIndexBloc(
      repository: getIt<ThirdPartyRepository>(),
    ),
  );
  getIt.registerCachedFactory<CompanyEpsBloc>(
    () => CompanyEpsBloc(
      repository: getIt<ThirdPartyRepository>(),
    ),
  );
  getIt.registerCachedFactory<CompanyCashStockBloc>(
    () => CompanyCashStockBloc(
      repository: getIt<ThirdPartyRepository>(),
    ),
  );
  getIt.registerCachedFactory<AllCompanyBloc>(
    () => AllCompanyBloc(
      repository: getIt<CompanyRepository>(),
    ),
  );
  getIt.registerCachedFactory<UserInfoBloc>(
      () => UserInfoBloc(
            repository: getIt<AuthRepository>(),
      ),
  );
}
