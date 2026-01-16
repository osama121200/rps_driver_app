import '../../domain/entities/vehicle.dart';

class VehicleModel {
  final String id;
  final String plateNumber;
  final String? model;

  const VehicleModel({
    required this.id,
    required this.plateNumber,
    this.model,
  });

  factory VehicleModel.fromJson(Map<String, dynamic> json) => VehicleModel(
        id: json['id'].toString(),
        plateNumber: json['plate_number'] as String? ?? '',
        model: json['model'] as String?,
      );

  Vehicle toEntity() => Vehicle(id: id, plateNumber: plateNumber, model: model);
}

