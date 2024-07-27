class UserModel {
  final String id;
  final String name;
  final String email;
  final String country;
  final String phone;

  const UserModel({
    required this.id,
    required this.name,
    required this.email,
    required this.country,
    required this.phone,
  });

  UserModel copyWith({
    String? id,
    String? name,
    String? email,
    String? country,
    String? phone,
  }) {
    return UserModel(
      id: id ?? this.id,
      name: name ?? this.name,
      email: email ?? this.email,
      country: country ?? this.country,
      phone: phone ?? this.phone,
    );
  }
}
