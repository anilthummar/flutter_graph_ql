class VehicleColor {
  final String colorName;
  final String? isSelected;
  final String uuid;
  final String colorNameAr;
  final String hexCode;

  VehicleColor({
    required this.colorName,
    this.isSelected,
    required this.uuid,
    required this.colorNameAr,
    required this.hexCode,
  });

  factory VehicleColor.fromJson(Map<String, dynamic> json) {
    return VehicleColor(
      colorName: json['color_name'],
      isSelected: json['is_selected'],
      uuid: json['uuid'],
      colorNameAr: json['color_name_ar'],
      hexCode: json['hex_code'],
    );
  }
}
