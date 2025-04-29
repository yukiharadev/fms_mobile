import 'package:my_app/src/models/company/response/company_overview_response.dart';
import 'package:my_app/src/models/company/response/ownership_response.dart';
import 'package:my_app/src/services/dio_client.dart';
import 'package:my_app/src/utils/constants.dart';
import 'package:talker/talker.dart';

import '../models/company/response/company_leadership_response.dart';

class CompanyService {
  final DioClient dioClient;
  CompanyService({required this.dioClient});

  Future<CompanyOverviewResponse> getCompanyOverview(String symbol) async {
    final response = await dioClient.dio.get("${Constants.companyOverviewUrl}$symbol");
    if (response.statusCode == 200) {
      var result = response.data;
      return CompanyOverviewResponse.fromJson(result["value"]);
    } else {
      throw Exception("Failed to load company overview data");
    }
  }

  Future<List<OwnershipResponse>> getOwnership(String symbol) async {
    final response = await dioClient.dio.get("${Constants.companyOwnershipUrl}$symbol");
    if (response.statusCode == 200) {
      var result = response.data["value"];
      Talker talker = Talker();
      talker.debug("Ownership data: $result");
      return (result as List).map((e) => OwnershipResponse.fromJson(e)).toList();
    } else {
      throw Exception("Failed to load ownership data");
    }
  }

  Future<List<CompanyLeadershipResponse>> getCompanyLeadership(String companyId) async {
    final response = await dioClient.dio.get("${Constants.companyLeadershipUrl}$companyId");
    if (response.statusCode == 200) {
      final result = response.data['value'] as List;
      return result.map((e) => CompanyLeadershipResponse.fromJson(e)).toList();
    } else {
      throw Exception("Failed to load company leadership data");
    }
  }
}
