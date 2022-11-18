import 'dart:convert';

LoginResponse currentUser(String str) =>
    LoginResponse.fromJson(json.decode(str));

class LoginResponse {
  LoginResponse({
    this.accessToken,
    this.refreshToken,
    this.tokenType,
    this.username,
    this.isSuperUser,
  });

  String? accessToken;
  String? refreshToken;
  String? tokenType;
  String? username;
  bool? isSuperUser;

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
