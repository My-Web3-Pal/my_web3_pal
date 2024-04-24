import '../../app/env.dart';
import '../../app/locator.dart';

class ApiEndpoints {
  static const String _versionOne = '/api';

  // static const _isDebug = kDebugMode;

  static final String _baseUrlV1 = (() {
    return getIt<ENV>().apiBaseUrl + _versionOne;
    // if (_isDebug) {
    // } else {
    //   return getIt<ENV>().prodApiBaseUrl + _versionOne;
    // }
  })();

  String get baseUrl => _baseUrlV1;

  /// Auth
  static final String login = '$_baseUrlV1/auth/login';
  static final String logout = '$_baseUrlV1/auth/logout';
  static final String signUp = '$_baseUrlV1/auth/signup';
}
