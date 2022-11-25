class GetControllersDataResponse {
  GetControllersDataResponse({
    this.vin,
    this.vout,
    this.temp,
    this.charge,
    this.relay,
    this.createDataDateTime,
  });

  int? vin;
  int? vout;
  int? temp;
  int? charge;
  int? relay;
  String? createDataDateTime;

  GetControllersDataResponse.fromJson(Map<String, dynamic> json) {
    vin = json['vin'];
    vout = json['vout'];
    temp = json['temp'];
    charge = json['charge'];
    relay = json['relay'];
    createDataDateTime = json['create_data_datetime'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['vin'] = vin;
    data['vout'] = vout;
    data['temp'] = temp;
    data['charge'] = charge;
    data['relay'] = relay;
    data['create_data_datetime'] = createDataDateTime;
    return data;
  }
}
