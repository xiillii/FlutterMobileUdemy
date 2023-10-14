import 'package:dio/dio.dart';
import 'package:teslo_app/config/constants/environment.dart';
import 'package:teslo_app/features/auth/domain/domain.dart';
import 'package:teslo_app/features/auth/infrastructure/infrastructure.dart';

class AuthDatasourceImpl extends AuthDatasource {
  final dio = Dio(BaseOptions(baseUrl: Environment.apiUrl));

  @override
  Future<User> checkAuthStatus(String token) {
    // TODO: implement checkAuthStatus
    throw UnimplementedError();
  }

  @override
  Future<User> login(String email, String password) async {
    try {
      final response = await dio
          .post('/auth/login', data: {'email': email, 'password': password});

      final user = UserMapper.fromJson(response.data);

      return user;
    } on DioException catch (e) {
      if (e.response?.statusCode == 401 || e.response?.statusCode == 400) {
        throw WrongCredentials();
      }
      if (e.type == DioExceptionType.connectionError) throw ConnectionError();
      if (e.type == DioExceptionType.connectionTimeout) {
        throw ConnectionTimeout();
      }
      throw CustomError(message: 'Error desconocido', errorCode: 1);
    } catch (e) {
      throw CustomError(message: 'Error desconocido', errorCode: 2);
    }
  }

  @override
  Future<User> register(String fullname, String email, String password) {
    // TODO: implement register
    throw UnimplementedError();
  }
}
