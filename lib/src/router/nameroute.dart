import 'package:go_router/go_router.dart';
import 'package:movie_app/src/constants/auth_costants.dart';
import 'package:movie_app/src/views/screens/createnewpasswordscreen.dart';
import 'package:movie_app/src/views/screens/forgotpasswordscreen.dart';
import 'package:movie_app/src/views/screens/homescreen.dart';
import 'package:movie_app/src/views/screens/loginscreen.dart';
import 'package:movie_app/src/views/screens/otpverificationscreen.dart';
import 'package:movie_app/src/views/screens/registerscreen.dart';
import 'package:movie_app/src/views/screens/successpasswordchangescreen.dart';

class NameRoute {
  static final String homeScreen = "/";
  static final String loginScreen = '/login';
  static final String registerScreen = '/register';
  static final String createPasswordScreen = '/create-password';
  static final String forgotPasswordScreen = '/forgot-password';
  static final String successPasswordChangeScreen = '/success-password-change';
  static final String oTPVerificationScreen = '/otp-verification';

  static final GoRouter router = GoRouter(
    initialLocation: NameRoute.successPasswordChangeScreen,
    routes: [
      GoRoute(
        path: homeScreen,
        builder: (context, state) => HomeScreen(),
      ),
      GoRoute(
        path: NameRoute.loginScreen,
        builder: (context, state) => LoginScreen(),
      ),
      GoRoute(
        path: NameRoute.registerScreen,
        builder: (context, state) => RegisterScreen(),
      ),
      GoRoute(
        path: NameRoute.oTPVerificationScreen,
        builder: (context, state) => OTPVerificationScreen(),
      ),
      GoRoute(
        path: NameRoute.forgotPasswordScreen,
        builder: (context, state) => ForgotPasswordScreen(),
      ),
      GoRoute(
        path: NameRoute.successPasswordChangeScreen,
        builder: (context, state) => SuccessPasswordChangeScreen(headerText: AuthConstants.headerTextSuccessPasswordChange, detailText: AuthConstants.detailTextSuccessPasswordChange,),
      ),
      GoRoute(
        path: NameRoute.createPasswordScreen,
        builder: (context, state) => CreateNewPasswordScreen(),
      ),
    ],
  );
}
