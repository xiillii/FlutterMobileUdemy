class User {
  final String id;
  final String email;
  final String fullName;
  final bool isActive;
  final List<String> roles;
  final String token;

  User(
      {required this.id,
      required this.email,
      required this.fullName,
      required this.isActive,
      required this.roles,
      required this.token});

  bool get isAdmin {
    return roles.contains('admin');
  }

  User copyWith({
    String? id,
    String? email,
    String? fullName,
    bool? isActive,
    List<String>? roles,
    String? token,
  }) =>
      User(
        id: id ?? this.id,
        email: email ?? this.email,
        fullName: fullName ?? this.fullName,
        isActive: isActive ?? this.isActive,
        roles: roles ?? this.roles,
        token: token ?? this.token,
      );

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        email: json["email"],
        fullName: json["fullName"],
        isActive: json["isActive"],
        roles: List<String>.from(json["roles"].map((x) => x)),
        token: json["token"] ?? '',
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "email": email,
        "fullName": fullName,
        "isActive": isActive,
        "roles": List<dynamic>.from(roles.map((x) => x)),
        "token": token,
      };
}
