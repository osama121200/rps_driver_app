import '../../domain/entities/user.dart';

class UserModel {
  final String id;
  final String name;
  final String matricule;
  final String? phone;

  const UserModel({
    required this.id,
    required this.name,
    required this.matricule,
    this.phone,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        id: json['id'].toString(),
        name: json['name'] as String? ?? '',
        matricule: json['matricule'] as String? ?? '',
        phone: json['phone'] as String?,
      );

  User toEntity() => User(id: id, name: name, matricule: matricule, phone: phone);
}

