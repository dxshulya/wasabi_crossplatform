import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wasabi_crossplatform/data/dtos/api/api_favourites_dto.dart';
import 'package:wasabi_crossplatform/data/dtos/api/api_login_dto.dart';
import 'package:wasabi_crossplatform/data/dtos/api/api_message_dto.dart';
import 'package:wasabi_crossplatform/data/dtos/api/api_registration_dto.dart';
import 'package:wasabi_crossplatform/data/dtos/api/api_task_dto.dart';
import 'package:wasabi_crossplatform/data/dtos/api/api_tasks_dto.dart';
import 'package:wasabi_crossplatform/data/dtos/api/api_total_count_dto.dart';
import 'package:wasabi_crossplatform/data/dtos/api/api_user_dto.dart';
import 'package:wasabi_crossplatform/data/repositories/interceptors/api_error_interceptor.dart';
import 'package:wasabi_crossplatform/utils/datastore/datastore.dart';
import 'package:wasabi_crossplatform/utils/keys.dart';

class ApiService {
  late final Dio _dio = Dio()
    ..interceptors.addAll([
      PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        responseBody: true,
      ),
      ErrorInterceptor(_onErrorHandler),
    ]);

  final Function(String, String, String) _onErrorHandler;

  static const _baseURL = 'http://10.0.2.2:5000';

  ApiService({required Function(String, String, String) onErrorHandler})
      : _onErrorHandler = onErrorHandler;

  Future<TasksDTO> loadTasks({int page = 1}) async {
    String url = '$_baseURL/tasks/createArrayTasks';
    final sharedPreference = await SharedPreferences.getInstance();
    final String? token = sharedPreference.getString(Keys.userToken);
    final Response<dynamic> response = await _dio.get<dynamic>(
      url,
      options: Options(
        headers: {"Authorization": "Bearer $token"},
      ),
      queryParameters: <String, dynamic>{
        'page': page,
        'count': 10,
      },
    );
    return TasksDTO.fromJson(response.data);
  }

  Future<TotalCountDTO> loadTotalCount() async {
    String url = '$_baseURL/favourites/getTotalCountFavourites';
    final sharedPreference = await SharedPreferences.getInstance();
    final String? token = sharedPreference.getString(Keys.userToken);
    final Response<dynamic> response = await _dio.get<dynamic>(
      url,
      options: Options(
        headers: {"Authorization": "Bearer $token"},
      ),
    );
    return TotalCountDTO.fromJson(response.data);
  }

  Future<FavouritesDTO> loadFavourites({int page = 1}) async {
    String url = '$_baseURL/favourites/getAllFavourites';
    final sharedPreference = await SharedPreferences.getInstance();
    final String? token = sharedPreference.getString(Keys.userToken);
    final Response<dynamic> response = await _dio.get<dynamic>(
      url,
      options: Options(
        headers: {"Authorization": "Bearer $token"},
      ),
      queryParameters: <String, dynamic>{
        'page': page,
        'count': 10,
      },
    );
    return FavouritesDTO.fromJson(response.data);
  }

  Future<LoginDTO> postLogin({required UserDTO user}) async {
    String url = '$_baseURL/auth/login';
    final Response<dynamic> response = await _dio.post<dynamic>(
      url,
      data: user.toJson(),
    );
    final result = LoginDTO.fromJson(response.data);
    Datastore.setUserToken(result.token);
    Datastore.setUserName(result.login);
    return result;
  }

  Future<RegistrationDTO> postRegistration({required UserDTO user}) async {
    String url = '$_baseURL/auth/registration';
    final Response<dynamic> response = await _dio.post<dynamic>(
      url,
      data: user.toJson(),
    );
    return RegistrationDTO.fromJson(response.data);
  }

  Future<MessageDTO> postFavourite({required TaskDTO task}) async {
    String url = '$_baseURL/favourites/addedFavourites';
    final sharedPreference = await SharedPreferences.getInstance();
    final String? token = sharedPreference.getString(Keys.userToken);
    final Response<dynamic> response = await _dio.post<dynamic>(
      url,
      options: Options(
        headers: {"Authorization": "Bearer $token"},
      ),
      data: task.toJson(),
    );
    return MessageDTO.fromJson(response.data);
  }

  Future<MessageDTO> deleteFavourite({required String id}) async {
    String url = '$_baseURL/favourites/deleteFavourites';
    final sharedPreference = await SharedPreferences.getInstance();
    final String? token = sharedPreference.getString(Keys.userToken);
    final Response<dynamic> response = await _dio.delete<dynamic>(
      url,
      options: Options(
        headers: {"Authorization": "Bearer $token"},
      ),
      queryParameters: <String, dynamic>{
        'id': id,
      },
    );
    return MessageDTO.fromJson(response.data);
  }
}
