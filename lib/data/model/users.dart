class User {
  final int? id;
  final String role;
  final String username;
  final String email;
  final String phone;
  final String? address;
  final String? country;
  final String? city;
  final bool? isBanned;

  User({
     this.id,
    required this.role,
    required this.username,
    required this.email,
    required this.phone,
     this.address,
     this.country,
     this.city,
     this.isBanned,
  });

  // Factory method to create a User object from a JSON map
  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      role: json['role'],
      username: json['username'],
      email: json['email'],
      phone: json['phone'],
      address: json['address'],
      country: json['country'],
      city: json['city'],
      isBanned: json['is_banned'] == 1 || json['is_banned'] == true,
    );
  }

  // Method to convert a User object to a JSON map
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'role': role,
      'username': username,
      'email': email,
      'phone': phone,
      'address': address,
      'country': country,
      'city': city,
      'is_banned': isBanned! ? 1 : 0,
    };
  }
}
