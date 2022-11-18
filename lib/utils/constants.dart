class ApiUrl {
  static const String url = "http://127.0.0.1:8000";
  static const String getToken = "/token";
  static const String refreshToken = "/refresh";
  static const String getAllContainers = "/get_controllers";
  static const String getControllersCount = "/get_controllers_count";
  static const String createController = "/create_controller";
  static const String deleteController = "/delete_controller";
  static const String checkDataCollectionsStatus = "/check_task_status";
  static const String dataCollectionsSetPause = "/task_pause";
  static const String dataCollectionsSetResume = "/task_resume";
  static const String getAllUsers = "/get_all_users";
  static const String createUser = "/create_user";
  static const String deleteUser = "/delete_user";
  static const String getControllerData = "/get_controller_data";
}

class UiConstants {
  static const double defaultPadding = 16;
}

class Constants{
  static const int updatePeriodMinute = 5;
}
