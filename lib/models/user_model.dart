class Users {
  final int id;
  final String? name;
  final String? username;
  final String? phone;

  const Users({
    required this.id,
    this.name,
    this.username,
    this.phone,
  });

  factory Users.fromJson(Map<String, dynamic> json) {
    return Users(
      id: json['id'] as int,
      name: json['name'] ?? '',
      username: json['username'] ?? '',
      phone: json['phone'] ?? '',
    );
  }
}
