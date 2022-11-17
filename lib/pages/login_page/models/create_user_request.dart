class CreateUserRequest {
  CreateUserRequest(
      {required this.username,
      required this.password,
      required this.isSuperUser});

  late final String username;
  late final String password;
  late final bool isSuperUser;

  CreateUserRequest.fromJson(Map<String, dynamic> json) {
    username = json['username'];
    password = json['password'];
    isSuperUser = json['is_super_user'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['username'] = username;
    data['password'] = password;
    data['is_super_user'] = isSuperUser;

    return data;
  }
}
