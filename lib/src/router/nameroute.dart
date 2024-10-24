import 'package:go_router/go_router.dart';
import 'package:movie_app/src/views/screens/forgotpasswordscreen.dart';
import 'package:movie_app/src/views/screens/homescreen.dart';
import 'package:movie_app/src/views/screens/loginscreen.dart';
import 'package:movie_app/src/views/screens/otpverificationscreen.dart';
import 'package:movie_app/src/views/screens/registerscreen.dart';
import 'package:movie_app/src/views/screens/successpasswordchangescreen.dart';

class NameRoute {
  static final GoRouter router = GoRouter(
    initialLocation: '/otp-verification',
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => HomeScreen(),
      ),
      GoRoute(
        path: '/login',
        builder: (context, state) => LoginScreen(),
      ),
      GoRoute(
        path: '/register',
        builder: (context, state) => RegisterScreen(),
      ),
      GoRoute(
        path: '/forgot-password',
        builder: (context, state) => ForgotPasswordScreen(),
      ),
      GoRoute(
        path: '/success-password-change',
        builder: (context, state) => SuccessPasswordChangeScreen(),
      ),
      GoRoute(
        path: '/otp-verification',
        builder: (context, state) => OTPVerificationScreen(),
      ),
    ],
  );
}
