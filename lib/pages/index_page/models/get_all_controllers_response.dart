class GetAllControllersResponse {
  GetAllControllersResponse({
    required this.controllerAddress,
    required this.id,
    required this.status,
    required this.charge,
    required this.localAddress,
  });

  late final String controllerAddress;
  late final int id;
  late final bool? status;
  late final int? charge;
  late final String? localAddress;

  GetAllControllersResponse.fromJson(Map<String, dynamic> json) {
    controllerAddress = json['controller_address'];
    id = json['id'];
    status = json['status'];
    charge = json['charge'];
    localAddress = json['local_address'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['controller_address'] = controllerAddress;
    data['id'] = id;
    data['status'] = status;
    data['charge'] = charge;
    data['local_address'] = localAddress;
    return data;
  }
}
