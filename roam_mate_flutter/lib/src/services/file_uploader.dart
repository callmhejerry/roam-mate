import 'dart:io';

import 'package:logging/logging.dart';
import 'package:roam_mate_client/roam_mate_client.dart';
import 'package:roam_mate_flutter/src/api/api_client.dart';

class FileUploadService {
  final ApiClient client;
  Logger log = Logger("File upload service");

  FileUploadService({required this.client});

  Future<String?> getFileDescription({required String filePath}) async {
    final result =
        await client.client.fileUpload.getUploadDescription(filePath);
    return result;
  }

  Future<bool> verifyUpload({required String filePath}) async {
    return client.client.fileUpload.verifyUpload(filePath);
  }

  Future<bool> uploadFile({
    required String uploadDescription,
    required File file,
  }) async {
    final uploader = FileUploader(uploadDescription);
    try {
      return await uploader.upload(file.openRead(), file.lengthSync());
    } catch (e) {
      log.severe(e);
      throw "failed to upload file";
    }
  }
}
