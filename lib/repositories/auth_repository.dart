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
      await _firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);
      //    String lspId = '8ca0d540-aebc-5cb9-b7e0-a2f400b0e0c1';
      String? token = await FirebaseAuth.instance.currentUser?.getIdToken();
      final prefs = await SharedPreferences.getInstance();
      if (token != null) {
        await prefs.setString('token', token);
      }

      final userResult = await userClient.client()?.execute(LoginMutation());
      if (userResult?.data?.login != null) {
        await prefs.setString('userId', userResult!.data!.login!.id!);
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

  Future logout() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.clear();
    await FirebaseAuth.instance.signOut();
  }
}
