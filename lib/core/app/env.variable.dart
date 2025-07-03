import 'package:flutter_dotenv/flutter_dotenv.dart';

enum EnvTypeEnum { dev, prod }

class EnvVariable {
  EnvVariable._();
  static final EnvVariable instance = EnvVariable._();
  // String _buildDeveloper = '';
  String _envType = '';
  // String _notifcationBaseUrl = '';
  Future<void> init({required EnvTypeEnum envType}) async {
    switch (envType) {
      case EnvTypeEnum.dev:
        await dotenv.load(fileName: '.env.dev');
      case EnvTypeEnum.prod:
        await dotenv.load(fileName: '.env.prod');
    }
    // Consider adding error handling if ENV_TYPE is not found
    _envType = dotenv.get('ENV_TYPE');
    // _notifcationBaseUrl = dotenv.get('NOTFICATION_BASEURL');
    // _buildDeveloper = dotenv.get('BUILD_DEVELOPER');
  }

  /// Indicates if the current environment is for development.
  bool get debugMode => _envType == 'dev';
  // String get notifcationBaseUrl => _notifcationBaseUrl;
  // String get buildDeveloper => _buildDeveloper;
}
