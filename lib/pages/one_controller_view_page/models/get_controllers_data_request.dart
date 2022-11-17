class GetControllersDataRequest {
  GetControllersDataRequest(
      {required this.controllerId,
      required this.startDatetime,
      required this.endDatetime});

  late final int controllerId;
  late final String startDatetime;
  late final String endDatetime;

  GetControllersDataRequest.fromJson(Map<String, dynamic> json) {
    controllerId = json['controller_id'];
    startDatetime = json['start_datetime'];
    endDatetime = json['end_datetime'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['controller_id'] = controllerId;
    data['start_datetime'] = startDatetime;
    data['end_datetime'] = endDatetime;
    return data;
  }
}
