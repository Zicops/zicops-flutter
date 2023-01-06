import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:zicops/utils/colors.dart';
import 'package:zicops/views/screens/account_setup/account_setup_screen.dart';
import 'package:zicops/views/screens/account_setup/organization_tab.dart';
import 'package:zicops/views/screens/account_setup/personal_tab.dart';
import 'package:zicops/views/screens/account_setup/preferences_tab.dart';
import 'package:zicops/views/screens/change_pass/change_pass_screen.dart';
import 'package:zicops/views/screens/forget_pass/forget_pass_screen.dart';
import 'package:zicops/views/screens/home/home.dart';
import 'package:zicops/views/screens/login_screen/login_screen.dart';

import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(360, 640),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) {
          return MaterialApp(
            title: 'Zicops Demo',
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              // This is the theme of your application.
              //
              // Try running your application with "flutter run". You'll see the
              // application has a blue toolbar. Then, without quitting the app, try
              // changing the primarySwatch below to Colors.green and then invoke
              // "hot reload" (press "r" in the console where you ran "flutter run",
              // or simply save your changes to "hot reload" in a Flutter IDE).
              // Notice that the counter didn't reset back to zero; the application
              // is not restarted.
              brightness: Brightness.dark,
              scaffoldBackgroundColor: Colors.transparent,
              textTheme:
                  GoogleFonts.poppinsTextTheme(Theme.of(context).textTheme)
                      .copyWith(subtitle1: const TextStyle(color: textPrimary)),
            ),
            home: Container(
              decoration: const BoxDecoration(
                  image: DecorationImage(
                image: AssetImage("assets/images/login_bg.png"),
                fit: BoxFit.fill,
              )),
              child: LoginScreen(),
            ),
          );
        });
  }
}
