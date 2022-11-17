class CheckDataCollectionsStatusResponse {
  CheckDataCollectionsStatusResponse({
    this.taskStatus,
  });

  int ? taskStatus;

  CheckDataCollectionsStatusResponse.fromJson(Map<String, dynamic> json) {
    taskStatus = json['task_status'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['task_status'] = taskStatus;
    return data;
  }
}
