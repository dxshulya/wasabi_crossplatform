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
import 'package:wasabi_crossplatform/domain/services/api/abstract_api_service.dart';
import 'package:wasabi_crossplatform/utils/api.dart';
import 'package:wasabi_crossplatform/utils/keys.dart';

class ApiService implements AbstractApiService {
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

  ApiService({required Function(String, String, String) onErrorHandler})
      : _onErrorHandler = onErrorHandler;

  @override
  Future<TasksDTO> loadTasks({int page = 1}) async {
    String url = "${Api.baseURL}${Api.getTasksQuery}";
    final sharedPreference = await SharedPreferences.getInstance();
    final String? token = sharedPreference.getString(Keys.userToken);
    final Response<dynamic> response = await _dio.get<dynamic>(
      url,
      options: Options(
        headers: {Api.headerAuth: "${Api.headerBearer} $token"},
      ),
      queryParameters: <String, dynamic>{
        Api.pageParameter: page,
        Api.countParameter: 10,
      },
    );
    return TasksDTO.fromJson(response.data);
  }

  @override
  Future<TotalCountDTO> loadTotalCount() async {
    String url = "${Api.baseURL}${Api.getTotalCountQuery}";
    final sharedPreference = await SharedPreferences.getInstance();
    final String? token = sharedPreference.getString(Keys.userToken);
    final Response<dynamic> response = await _dio.get<dynamic>(
      url,
      options: Options(
        headers: {Api.headerAuth: "${Api.headerBearer} $token"},
      ),
    );
    return TotalCountDTO.fromJson(response.data);
  }

  @override
  Future<FavouritesDTO> loadFavourites({int page = 1}) async {
    String url = "${Api.baseURL}${Api.getFavouritesQuery}";
    final sharedPreference = await SharedPreferences.getInstance();
    final String? token = sharedPreference.getString(Keys.userToken);
    final Response<dynamic> response = await _dio.get<dynamic>(
      url,
      options: Options(
        headers: {Api.headerAuth: "${Api.headerBearer} $token"},
      ),
      queryParameters: <String, dynamic>{
        Api.pageParameter: page,
        Api.countParameter: 10,
      },
    );
    return FavouritesDTO.fromJson(response.data);
  }

  @override
  Future<LoginDTO> postLogin({required UserDTO user}) async {
    String url = "${Api.baseURL}${Api.postLoginQuery}";
    final Response<dynamic> response = await _dio.post<dynamic>(
      url,
      data: user.toJson(),
    );
    return LoginDTO.fromJson(response.data);
  }

  @override
  Future<RegistrationDTO> postRegistration({required UserDTO user}) async {
    String url = "${Api.baseURL}${Api.postRegistrationQuery}";
    final Response<dynamic> response = await _dio.post<dynamic>(
      url,
      data: user.toJson(),
    );
    return RegistrationDTO.fromJson(response.data);
  }

  @override
  Future<MessageDTO> postFavourite({required TaskDTO task}) async {
    String url = "${Api.baseURL}${Api.postFavouriteQuery}";
    final sharedPreference = await SharedPreferences.getInstance();
    final String? token = sharedPreference.getString(Keys.userToken);
    final Response<dynamic> response = await _dio.post<dynamic>(
      url,
      options: Options(
        headers: {Api.headerAuth: "${Api.headerBearer} $token"},
      ),
      data: task.toJson(),
    );
    return MessageDTO.fromJson(response.data);
  }

  @override
  Future<MessageDTO> deleteFavourite({required String id}) async {
    String url = "${Api.baseURL}${Api.deleteFavouriteQuery}";
    final sharedPreference = await SharedPreferences.getInstance();
    final String? token = sharedPreference.getString(Keys.userToken);
    final Response<dynamic> response = await _dio.delete<dynamic>(
      url,
      options: Options(
        headers: {Api.headerAuth: "${Api.headerBearer} $token"},
      ),
      queryParameters: <String, dynamic>{
        Api.idParameter: id,
      },
    );
    return MessageDTO.fromJson(response.data);
  }
}
