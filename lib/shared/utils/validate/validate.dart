import 'dart:math';

bool isPasswordValidate({
  required String password,
  required int minLength,
  int maxLength = 0,
}) {
  if (password.isStringNotEmpty) {
    // Trường hợp có yêu cầu nhập tối đa vào mật khẩu.
    if (maxLength > 0) {
      if (password.length >= minLength && password.length <= maxLength) {
        return true;
      }
    } else {
      // Trường hợp chỉ yêu cầu số ký tự tối thiểu nhập vào của mật khẩu.
      if (password.length >= minLength) {
        return true;
      }
    }
  }
  return false;
}

bool isEmptyPassword(String? password) {
  return password == null || password.trim().isEmpty;
}


extension StringUtils on String? {
  bool get isStringNotEmpty => this != null && this!.trim().isNotEmpty;

  bool get isNullOrEmpty => this == null || (this?.trim().isEmpty ?? true);

  bool get isBlank => this?.trim().isEmpty ?? true;
}

bool isListNotEmpty(List<dynamic>? list) => list != null && list.isNotEmpty;

bool isPhoneValidate({required String? value}) {
  if (value == null) return false;
  if (value.trim().isEmpty || !RegExp(r'\d{10,14}').hasMatch(value)) {
    return false;
  }
  // if (int.parse(value) == 0) {
  //   return false;
  // }

  return true;
}

bool isIdentityCard({required String? value}) {
  if (value == null) return false;
  if (value.trim().isEmpty || !RegExp(r'\d{12}').hasMatch(value)) {
    return false;
  }
  return true;
}

bool isTaxCode({required String? taxCode}) {
  if (taxCode!.length < 10) return false;
  return true;
}

bool isEmail(String? value) {
  RegExp email = RegExp(
      r"^((([a-z]|\d|[!#\$%&'\*\+\-\/=\?\^_`{\|}~]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])+(\.([a-z]|\d|[!#\$%&'\*\+\-\/=\?\^_`{\|}~]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])+)*)|((\x22)((((\x20|\x09)*(\x0d\x0a))?(\x20|\x09)+)?(([\x01-\x08\x0b\x0c\x0e-\x1f\x7f]|\x21|[\x23-\x5b]|[\x5d-\x7e]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(\\([\x01-\x09\x0b\x0c\x0d-\x7f]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF]))))*(((\x20|\x09)*(\x0d\x0a))?(\x20|\x09)+)?(\x22)))@((([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])*([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])))\.)+(([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])*([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])))$");

  if (value == null) return false;
  if (value.trim().isEmpty || !email.hasMatch(value.toLowerCase())) {
    return false;
  }

  return true;
}

String convertDoubleToStringSmart(double? value) {
  return '${value?.toInt() == value ? value?.toInt() : value}';
}

bool isIpAddress(String? value) {
  final RegExp ipRegex = RegExp(
      r"^(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)$");

  if (value == null) return false;
  if (value.trim().isEmpty || !ipRegex.hasMatch(value.toLowerCase())) {
    return false;
  }

  return true;
}

extension $StringNonNullExt on String {
  String get abbreviation {
    final words = toUpperCase().split(' ');
    words.removeWhere((word) => word.isBlank);
    final letters = words.map((word) => word[0]);
    return letters.skip(max(0, letters.length - 2)).join();
  }

  String get shorten {
    final words = split(' ');
    final length = max(0, words.length - 2);
    return words.skip(length).join(' ');
  }

  String get abbreviation_one_letter {
    final words = toUpperCase().split(' ');
    words.removeWhere((word) => word.isBlank);
    final letters = words.map((word) => word[0]);
    return letters.skip(max(0, letters.length - 1)).join();
  }

  String get shorten_one_letter {
    final words = split(' ');
    final length = max(0, words.length - 1);
    return words.skip(length).join(' ');
  }
}

// String? validateRepass(String? text, String pass, {String? textValidate}) {
//   if (text == null || text.isEmpty) {
//     return textValidate ?? LocaleKeys.login_passwordEmpty.tr;
//   } else if (text != pass) {
//     return LocaleKeys.ChangePassword_passwordDifferent.tr;
//   }
//
//   return null;
// }
//
// String? validatePass(String? value) {
//   if (value == null || value.isEmpty) {
//     return LocaleKeys.login_passwordEmpty.tr;
//   }
//
//   if (value.length < 6) return LocaleKeys.login_passwordLength.tr;
// // // Kiểm tra chữ hoa
// //   bool hasUppercase = value.contains(RegExp(r'[A-Z]'));
// //   if (!hasUppercase) {
// //     return LocaleKeys.login_passwordValidate.tr;
// //   }
// //
// // // Kiểm tra số
// //   bool hasDigit = value.contains(RegExp(r'[0-9]'));
// //   if (!hasDigit) {
// //     return LocaleKeys.login_passwordValidate.tr;
// //   }
// //
// //   final regex = RegExp(r'[!@#\$%\^&\*\(\)_\+\-=\[\]\{\}\\|;:\,<>\./\?~`]');
// //   if (!regex.hasMatch(value)) {
// //     return LocaleKeys.login_passwordValidate.tr;
// //   }
//   return null;
// }
//
// String? validatePassNew(String? value) {
//   if (value == null || value.isEmpty) {
//     return LocaleKeys.login_passwordEmpty.tr;
//   }
//
//   if (value.length < 8) return LocaleKeys.login_passwordValidate.tr;
// // Kiểm tra chữ hoa
//   bool hasUppercase = value.contains(RegExp(r'[A-Z]'));
//   if (!hasUppercase) {
//     return LocaleKeys.login_passwordValidate.tr;
//   }
//
// // Kiểm tra số
//   bool hasDigit = value.contains(RegExp(r'[0-9]'));
//   if (!hasDigit) {
//     return LocaleKeys.login_passwordValidate.tr;
//   }
//
//   final regex = RegExp(r'[!@#\$%\^&\*\(\)_\+\-=\[\]\{\}\\|;:\,<>\./\?~`]');
//   if (!regex.hasMatch(value)) {
//     return LocaleKeys.login_passwordValidate.tr;
//   }
//   return null;
// }

String removeDiacritics(String str) {
  const vietnameseCharMap = {
    'à': 'a',
    'á': 'a',
    'ạ': 'a',
    'ả': 'a',
    'ã': 'a',
    'â': 'a',
    'ầ': 'a',
    'ấ': 'a',
    'ậ': 'a',
    'ẩ': 'a',
    'ẫ': 'a',
    'ă': 'a',
    'ằ': 'a',
    'ắ': 'a',
    'ặ': 'a',
    'ẳ': 'a',
    'ẵ': 'a',
    'è': 'e',
    'é': 'e',
    'ẹ': 'e',
    'ẻ': 'e',
    'ẽ': 'e',
    'ê': 'e',
    'ề': 'e',
    'ế': 'e',
    'ệ': 'e',
    'ể': 'e',
    'ễ': 'e',
    'ì': 'i',
    'í': 'i',
    'ị': 'i',
    'ỉ': 'i',
    'ĩ': 'i',
    'ò': 'o',
    'ó': 'o',
    'ọ': 'o',
    'ỏ': 'o',
    'õ': 'o',
    'ô': 'o',
    'ồ': 'o',
    'ố': 'o',
    'ộ': 'o',
    'ổ': 'o',
    'ỗ': 'o',
    'ơ': 'o',
    'ờ': 'o',
    'ớ': 'o',
    'ợ': 'o',
    'ở': 'o',
    'ỡ': 'o',
    'ù': 'u',
    'ú': 'u',
    'ụ': 'u',
    'ủ': 'u',
    'ũ': 'u',
    'ư': 'u',
    'ừ': 'u',
    'ứ': 'u',
    'ự': 'u',
    'ử': 'u',
    'ữ': 'u',
    'ỳ': 'y',
    'ý': 'y',
    'ỵ': 'y',
    'ỷ': 'y',
    'ỹ': 'y',
    'đ': 'd',
    'À': 'A',
    'Á': 'A',
    'Ạ': 'A',
    'Ả': 'A',
    'Ã': 'A',
    'Â': 'A',
    'Ầ': 'A',
    'Ấ': 'A',
    'Ậ': 'A',
    'Ẩ': 'A',
    'Ẫ': 'A',
    'Ă': 'A',
    'Ằ': 'A',
    'Ắ': 'A',
    'Ặ': 'A',
    'Ẳ': 'A',
    'Ẵ': 'A',
    'È': 'E',
    'É': 'E',
    'Ẹ': 'E',
    'Ẻ': 'E',
    'Ẽ': 'E',
    'Ê': 'E',
    'Ề': 'E',
    'Ế': 'E',
    'Ệ': 'E',
    'Ể': 'E',
    'Ễ': 'E',
    'Ì': 'I',
    'Í': 'I',
    'Ị': 'I',
    'Ỉ': 'I',
    'Ĩ': 'I',
    'Ò': 'O',
    'Ó': 'O',
    'Ọ': 'O',
    'Ỏ': 'O',
    'Õ': 'O',
    'Ô': 'O',
    'Ồ': 'O',
    'Ố': 'O',
    'Ộ': 'O',
    'Ổ': 'O',
    'Ỗ': 'O',
    'Ơ': 'O',
    'Ờ': 'O',
    'Ớ': 'O',
    'Ợ': 'O',
    'Ở': 'O',
    'Ỡ': 'O',
    'Ù': 'U',
    'Ú': 'U',
    'Ụ': 'U',
    'Ủ': 'U',
    'Ũ': 'U',
    'Ư': 'U',
    'Ừ': 'U',
    'Ứ': 'U',
    'Ự': 'U',
    'Ử': 'U',
    'Ữ': 'U',
    'Ỳ': 'Y',
    'Ý': 'Y',
    'Ỵ': 'Y',
    'Ỷ': 'Y',
    'Ỹ': 'Y',
    'Đ': 'D'
  };

  return str.split('').map((char) => vietnameseCharMap[char] ?? char).join();
}
