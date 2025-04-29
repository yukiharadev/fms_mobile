import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:my_app/src/models/home/response/top_company_floor_response.dart';
import 'package:my_app/src/utils/constants.dart';

class TopCompanyService {
  final Dio dio;
  TopCompanyService({required this.dio});

  Future<List<TopCompanyFloorResponse>> getTopCompany(String centerId) async {
    final response = await dio.get("${Constants.topCompanyUrl}$centerId&type=UP");
    if (response.statusCode == 200) {
      final data = jsonDecode(response.data);
      final result = data["Data"] as List;
      final List<TopCompanyFloorResponse> companyResponse = result.map((e) => TopCompanyFloorResponse.fromJson(e)).toList();
      return companyResponse;
    } else {
      throw Exception("Failed to load top company data");
    }
  }
}
