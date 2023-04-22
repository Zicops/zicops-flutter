import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:zicops/blocs/auth/auth_bloc.dart';
import 'package:zicops/gql_client.dart';
import 'package:zicops/repositories/auth_repository.dart';
import 'package:zicops/utils/colors.dart';
import 'package:zicops/views/screens/home/home.dart';
import 'package:zicops/views/screens/login_screen/login_screen.dart';

import 'firebase_options.dart';

final GQL userClient = GQL('https://demo.zicops.com/um/api/v1/query');
final GQL courseQClient = GQL('https://demo.zicops.com/cq/api/v1/query');

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
    return RepositoryProvider(
      create: (context) => AuthRepository(),
      child: BlocProvider(
        create: (context) => AuthBloc(
            authRepository: RepositoryProvider.of<AuthRepository>(context)),
        child: ScreenUtilInit(
            designSize: const Size(360, 640),
            minTextAdapt: true,
            splitScreenMode: true,
            builder: (context, child) {
              return MaterialApp(
                title: 'Zicops Demo',
                debugShowCheckedModeBanner: false,
                theme: ThemeData(
                  brightness: Brightness.dark,
                  scaffoldBackgroundColor: Colors.transparent,
                  textTheme:
                      GoogleFonts.poppinsTextTheme(Theme.of(context).textTheme)
                          .copyWith(
                              subtitle1: const TextStyle(color: textPrimary)),
                ),
                home: Builder(builder: (context) {
                  FirebaseAuth auth = FirebaseAuth.instance;
                  if (auth.currentUser != null) {
                    return Container(
                      decoration: const BoxDecoration(
                          image: DecorationImage(
                        image: AssetImage("assets/images/login_bg.png"),
                        fit: BoxFit.fill,
                      )),
                      child: HomePage(),
                    );
                  }
                  return Container(
                    decoration: const BoxDecoration(
                        image: DecorationImage(
                      image: AssetImage("assets/images/login_bg.png"),
                      fit: BoxFit.fill,
                    )),
                    child: LoginScreen(),
                  );
                }),
              );
            }),
      ),
    );
  }
}
