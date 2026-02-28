import 'dart:io';

import 'package:demo_fresher_bloc/core/base/base.src.dart';
import 'package:image_picker/image_picker.dart';

import '../../../shared/constants/api_url.dart';
import '../request/image_upload_request.dart';

class ImageRepository extends BaseRepositoryBL {
  final ImagePicker _picker = ImagePicker();
  final String uploadPreset = 'anh_hang_hoa';

  Future<File?> pickImage(ImageSource source) async {
    final pickedFile = await _picker.pickImage(source: source);
    if (pickedFile != null) {
      return File(pickedFile.path);
    }
    return null;
  }

  Future<String?> uploadToCloudinary(ImageUploadRequest requestImage) async {
    final res = await baseCallApi(
      '',
      EnumRequestMethod.POST,
      urlOther: ApiUrl.urlImagePicker,
      jsonMap: await requestImage.toFormData(),
    );
    if (res == null) {
      return null;
    }
    return res['secure_url'];
  }
}
