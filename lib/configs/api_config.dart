import 'package:dio/dio.dart';
import '../main.dart';

import 'app_globals.dart';

class ApiConfigService {
  Dio dio = Dio();
  String? token;

  Future<void> init() async {
    await getIt.get<AppGlobals>().connectivity!.checkConnection();
    token = getIt.get<AppGlobals>().token;
    // this.token = await _storage.readValue('token');
  }

  Dio $ImageRequest() {
    dio.options.baseUrl = 'https://api.imgur.com/3';
    dio.options.headers = {'Authorization': 'Client-ID 04a0a3cc3d4a4e8'};
    return dio;
  }

  Dio $Request() {
    dio.options.baseUrl = baseUrl().toString();
    dio.options.headers = setHeaders();
    return dio;
  }

  String baseUrl() {
    const server = 'remote';
    // Using local url
    if (server == 'local') return 'http://192.168.1.135:3000/api/';

    // Remote url
    return 'https://api.itbook.store/';
  }

  Map<String, dynamic> setHeaders() {
    Map<String, dynamic> header = {
      "Accept": "application/json",
      "Content-Type": "application/json",
      "Authorization": "Bearer $token"
    };
    // print("user header $header");
    return header;
  }

  Dio $LoginRequest() {
    dio.options.baseUrl = baseUrl().toString();
    return dio;
  }
}
