class GetAllControllersResponse {
  GetAllControllersResponse({
    required this.controllerAddress,
    required this.id,
    required this.status,
  });

  late final String controllerAddress;
  late final int id;
  late final bool? status;

  GetAllControllersResponse.fromJson(Map<String, dynamic> json) {
    controllerAddress = json['controller_address'];
    id = json['id'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['controller_address'] = controllerAddress;
    data['id'] = id;
    data['status'] = status;
    return data;
  }
}
