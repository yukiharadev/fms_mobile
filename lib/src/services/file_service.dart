import 'package:dio/dio.dart';
import 'package:file_picker/file_picker.dart';
import 'package:my_app/src/services/dio_client.dart';

class FileService {
  final DioClient dioClient;

  FileService({required this.dioClient});

  Future<Response> uploadFile(PlatformFile file) async {
    final formData = FormData.fromMap({
      'file': await MultipartFile.fromFile(file.path!, filename: file.name),
    });
    return await dioClient.dio.post(
      '/upload-service/upload/gcs/single-file',
      data: formData,
    );
  }

  Future<Response> getFile(String objectName) async {
    return await dioClient.dio.get('/upload-service/upload/gcs/single-file/$objectName');
  }

  Future<Response> deleteFile(String objectName) async {
    return await dioClient.dio.delete(
      '/upload-service/upload/gcs/single-file/$objectName',
    );
  }
}
