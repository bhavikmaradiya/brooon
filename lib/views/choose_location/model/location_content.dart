class LocationContent {
  final String landMark;
  final String address;
  final String? description;
  final String? googlePlaceId;

  const LocationContent({
    required this.landMark,
    required this.address,
    this.description,
    this.googlePlaceId,
  });
}
