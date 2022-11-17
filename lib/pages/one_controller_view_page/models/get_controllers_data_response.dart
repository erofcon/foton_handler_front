class GetControllersDataResponse {
  GetControllersDataResponse({
    this.vin,
    this.createDataDateTime,
  });

  int ?vin;
  String ?createDataDateTime;

  GetControllersDataResponse.fromJson(Map<String, dynamic> json) {
    vin = json['vin'];
    createDataDateTime = json['create_data_datetime'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['create_data_datetime'] = createDataDateTime;
    data['vin'] = vin;
    return data;
  }
}
