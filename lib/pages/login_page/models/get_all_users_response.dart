class GetAllUserResponse {
  GetAllUserResponse({this.id, this.username, this.isSuperUser});

  int? id;
  String? username;
  bool? isSuperUser;

  GetAllUserResponse.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    username = json['username'];
    isSuperUser = json['is_super_user'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['is_super_user'] = isSuperUser;
    data['username'] = username;
    return data;
  }
}
