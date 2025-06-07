import 'package:my_app/src/models/ceo/response/person_info_response.dart';
import 'package:my_app/src/services/dio_client.dart';

import '../models/ceo/response/work_response.dart';

class PersonService {
  final DioClient dioClient;

  PersonService({required this.dioClient});

  Future<PersonInfoResponse> getPersonDetails(String personId) async {
    try {
      final response = await dioClient.dio.get('/company-service/persons/$personId');
      if (response.statusCode == 200) {
        return PersonInfoResponse.fromJson(response.data['value']);
      } else {
        throw Exception("Failed to load person details");
      }
    } catch (e) {
      throw Exception("Error fetching person details: $e");
    }
  }

  Future<WorkResponse> getWorkDetails(String personId) async {
    try {
      final response = await dioClient.dio.get('/company-service/employees/get-by-ceoId/$personId');
      if (response.statusCode == 200) {
        return WorkResponse.fromJson(response.data['value']);
      } else {
        throw Exception("Failed to load work details");
      }
    } catch (e) {
      throw Exception("Error fetching work details: $e");
    }
  }
}
