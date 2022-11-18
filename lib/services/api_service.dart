import 'package:dio/dio.dart';
import 'package:foton_handler_front/pages/one_controller_view_page/models/get_controllers_data_request.dart';
import 'package:foton_handler_front/pages/one_controller_view_page/models/get_controllers_data_response.dart';
import 'package:foton_handler_front/routes/routes.dart';
import 'package:get/get.dart' as get_x;
import 'package:get/get_connect/http/src/status/http_status.dart';

import '../pages/index_page/models/check_data_collections_status_response.dart';
import '../pages/index_page/models/create_controler_request.dart';
import '../pages/index_page/models/delete_controller_request.dart';
import '../pages/index_page/models/get_all_controllers_response.dart';
import '../pages/index_page/models/get_controllers_count_response.dart';
import '../pages/login_page/models/create_user_request.dart';
import '../pages/login_page/models/get_all_users_response.dart';
import '../pages/login_page/models/login_request.dart';
import '../pages/login_page/models/login_response.dart';
import '../pages/login_page/service/login_cache.dart';
import '../utils/constants.dart';

class ApiService with LoginCache {
  final Dio _api = Dio();

  ApiService() {
    _api.interceptors
        .add(InterceptorsWrapper(onRequest: (options, handler) async {
      final token = getToken();
      options.headers["Authorization"] = "Bearer ${token ?? ''}";
      return handler.next(options);
    }, onError: (DioError error, handler) async {
      if (error.response?.statusCode == HttpStatus.unauthorized) {
        if (await refreshToken()) {
          return handler.resolve(await _retry(error.requestOptions));
        } else {
          get_x.Get.offAllNamed(RoutesClass.login);
        }
      } else {
        get_x.Get.offAllNamed(RoutesClass.login);
      }
      return handler.next(error);
    }));
  }

  Future<bool> login(LoginRequest model) async {
    try {
      var formData = FormData.fromMap(model.toJson());
      String baseUrl = getHostAddress() ?? ApiUrl.url;
      final response =
          await Dio().post(baseUrl + ApiUrl.getToken, data: formData);

      if (response.statusCode == HttpStatus.ok) {
        await saveUser(LoginResponse.fromJson(response.data));

        return true;
      } else {
        return false;
      }
    } on Exception {
      return false;
    }
  }

  Future<bool> refreshToken() async {
    try {
      final refreshData = getRefreshToken();

      if (refreshData != null) {
        String baseUrl = getHostAddress() ?? ApiUrl.url;

        final response = await Dio()
            .post(baseUrl + ApiUrl.refreshToken, queryParameters: refreshData);

        if (response.statusCode == HttpStatus.ok) {
          await saveUser(LoginResponse.fromJson(response.data));
          return true;
        } else {
          await removeUser();
          return false;
        }
      }
      return false;
    } on DioError {
      return false;
    }
  }

  Future<Response<dynamic>> _retry(RequestOptions requestOptions) async {
    final options = Options(
      method: requestOptions.method,
      headers: requestOptions.headers,
    );
    return _api.request<dynamic>(requestOptions.path,
        data: requestOptions.data,
        queryParameters: requestOptions.queryParameters,
        options: options);
  }

  Future<List<GetAllControllersResponse>?> getControllers() async {
    try {
      String baseUrl = getHostAddress() ?? ApiUrl.url;
      final response = await _api.get(baseUrl + ApiUrl.getAllContainers);

      if (response.statusCode == HttpStatus.ok) {
        return List<GetAllControllersResponse>.from(response.data
            .map((dynamic row) => GetAllControllersResponse.fromJson(row)));
      } else {
        return null;
      }
    } on DioError {
      return null;
    }
  }

  Future<GetControllerCountResponse?> getControllerCount() async {
    try {
      String baseUrl = getHostAddress() ?? ApiUrl.url;
      final response = await _api.get(baseUrl + ApiUrl.getControllersCount);

      if (response.statusCode == HttpStatus.ok) {
        return GetControllerCountResponse.fromJson(response.data);
      } else {
        return null;
      }
    } on DioError {
      return null;
    }
  }

  Future<bool> createController(
      CreateControllerRequest createControllerRequest) async {
    try {
      String baseUrl = getHostAddress() ?? ApiUrl.url;
      final response = await _api.post(baseUrl + ApiUrl.createController,
          data: createControllerRequest.toJson());
      if (response.statusCode == HttpStatus.ok) {
        return true;
      } else {
        return false;
      }
    } on DioError {
      return false;
    }
  }

  Future<bool> deleteController(
      DeleteControllerRequest deleteControllerRequest) async {
    try {
      String baseUrl = getHostAddress() ?? ApiUrl.url;
      final response = await _api.delete(baseUrl + ApiUrl.deleteController,
          queryParameters: deleteControllerRequest.toJson());
      if (response.statusCode == HttpStatus.ok) {
        return true;
      } else {
        return false;
      }
    } on DioError {
      return false;
    }
  }

  Future<CheckDataCollectionsStatusResponse?> getDataCollectionsStatus() async {
    try {
      String baseUrl = getHostAddress() ?? ApiUrl.url;
      final response =
          await _api.get(baseUrl + ApiUrl.checkDataCollectionsStatus);
      if (response.statusCode == HttpStatus.ok) {
        return CheckDataCollectionsStatusResponse.fromJson(response.data);
      } else {
        return null;
      }
    } on DioError {
      return null;
    }
  }

  Future<bool> setDataCollectionsResume() async {
    try {
      String baseUrl = getHostAddress() ?? ApiUrl.url;
      final response =
          await _api.post(baseUrl + ApiUrl.dataCollectionsSetResume);
      if (response.statusCode == HttpStatus.ok) {
        return true;
      } else {
        return false;
      }
    } on DioError {
      return false;
    }
  }

  Future<bool> setDataCollectionsPause() async {
    try {
      String baseUrl = getHostAddress() ?? ApiUrl.url;
      final response =
          await _api.post(baseUrl + ApiUrl.dataCollectionsSetPause);
      if (response.statusCode == HttpStatus.ok) {
        return true;
      } else {
        return false;
      }
    } on DioError {
      return false;
    }
  }

  Future<bool> createUser(CreateUserRequest createUserRequest) async {
    try {
      String baseUrl = getHostAddress() ?? ApiUrl.url;
      final response = await _api.post(baseUrl + ApiUrl.createUser,
          data: createUserRequest.toJson());
      if (response.statusCode == HttpStatus.ok) {
        return true;
      } else {
        return false;
      }
    } on DioError {
      return false;
    }
  }

  Future<List<GetAllUserResponse>?> getAllUsers() async {
    try {
      String baseUrl = getHostAddress() ?? ApiUrl.url;
      final response = await _api.get(baseUrl + ApiUrl.getAllUsers);

      if (response.statusCode == HttpStatus.ok) {
        return List<GetAllUserResponse>.from(response.data
            .map((dynamic row) => GetAllUserResponse.fromJson(row)));
      } else {
        return null;
      }
    } on DioError {
      return null;
    }
  }

  Future<bool> deleteUser(int userId) async {
    try {
      String baseUrl = getHostAddress() ?? ApiUrl.url;
      final response = await _api.delete(baseUrl + ApiUrl.deleteUser,
          queryParameters: {"user_id": userId});
      if (response.statusCode == HttpStatus.ok) {
        return true;
      } else {
        return false;
      }
    } on DioError {
      return false;
    }
  }

  Future<List<GetControllersDataResponse>?> getControllerData(
      GetControllersDataRequest controllersDataRequest) async {
    try {
      String baseUrl = getHostAddress() ?? ApiUrl.url;
      final response = await _api.get(baseUrl + ApiUrl.getControllerData,
          queryParameters: controllersDataRequest.toJson());

      if (response.statusCode == HttpStatus.ok) {
        return List<GetControllersDataResponse>.from(response.data
            .map((dynamic row) => GetControllersDataResponse.fromJson(row)));
      } else {
        return null;
      }
    } on DioError {
      return null;
    }
  }
}
