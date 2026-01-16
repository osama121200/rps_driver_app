import '../../domain/entities/site.dart';

class SiteModel {
  final String id;
  final String name;
  final String address;
  final String? contactPhone;
  final DateTime? openingTime;
  final DateTime? closingTime;

  const SiteModel({
    required this.id,
    required this.name,
    required this.address,
    this.contactPhone,
    this.openingTime,
    this.closingTime,
  });

  factory SiteModel.fromJson(Map<String, dynamic> json) => SiteModel(
        id: json['id'].toString(),
        name: json['name'] as String? ?? '',
        address: json['address'] as String? ?? '',
        contactPhone: json['contact_phone'] as String?,
        openingTime: json['opening_time'] != null ? DateTime.tryParse(json['opening_time']) : null,
        closingTime: json['closing_time'] != null ? DateTime.tryParse(json['closing_time']) : null,
      );

  Site toEntity() => Site(
        id: id,
        name: name,
        address: address,
        contactPhone: contactPhone,
        openingTime: openingTime,
        closingTime: closingTime,
      );
}

