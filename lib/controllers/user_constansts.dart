import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

userDetailsConstants() async {
  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  sharedPreferences.getString('user');
  Map<String, dynamic> jsonDetails =
      jsonDecode(sharedPreferences.getString('user')!);
}
