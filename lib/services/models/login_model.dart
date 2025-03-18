class UserLoginResponse {
  final String message;
  final User user;
  final String token;

  UserLoginResponse({
    required this.message,
    required this.user,
    required this.token,
  });

  factory UserLoginResponse.fromJson(Map<String, dynamic> json) {
    return UserLoginResponse(
      message: json['message'],
      user: User.fromJson(json['user']),
      token: json['token'],
    );
  }
}

class User {
  final int id;
  final String name;
  final String email;
  final String? emailVerifiedAt;
  final String cnic;
  final String userType;
  final String createdAt;
  final String updatedAt;
  final int departmentId;
  final int? doctorId;

  User({
    required this.id,
    required this.name,
    required this.email,
    required this.emailVerifiedAt,
    required this.cnic,
    required this.userType,
    required this.createdAt,
    required this.updatedAt,
    required this.departmentId,
    required this.doctorId,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      name: json['name'],
      email: json['email'],
      emailVerifiedAt: json['email_verified_at'],
      cnic: json['cnic'],
      userType: json['user_type'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
      departmentId: json['department_id'],
      doctorId: json['doctor_id'],
    );
  }
}
