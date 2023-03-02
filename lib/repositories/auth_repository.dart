import 'package:firebase_auth/firebase_auth.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../graphql_api.graphql.dart';
import '../main.dart';
import '../models/user_model.dart';

class AuthRepository {
  final _firebaseAuth = FirebaseAuth.instance;

  Future firebaseLogin({
    required String email,
    required String password,
  }) async {
    try {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      String tenant = '93f3693c-d111-51aa-86ca-b883c6dfe647';
      String? token = await FirebaseAuth.instance.currentUser?.getIdToken();
      final prefs = await SharedPreferences.getInstance();
      if (token != null) {
        await prefs.setString('token', token);
        await prefs.setString('tenant', tenant);
      }

      String lspId = '8ca0d540-aebc-5cb9-b7e0-a2f400b0e0c1';

      final userResult = await userClient.client()?.execute(LoginMutation());
      final lspData = await userClient.client()?.execute(GetUserLspByLspIdQuery(
          variables: GetUserLspByLspIdArguments(
              user_id: userResult!.data!.login!.id!, lsp_id: lspId!)));
      if (userResult?.data?.login != null) {
        await prefs.setString('userId', userResult!.data!.login!.id!);
        await prefs.setString('lspId', lspId);
        await prefs.setString(
            'userLspId', lspData!.data?.getUserLspByLspId?.userLspId ?? '');
        await prefs.setString(
            'name',
            userResult!.data!.login!.firstName! +
                ' ' +
                userResult!.data!.login!.lastName!);
        await prefs.setString('profilepic', userResult!.data!.login!.photoUrl!);
        return UserModel.fromJson(userResult.data!.login!.toJson());
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        throw Exception('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        throw Exception('Wrong password provided for that user.');
      } else if (e.code == 'too-many-requests') {
        throw Exception('Too many requests. Try again later.');
      } else {
        throw Exception('Something went wrong. Try again later.');
      }
    }
  }
}
