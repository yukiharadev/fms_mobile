import 'package:my_app/src/models/ceo/response/person_info_response.dart';
import 'package:my_app/src/models/ceo/response/work_response.dart';
import 'package:my_app/src/services/person_service.dart';

class PersonRepository {
  final PersonService service;

  PersonRepository({required this.service});

  Future<PersonInfoResponse> getPersonInfo(String personId) async {
    try {
      final response = await service.getPersonDetails(personId);
      return response;
    } catch (e) {
      throw Exception("Failed to load person info: $e");
    }
  }

  Future<WorkResponse> getWorkInfo(String personId) async {
    try {
      final response = await service.getWorkDetails(personId);
      return response;
    } catch (e) {
      throw Exception("Failed to load work info: $e");
    }
  }
}
