class Users {
  final int id;
  final String? name;
  final String? username;
  final String? phone;
  final List<String>? address;

  const Users({
    required this.id,
    this.name,
    this.username,
    this.phone,
    this.address,
  });

  factory Users.fromJson(Map<String, dynamic> json) {
    return Users(
      id: json['id'] as int,
      name: json['name'] ?? '',
      username: json['username'] ?? '',
      phone: json['phone'] ?? '',
      address: json['address'] ?? '',
    );
  }
}
