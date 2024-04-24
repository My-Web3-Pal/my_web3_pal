import '../../../app/locator.dart';
import '../../../cores/constants/constants.dart';
import '../../../cores/utils/http_helper.dart';

class AuthService {
  final HttpHelper httpHelper = getIt<HttpHelper>();

  Future<Map<String, dynamic>> login(String email, String password) async {
    final response = await httpHelper.post(
      url: ApiEndpoints.login,
      body: {"email": email, "password": password},
    );

    return response;
  }

  Future<Map<String, dynamic>> signup(
    String username,
    String email,
    String password,
  ) async {
    final response = await httpHelper.post(
      url: ApiEndpoints.signUp,
      body: {"email": email, "password": password, "name": username},
    );

    return response;
  }
}
