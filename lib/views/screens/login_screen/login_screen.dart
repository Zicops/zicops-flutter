import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:zicops/utils/colors.dart';
import 'package:zicops/views/screens/forget_pass/forget_pass_screen.dart';
import 'package:zicops/views/screens/login_screen/lsp_selection.dart';
import 'package:zicops/views/widgets/GradientButton.dart';

import '../../../blocs/auth/auth_bloc.dart';
import '../../../repositories/auth_repository.dart';
import '../../../utils/validation.dart';
import '../../widgets/CustomPassword.dart';
import '../../widgets/PrefixInputField.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _LoginScreen();
  }
}

class HttpClientWithToken extends http.BaseClient {
  HttpClientWithToken(this.token);

  final String token;
  final http.Client _client = http.Client();

  @override
  Future<http.StreamedResponse> send(http.BaseRequest request) {
    request.headers['Authorization'] = 'Bearer ' + token;
    return _client.send(request);
  }
}

class _LoginScreen extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  // bool _passwordVisible = false;
  bool showErrorP = false;
  String errorMsgP = "hello";
  bool _keyboardVisible = false;
  bool isLoading = false;
  bool isEmailValidated = false;
  bool isFirstLogin = true;

  // void _changeVisibility() {
  //   setState(() {
  //     _passwordVisible = !_passwordVisible;
  //   });
  // }

  onPasswordChange() {
    setState(() {
      if (showErrorP) showErrorP = false;
    });
  }

  final List<FocusNode> _focusNodes = [FocusNode(), FocusNode()];

  @override
  void initState() {
    for (var node in _focusNodes) {
      node.addListener(() {
        setState(() {});
      });
    }
    super.initState();
  }

  @override
  void dispose() {
    for (var node in _focusNodes) {
      node.removeListener(() {});
    }
    // _emailController.dispose();
    // _passwordController.dispose();

    super.dispose();
  }

  isFocusedOrNotEmpty() {
    return _focusNodes[0].hasFocus ||
        _focusNodes[1].hasFocus ||
        _emailController.text.isNotEmpty ||
        _passwordController.text.isNotEmpty;
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    _keyboardVisible = MediaQuery.of(context).viewInsets.bottom != 0;

    return Scaffold(
      body: BlocProvider(
        create: (context) => AuthBloc(authRepository: AuthRepository()),
        child: BlocConsumer<AuthBloc, AuthState>(
          listener: (context, state) {
            if (state is Authenticated) {
              print("pushing to lsp selection screen");
              Navigator.pushReplacement(
                  context,
                  PageRouteBuilder(
                      pageBuilder: (context, animation, secondaryAnimation) =>
                          const LspSelectionScreen(),
                      transitionsBuilder:
                          (context, animation, secondaryAnimation, child) {
                        return SlideTransition(
                          position: animation.drive(
                              Tween(begin: const Offset(1, 0), end: Offset.zero)
                                  .chain(CurveTween(curve: Curves.ease))),
                          child: child,
                        );
                      }));
            }
          },
          builder: (context, state) {
            print(state);
            if (state is Unauthenticated ||
                state is AuthError ||
                state is Authenticating) {
              if (state is Authenticating) {
                isLoading = true;
              } else {
                isLoading = false;
              }
              errorMsgP = state is AuthError ? state.error : "";
              if (state is AuthError) {
                showErrorP = true;
              } else {
                showErrorP = false;
              }
              return SafeArea(
                child: Container(
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                    image: AssetImage("assets/images/login_bg.png"),
                    fit: BoxFit.fill,
                  )),
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: KeyboardVisibilityBuilder(
                      builder: (context, isKeyboardVisible) {
                    return CustomScrollView(slivers: [
                      SliverFillRemaining(
                          hasScrollBody: false,
                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                const SizedBox(height: 20),
                                Row(
                                  mainAxisAlignment: isKeyboardVisible
                                      ? MainAxisAlignment.start
                                      : MainAxisAlignment.center,
                                  children: [
                                    isKeyboardVisible
                                        ? Text(
                                            'Welcome!',
                                            style: TextStyle(
                                                fontSize: 24.sp,
                                                fontWeight: FontWeight.w500,
                                                color: textPrimary),
                                            textAlign: TextAlign.start,
                                          )
                                        : Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              Image.asset(
                                                "assets/images/zicops_logo.png",
                                                width: 40.sp,
                                              ),
                                              SizedBox(height: 20.sp),
                                              Image.asset(
                                                "assets/images/zicops_name.png",
                                                width: 120.sp,
                                                height: 20.sp,
                                              ),
                                              SizedBox(height: 20.sp),
                                              SizedBox(
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.70,
                                                child: Text(
                                                  "Sign Into your Learning Space!",
                                                  style: GoogleFonts.poppins(
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      fontSize: 28.sp,
                                                      color: textPrimary,
                                                      height: 1.3),
                                                  textAlign: TextAlign.center,
                                                ),
                                              ),
                                            ],
                                          )
                                  ],
                                ),
                                SizedBox(height: 4.sp),
                                SizedBox(
                                  width: isFocusedOrNotEmpty()
                                      ? double.infinity
                                      : MediaQuery.of(context).size.width * 0.5,
                                  child: Text(
                                    "Start your first step to learning here!",
                                    style: TextStyle(
                                        fontSize: 16.sp,
                                        color: textGrey2,
                                        height: 1.5),
                                    textAlign: isKeyboardVisible
                                        ? TextAlign.start
                                        : TextAlign.center,
                                  ),
                                ),
                                SizedBox(
                                    height:
                                        isFocusedOrNotEmpty() ? 20.sp : 28.sp),
                                prefixInputField(
                                  _focusNodes[0],
                                  _emailController,
                                  "assets/images/email.png",
                                  "Email",
                                  true,
                                  validated: isEmailValidated,
                                  onChange: (e) {
                                    setState(() {
                                      isEmailValidated = isValidEmail(e);
                                    });
                                  },
                                  inputType: TextInputType.emailAddress,
                                ),
                                SizedBox(height: 12.sp),
                                CustomPassword(
                                  _focusNodes[1],
                                  _passwordController,
                                  "Password",
                                  showErrorP,
                                  errorMsgP,
                                  onChange: () {
                                    onPasswordChange();
                                  },
                                ),
                                !isKeyboardVisible
                                    ? SizedBox(
                                        height: 20.sp,
                                      )
                                    : Spacer(),
                                Row(
                                  children: [
                                    Expanded(
                                        child: Column(
                                      children: [
                                        Align(
                                            alignment: Alignment.centerRight,
                                            child: GestureDetector(
                                              onTap: () {
                                                Navigator.push(
                                                    context,
                                                    PageRouteBuilder(
                                                        pageBuilder: (context,
                                                                animation,
                                                                secondaryAnimation) =>
                                                            const ForgetPassScreen(),
                                                        transitionsBuilder:
                                                            (context,
                                                                animation,
                                                                secondaryAnimation,
                                                                child) {
                                                          return SlideTransition(
                                                            position: animation.drive(Tween(
                                                                    begin:
                                                                        const Offset(
                                                                            1,
                                                                            0),
                                                                    end: Offset
                                                                        .zero)
                                                                .chain(CurveTween(
                                                                    curve: Curves
                                                                        .ease))),
                                                            child: child,
                                                          );
                                                        }));
                                              },
                                              child: Text(
                                                "Forgot Password?",
                                                style: TextStyle(
                                                    color: textGrey,
                                                    fontSize: 14.sp,
                                                    decoration: TextDecoration
                                                        .underline),
                                              ),
                                            )),
                                        const SizedBox(height: 20),
                                        GestureDetector(
                                          onTap: () {
                                            _authenticateWithEmailAndPassword(
                                                context);
                                          },
                                          child: GradientButton("Login",
                                              isLoading: isLoading),
                                        )
                                      ],
                                    ))
                                  ],
                                ),
                                SizedBox(height: _keyboardVisible ? 0 : 15.sp),
                                !_keyboardVisible
                                    ? Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            "Privacy Policy",
                                            style: TextStyle(
                                                fontSize: 12.sp,
                                                color: textGrey,
                                                decoration:
                                                    TextDecoration.underline),
                                          ),
                                          SizedBox(
                                            width: 24.sp,
                                          ),
                                          Text(
                                            "Contact Us",
                                            style: TextStyle(
                                                fontSize: 12.sp,
                                                color: textGrey,
                                                decoration:
                                                    TextDecoration.underline),
                                          )
                                        ],
                                      )
                                    : const SizedBox.shrink(),
                                const SizedBox(height: 70),
                              ]))
                    ]);
                  }),
                ),
              );
            }

            return Container();
          },
        ),
      ),
    );
  }

  void _authenticateWithEmailAndPassword(context) {
    BlocProvider.of<AuthBloc>(context).add(
      SignInRequested(
        email: _emailController.text,
        password: _passwordController.text,
      ),
    );
  }
}
