class UserEntity {
  final String username;
  final String email;
  final int id;

  const UserEntity({
    required this.username,
    required this.email,
    required this.id,
  });

  static UserEntity fromJson(Map<String, dynamic> json) {
    return UserEntity(
      email: json["email"],
      username: json["username"],
      id: json["id"],
    );
  }
}
