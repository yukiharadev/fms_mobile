import 'package:hive/hive.dart';
import 'package:my_app/src/models/tools/analytics/request/business_analytics_request.dart';
import 'package:my_app/src/models/tools/analytics/response/analytics_report_response.dart';
import 'package:my_app/src/services/business_analytics_service.dart';

class BusinessAnalyticsRepository {
  final BusinessAnalyticsService service;
  final Box _cacheBox = Hive.box("MyBox");
  static const String _appLaunchKey = 'app_launch_flag';

  BusinessAnalyticsRepository({required this.service}) {
    _cacheBox.put(_appLaunchKey, true);
  }

  Future<List<AnalyticsReportResponse>> getBusinessAnalyticsCached(BusinessAnalyticsRequest request) async {
    final isFreshLaunch = _cacheBox.get(_appLaunchKey, defaultValue: false) as bool;
    final cachedData = _cacheBox.get('analytics-${request.symbols}-${request.page}-data');
    final cachedHash = _cacheBox.get('analytics-${request.symbols}-${request.page}-hash');

    if (cachedData != null && cachedData is List<dynamic> && !isFreshLaunch) {
      return cachedData.cast<AnalyticsReportResponse>();
    }

    final newData = await service.getBusinessAnalytics(request);
    final newHash = generateAnalyticsHash(newData);

    if (cachedHash != newHash || cachedData == null) {
      await _cacheBox.put('analytics-${request.symbols}-${request.page}-data', newData);
      await _cacheBox.put('analytics-${request.symbols}-${request.page}-hash', newHash);
    }
    await _cacheBox.put(_appLaunchKey, false);
    return newData;
  }

  Future<List<AnalyticsReportResponse>> getBusinessAnalytics(BusinessAnalyticsRequest request) async {
    final response = await service.getBusinessAnalytics(request);
    final newHash = generateAnalyticsHash(response);
    await _cacheBox.put('analytics-${request.symbols}-${request.page}-data', response);
    await _cacheBox.put('analytics-${request.symbols}-${request.page}-hash', newHash);
    await _cacheBox.put(_appLaunchKey, false);
    return response;
  }

  Future<void> clearCache(BusinessAnalyticsRequest request) async {
    await _cacheBox.delete('analytics-${request.symbols}-${request.page}-data');
    await _cacheBox.delete('analytics-${request.symbols}-${request.page}-hash');
    await _cacheBox.delete(_appLaunchKey);
  }
}
