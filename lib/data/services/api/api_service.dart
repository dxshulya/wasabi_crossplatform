import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:wasabi_crossplatform/data/dtos/api/api_favourites_dto.dart';
import 'package:wasabi_crossplatform/data/dtos/api/api_login_dto.dart';
import 'package:wasabi_crossplatform/data/dtos/api/api_tasks_dto.dart';
import 'package:wasabi_crossplatform/data/dtos/api/api_user_dto.dart';
import 'package:wasabi_crossplatform/data/repositories/interceptors/api_error_interceptor.dart';
import 'dart:developer' as developer;
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

  final Function(String, String) _onErrorHandler;

  static const _baseURL = 'http://10.0.2.2:5000';

  ApiService({required Function(String, String) onErrorHandler})
      : _onErrorHandler = onErrorHandler;

  Future<TasksDTO> loadTasks({int page = 1}) async {
    String url = '$_baseURL/tasks/createArrayTasks';
    final Response<dynamic> response = await _dio.get<dynamic>(
      url,
      options: Options(
        headers: {
          "Authorization":
              "Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJlbWFpbCI6ImRhcmFAbWFpbC5jb20iLCJpZCI6MSwiaWF0IjoxNjc0NjU2NTU2fQ.StrvFnMbfLWVwYHez9mBmGsLGQqCWyuXQcAlYpRE-b0"
        },
      ),
      queryParameters: <String, dynamic>{
        'page': page,
        'count': 10,
      },
    );
    return TasksDTO.fromJson(response.data);
  }

  Future<FavouritesDTO> loadFavourites({int page = 1}) async {
    String url = '$_baseURL/favourites/getAllFavourites';
    final Response<dynamic> response = await _dio.get<dynamic>(
      url,
      options: Options(
        headers: {
          "Authorization":
          "Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJlbWFpbCI6ImRhcmFAbWFpbC5jb20iLCJpZCI6MSwiaWF0IjoxNjc0NjU2NTU2fQ.StrvFnMbfLWVwYHez9mBmGsLGQqCWyuXQcAlYpRE-b0"
        },
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
    return LoginDTO.fromJson(response.data);
  }
}
