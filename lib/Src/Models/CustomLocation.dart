class CustomLocation {
  CustomLocation({
    required this.latitude,
    required this.longitude,
  });

  final num latitude;
  final num longitude;

  Map<String, dynamic> toMap() {
    return {
      'latitude': latitude,
      'longitude': longitude,
    };
  }
}
