import 'package:file_picker/file_picker.dart';
import 'package:my_app/src/services/file_service.dart';

class FileRepository {
  final FileService fileService;

  FileRepository({required this.fileService});

  Future<String> uploadFile(PlatformFile filePath) async {
    try {
      final response = await fileService.uploadFile(filePath);
      if (response.statusCode != 200) {
        throw Exception('File upload failed: ${response.statusMessage}');
      }
      final fileUrl = response.data['value']['fullSize'];
      return fileUrl;
    } catch (e) {
      throw Exception('File upload failed: $e');
    }
  }

  Future<String> getFile(String objectName) async {
    try {
      final response = await fileService.getFile(objectName);
      if (response.statusCode != 200) {
        throw Exception('File retrieval failed: ${response.statusMessage}');
      }
      final fileUrl = response.data['value']['fullSize'];
      return fileUrl;
    } catch (e) {
      throw Exception('File retrieval failed: $e');
    }
  }

  Future<void> deleteFile(String objectName) async {
    try {
      final response = await fileService.deleteFile(objectName);
      if (response.statusCode != 200) {
        throw Exception('File deletion failed: ${response.statusMessage}');
      }
    } catch (e) {
      throw Exception('File deletion failed: $e');
    }
  }
}
