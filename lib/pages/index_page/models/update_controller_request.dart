class UpdateControllerRequest {
  UpdateControllerRequest({
    required this.id,
    required this.localAddress,
    required this.controllerAddress,
    required this.login,
    required this.password,
  });

  late final int id;
  late final String localAddress;
  late final String controllerAddress;
  late final String login;
  late final String password;

  UpdateControllerRequest.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    localAddress = json['local_address'];
    controllerAddress = json['controller_address'];
    login = json['login'];
    password = json['password'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['local_address'] = localAddress;
    data['controller_address'] = controllerAddress;
    data['login'] = login;
    data['password'] = password;
    return data;
  }
}
