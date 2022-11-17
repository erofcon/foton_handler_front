class DeleteControllerRequest {
  DeleteControllerRequest({
    required this.controllerId,
  });

  late final String controllerId;

  DeleteControllerRequest.fromJson(Map<String, dynamic> json) {
    controllerId = json['controller_id'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['controller_id'] = controllerId;
    return data;
  }
}
