import 'package:artemis/artemis.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart';
// **************************************************************************
class GQL {
  final String baseUrl;

  GQL(this.baseUrl);

  ArtemisClient? _client;

  ArtemisClient? client() {
    if (_client == null) {
      return ArtemisClient(this.baseUrl, httpClient: AuthenticatedClient());
    }
    return _client;
  }
}

extension Artemis on ArtemisClient {
  Future<void> saveToken(String token) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setString("token", token);
  }

  Future<String> getToken() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.getString("token") ?? '';
  }

  Future<bool> isLogin() async {
    final token = await getToken();
    return (token) != '';
  }

  Future<void> loginOut() async {
    await saveToken('');
  }

  static Future<String> token() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.getString("token") ?? '';
  }
}

class AuthenticatedClient extends BaseClient {
  final Client _inner = Client();
  Future<StreamedResponse> send(BaseRequest request) async {
    final token = await Artemis.token();
    if (token != '') {
      request.headers['Authorization'] = 'Bearer $token';
    }
    return _inner.send(request);
  }
}
