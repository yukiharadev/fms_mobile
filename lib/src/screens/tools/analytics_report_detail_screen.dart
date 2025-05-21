import 'dart:io';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter_file_dialog/flutter_file_dialog.dart';

import '../../models/tools/analytics/response/analytics_report_response.dart';

class AnalyticsReportDetailScreen extends StatelessWidget {
  final AnalyticsReportResponse report;
  const AnalyticsReportDetailScreen({super.key, required this.report});

  Future<bool> _requestStoragePermission(BuildContext context) async {
    if (Platform.isAndroid) {
      final androidInfo = await DeviceInfoPlugin().androidInfo;
      if (androidInfo.version.sdkInt >= 29) {
        return true;
      } else {
        final status = await Permission.storage.request();
        if (!status.isGranted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: const Text("Permission denied"),
              action: SnackBarAction(
                label: "Settings",
                onPressed: () => openAppSettings(),
              ),
            ),
          );
          return false;
        }
      }
    }
    return true;
  }

  Future<void> _downloadFile(BuildContext context, String url) async {
    if (!await _requestStoragePermission(context)) return;

    Directory tempDir = await getTemporaryDirectory();
    String fileName = url.split('/').last.split('?').first;
    String tempFilePath = "${tempDir.path}/$fileName";

    Dio dio = Dio();
    try {
      await dio.download(url, tempFilePath);

      final params = SaveFileDialogParams(
        sourceFilePath: tempFilePath,
        fileName: fileName,
      );
      await FlutterFileDialog.saveFile(params: params);

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Download completed")),
      );

      File(tempFilePath).delete();
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Download failed: $e")),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          report.title ?? 'No Title',
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
      ),
      body: ListView(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Flexible(
                  flex: 3,
                  child: CachedNetworkImage(
                    imageUrl: report.thumbnail ?? 'https://via.placeholder.com/150',
                    height: MediaQuery.of(context).size.height * 0.20,
                    fit: BoxFit.cover,
                    placeholder: (context, url) => const Center(child: CircularProgressIndicator()),
                    errorWidget: (context, url, error) => const Icon(Icons.error),
                  ),
                ),
                const SizedBox(width: 10),
                Flexible(
                  flex: 5,
                  child: Column(
                    spacing: 5,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.55,
                        child: Text(
                          report.title ?? 'No Title',
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,
                          softWrap: true,
                          style: const TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Text(
                        "Nguồn: ${report.source ?? 'Unknown'}",
                        style: const TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          color: Colors.black54,
                        ),
                      ),
                      Text(
                        "Ngày phát hành: ${report.publishDate ?? 'Unknown'}",
                        style: const TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          color: Colors.black54,
                        ),
                      ),
                      Text(
                        "Mã công ty: ${report.symbols ?? 'Unknown'}",
                        style: const TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          color: Colors.black54,
                        ),
                      ),
                      if (report.urlFile!.isNotEmpty)
                        TextButton(
                          onPressed: () => _downloadFile(context, report.urlFile!),
                          style: TextButton.styleFrom(
                            backgroundColor: Colors.blue,
                            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                          ),
                          child: const Text(
                            "Tải về",
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              color: Colors.white,
                            ),
                          ),
                        ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(
              horizontal: 16,
            ),
            child: Text(
              "Thông tin chi tiết",
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Text(
              report.summary ?? 'No Content',
              style: const TextStyle(
                fontSize: 14,
                fontFamily: "SFProDisplay",
                color: Colors.black54,
              ),
              textAlign: TextAlign.justify,
            ),
          ),
        ],
      ),
    );
  }
}
