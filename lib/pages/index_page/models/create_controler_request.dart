class CreateControllerRequest {
  CreateControllerRequest({
    required this.controllerAddress,
    required this.login,
    required this.password,
  });

  late final String controllerAddress;
  late final String login;
  late final String password;

  CreateControllerRequest.fromJson(Map<String, dynamic> json) {
    controllerAddress = json['controller_address'];
    login = json['login'];
    password = json['password'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['controller_address'] = controllerAddress;
    data['login'] = login;
    data['password'] = password;
    return data;
  }
}
