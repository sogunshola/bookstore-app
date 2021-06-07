
import 'api_config.dart';

class HttpClient {
  final api = ApiConfigService();
  String resource;

  HttpClient({required this.resource});

  Future get({String url = '', dynamic data}) async {
    await api.init();
    var response =
        await api.$Request().get('$resource/$url', queryParameters: data);
    return response.data;
  }

  Future post({String url = '', dynamic data}) async {
    await api.init();
    var response = await api.$Request().post('$resource/$url', data: data);
    return response.data;
  }

  Future put({String url = '', dynamic data}) async {
    await api.init();
    var response = await api.$Request().put('$resource/$url', data: data);
    return response.data;
  }

  Future patch({String url = '', dynamic data}) async {
    await api.init();
    var response = await api.$Request().patch('$resource/$url', data: data);
    return response.data;
  }

  Future delete({String url = ''}) async {
    await api.init();
    var response = await api.$Request().delete('$resource/$url');
    return response.data;
  }
}
