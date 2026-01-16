class User {
  final String id;
  final String name;
  final String matricule;
  final String? phone;

  const User({
    required this.id,
    required this.name,
    required this.matricule,
    this.phone,
  });
}

