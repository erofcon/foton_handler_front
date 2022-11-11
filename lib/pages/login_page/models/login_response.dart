import 'dart:convert';

LoginResponse currentUser(String str) =>
    LoginResponse.fromJson(json.decode(str));

class LoginResponse {
  LoginResponse({
    required this.accessToken,
    required this.refreshToken,
    required this.tokenType,
    required this.username,
    required this.isSuperUser,
  });

  late final String accessToken;
  late final String refreshToken;
  late final String tokenType;
  late final String username;
  late final bool isSuperUser;

  LoginResponse.fromJson(Map<String, dynamic> json) {
    accessToken = json['access_token'];
    refreshToken = json['refresh_token'];
    tokenType = json['token_type'];
    username = json['username'];
    isSuperUser = json['is_super_user'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['access_token'] = accessToken;
    data['refresh_token'] = refreshToken;
    data['token_type'] = tokenType;
    data['username'] = username;
    data['is_super_user'] = isSuperUser;
    return data;
  }
}
