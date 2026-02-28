import 'package:dio/dio.dart';

class ImageUploadRequest {
  String? uploadPreset;
  String? imagePath;

  ImageUploadRequest({this.uploadPreset, this.imagePath});

  Future<FormData> toFormData() async {
    return FormData.fromMap({
      'upload_preset': uploadPreset,
      'file': await MultipartFile.fromFile(
        imagePath!,
        filename: imagePath?.split('/').last,
      ),
    });
  }
}
