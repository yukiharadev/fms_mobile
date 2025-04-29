import 'package:hive/hive.dart';
import 'package:my_app/src/services/top_company_service.dart';
import '../models/home/response/top_company_floor_response.dart';

class TopCompanyRepository {
  final TopCompanyService topCompanyService;
  final Box _cacheBox = Hive.box("MyBox");
  static const String _appLaunchKey = 'app_launch_flag';

  TopCompanyRepository({required this.topCompanyService}) {
    _cacheBox.put(_appLaunchKey, true);
  }

  Future<List<TopCompanyFloorResponse>> getTopCompanyCached(String centerId) async {
    final isFreshLaunch = _cacheBox.get(_appLaunchKey, defaultValue: false) as bool;

    final cachedData = _cacheBox.get('$centerId-data');
    final cachedHash = _cacheBox.get('$centerId-hash');

    if (!isFreshLaunch && cachedData != null && cachedData is List<dynamic>) {
      return cachedData.cast<TopCompanyFloorResponse>();
    }

    final newData = await topCompanyService.getTopCompany(centerId);
    final newHash = generateDataHash(newData);

    if (cachedHash != newHash || cachedData == null) {
      await _cacheBox.put('$centerId-data', newData);
      await _cacheBox.put('$centerId-hash', newHash);
    }

    await _cacheBox.put(_appLaunchKey, false);

    return newData;
  }

  Future<List<TopCompanyFloorResponse>> getTopCompany(String centerId) async {
    final response = await topCompanyService.getTopCompany(centerId);
    final newHash = generateDataHash(response);
    await _cacheBox.put('$centerId-data', response);
    await _cacheBox.put('$centerId-hash', newHash);
    await _cacheBox.put(_appLaunchKey, false);
    return response;
  }

  Future<void> clearCache(String centerId) async {
    await _cacheBox.delete('$centerId-data');
    await _cacheBox.delete('$centerId-hash');
    await _cacheBox.delete(_appLaunchKey);
  }
}
