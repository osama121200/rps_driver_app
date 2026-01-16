class Site {
  final String id;
  final String name;
  final String address;
  final String? contactPhone;
  final DateTime? openingTime;
  final DateTime? closingTime;

  const Site({
    required this.id,
    required this.name,
    required this.address,
    this.contactPhone,
    this.openingTime,
    this.closingTime,
  });
}

