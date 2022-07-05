class UsersAddress {
  final String? street;
  final String? suite;
  final String? city;

  const UsersAddress({
    this.street,
    this.suite,
    this.city,
  });

  factory UsersAddress.fromJson(Map<String, dynamic> json) {
    return UsersAddress(
      street: json['street'] as String,
      suite: json['suite'] as String,
      city: json['city'] as String,
    );
  }
}
