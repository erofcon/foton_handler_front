class GetAllControllersResponse {
  GetAllControllersResponse({
    required this.controllerAddress,
    required this.id,
    required this.status,
    required this.charge,
  });

  late final String controllerAddress;
  late final int id;
  late final bool? status;
  late final int? charge;

  GetAllControllersResponse.fromJson(Map<String, dynamic> json) {
    controllerAddress = json['controller_address'];
    id = json['id'];
    status = json['status'];
    charge = json['charge'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['controller_address'] = controllerAddress;
    data['id'] = id;
    data['status'] = status;
    data['charge'] = charge;
    return data;
  }
}
