class GetControllerToEditResponse {
  GetControllerToEditResponse({
    required this.id,
    required this.localAddress,
    required this.controllerAddress,
    required this.login,
    required this.password,
    required this.createDateTime,
  });

  late final int id;
  late final String localAddress;
  late final String controllerAddress;
  late final String login;
  late final String password;
  late final String createDateTime;

  GetControllerToEditResponse.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    localAddress = json['local_address'];
    controllerAddress = json['controller_address'];
    login = json['login'];
    password = json['password'];
    createDateTime = json['create_date_time'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['local_address'] = localAddress;
    data['controller_address'] = controllerAddress;
    data['login'] = login;
    data['password'] = password;
    data['create_date_time'] = createDateTime;
    return data;
  }
}
