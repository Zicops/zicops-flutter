import 'package:artemis/artemis.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:http/http.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
    String token = sharedPreferences.getString("token") ?? '';
    if (JwtDecoder.isExpired(token)) {
      token = await FirebaseAuth.instance.currentUser?.getIdToken() ?? '';
      await saveToken(token);
    }
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
    String token = sharedPreferences.getString("token") ?? '';
    if (token == '' || JwtDecoder.isExpired(token)) {
      token = await FirebaseAuth.instance.currentUser?.getIdToken() ?? '';
      await sharedPreferences.setString("token", token);
    }
    return sharedPreferences.getString("token") ?? '';
  }

  static Future<String> tenant() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.getString("tenant") ?? '';
  }
}

class AuthenticatedClient extends BaseClient {
  final Client _inner = Client();
  Future<StreamedResponse> send(BaseRequest request) async {
    final token = await Artemis.token();
    final tenant = await Artemis.tenant();
    if (token != '') {
      request.headers['zmobile'] = 'true';
      request.headers['Authorization'] = 'Bearer $token';
      request.headers['tenant'] = tenant;
    }
    return _inner.send(request);
  }
}
