/// Tỉnh
class ProvinceData {
  /// Mã tỉnh
  final String? id;

  /// Tên tỉnh
  final String? name;

  /// Mã hành chính
  final String? code;

  const ProvinceData({
    this.id,
    this.name,
    this.code,
  });

  factory ProvinceData.fromJson(Map<String, dynamic> json) {
    return ProvinceData(
      id: json['maTinh'],
      name: json['tenTinh'],
      code: json['maHanhChinh'],
    );
  }
}
