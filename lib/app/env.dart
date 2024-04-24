// ignore_for_file: non_constant_identifier_names

import 'package:flutter_dotenv/flutter_dotenv.dart';

class ENV {
  String get apiBaseUrl => dotenv.env['STAGING_BASE_URL'] ?? "";

  String get prodApiBaseUrl => dotenv.env['PROD_BASE_URL'] ?? "";
}
