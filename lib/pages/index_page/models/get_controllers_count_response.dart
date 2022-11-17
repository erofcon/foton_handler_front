class GetControllerCountResponse {
  GetControllerCountResponse({
    required this.count,
  });

  late final int count;

  GetControllerCountResponse.fromJson(Map<String, dynamic> json) {
    count = json['count'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['count'] = count;
    return data;
  }
}
