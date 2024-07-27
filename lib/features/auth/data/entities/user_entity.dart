class UserEntity {
  final String id;
  final String name;
  final String email;
  final String country;
  final String phone;

  const UserEntity({
    required this.id,
    required this.name,
    required this.email,
    required this.country,
    required this.phone,
  });

  factory UserEntity.fromJson(Map<String, dynamic> json) {
    return UserEntity(
      id: json['id'],
      name: json['name'],
      email: json['email'],
      country: json['country'],
      phone: json['phone'].toString(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'country': country,
      'phone': phone,
    };
  }
}
