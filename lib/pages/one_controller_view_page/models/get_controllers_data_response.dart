class GetControllersDataResponse {
  GetControllersDataResponse({
    this.vin,
    this.vout,
    this.temp,
    this.charge,
    this.relay,
    this.status,
    this.createDataDateTime,
  });

  int? vin;
  int? vout;
  int? temp;
  int? charge;
  int? relay;
  bool? status;
  String? createDataDateTime;

  GetControllersDataResponse.fromJson(Map<String, dynamic> json) {
    vin = json['vin'];
    vout = json['vout'];
    temp = json['temp'];
    charge = json['charge'];
    relay = json['relay'];
    status = json['status'];
    createDataDateTime = json['create_data_datetime'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['vin'] = vin;
    data['vout'] = vout;
    data['temp'] = temp;
    data['charge'] = charge;
    data['relay'] = relay;
    data['status'] = status;
    data['create_data_datetime'] = createDataDateTime;
    return data;
  }
}
