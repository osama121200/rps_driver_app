class Vehicle {
  final String id;
  final String plateNumber;
  final String? model;

  const Vehicle({
    required this.id,
    required this.plateNumber,
    this.model,
  });
}

