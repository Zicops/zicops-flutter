import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:zicops/blocs/blocs.dart';
import 'package:zicops/gql_client.dart';
import 'package:zicops/repo/dummy_repository.dart';
import 'package:zicops/repo/user_repository.dart';
import 'package:zicops/utils/colors.dart';
import 'package:zicops/views/screens/login_screen/login_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';
import 'firebase_options.dart';

final GQL userClient = GQL('https://demo.zicops.com/um/api/v1/query');
final GQL courseQClient = GQL('https://demo.zicops.com/cq/api/v1/query');

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final storage = await HydratedStorage.build(
    storageDirectory: await getApplicationDocumentsDirectory(),
  );
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  HydratedBlocOverrides.runZoned(
    () => runApp(RepositoryProvider(
      create: (context) => UserRepository(),
      child: const MyApp(),
    )),
    storage: storage,
  );

  // runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => UserBloc(
            RepositoryProvider.of<UserRepository>(context),
          ),
        ),
        // BlocProvider(
        //   create: (context) => SubjectBloc(),
        // ),
      ],
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
              home: Container(
                decoration: const BoxDecoration(
                    image: DecorationImage(
                  image: AssetImage("assets/images/login_bg.png"),
                  fit: BoxFit.fill,
                )),
                child: LoginScreen(),
              ),
            );
          }),
    );
  }
}
