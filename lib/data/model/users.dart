class User {
  int? id;
  String role;
  String username;
  String email;
  String phone;
  String? address;
  String? country;
  String? city;
  bool? is_banned; // يجب أن تكون قابلة للتغيير

  User({
    this.id,
    required this.role,
    required this.username,
    required this.email,
    required this.phone,
    this.address,
    this.country,
    this.city,
    this.is_banned,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'] ?? 0,
      role: json['role'] ?? 'Unknown',
      username: json['username'] ?? 'Unknown',
      email: json['email'] ?? 'Unknown',
      phone: json['phone'] ?? 'Unknown',
      address: json['address'] ?? '',
      country: json['country'] ?? '',
      city: json['city'] ?? '',
      is_banned: json['is_banned'] == true || json['is_banned'] == 1,
    );
  }
}
