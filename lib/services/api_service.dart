import 'package:dio/dio.dart';
import 'package:foton_handler_front/routes/routes.dart';
import 'package:get/get.dart' as get_x;
import 'package:get/get_connect/http/src/status/http_status.dart';

import '../pages/index_page/models/get_all_controllers_response.dart';
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
      }
      return handler.next(error);
    }));
  }

  Future<bool> login(LoginRequest model) async {
    try {
      var formData = FormData.fromMap(model.toJson());
      final response = await _api.post(ApiUrl.getToken, data: formData);

      if (response.statusCode == HttpStatus.ok) {
        await saveUser(LoginResponse.fromJson(response.data));

        return true;
      } else {
        return false;
      }
    } on DioError {
      return false;
    }
  }

  Future<bool> refreshToken() async {
    try {
      final refreshData = getRefreshToken();

      if (refreshData != null) {
        final response =
            await Dio().post(ApiUrl.refreshToken, data: refreshData);

        if (response.statusCode == HttpStatus.ok) {
          await saveUser(LoginResponse.fromJson(response.data));
          return true;
        } else {
          await logout();
          return false;
        }
      }
      return false;
    } catch (e) {
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
      final response = await _api.get(ApiUrl.getAllContainers);

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
}
