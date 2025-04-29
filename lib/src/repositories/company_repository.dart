import 'package:hive/hive.dart';
import 'package:my_app/src/models/company/response/ownership_response.dart';
import 'package:my_app/src/services/company_service.dart';

import '../models/company/response/company_leadership_response.dart';
import '../models/company/response/company_overview_response.dart';

class CompanyRepository {
  final CompanyService service;
  final Box _cacheBox = Hive.box("MyBox");
  static const String _appLaunchKey = 'app_launch_flag';

  CompanyRepository({required this.service}) {
    _cacheBox.put(_appLaunchKey, true);
  }

  Future<CompanyOverviewResponse> getCompanyOverviewCached(String symbol) async {
    final isFreshLaunch = _cacheBox.get(_appLaunchKey, defaultValue: false) as bool;

    final cachedData = _cacheBox.get('cpn-$symbol-data');
    final cachedHash = _cacheBox.get('cpn-$symbol-hash');

    if (!isFreshLaunch && cachedData != null && cachedData is CompanyOverviewResponse) {
      return cachedData;
    }

    final newData = await service.getCompanyOverview(symbol);
    final newHash = hashCompanyOverview(newData);

    if (cachedHash != newHash || cachedData == null) {
      await _cacheBox.put('cpn-$symbol-data', newData);
      await _cacheBox.put('cpn-$symbol-hash', newHash);
    }

    await _cacheBox.put(_appLaunchKey, false);

    return newData;
  }

  Future<CompanyOverviewResponse> getCompanyOverview(String symbol) async {
    try {
      final response = await service.getCompanyOverview(symbol);
      return response;
    } catch (e) {
      throw Exception("Failed to load company overview data: $e");
    }
  }

  Future<List<OwnershipResponse>> getOwnership(String symbol) async {
    try {
      final response = await service.getOwnership(symbol);
      return response;
    } catch (e) {
      throw Exception("Failed to load ownership data: $e");
    }
  }

  Future<List<CompanyLeadershipResponse>> getCompanyLeadership(String companyId) async {
    final response = await service.getCompanyLeadership(companyId);
    return response;
  }

  Future<void> clearCache(String symbol) async {
    await _cacheBox.delete('cpn-$symbol-data');
    await _cacheBox.delete('cpn-$symbol-hash');
    await _cacheBox.delete(_appLaunchKey);
  }
}
