import 'package:go_router/go_router.dart';
import 'package:paymentapp/view/dashboard.dart';
import 'package:paymentapp/view/login_screen.dart';
import 'package:paymentapp/view/splash_screen.dart';

class RouteManager {
  static final RouteManager _route = RouteManager._instance();

  factory RouteManager() {
    return _route;
  }

  RouteManager._instance();

  final routeManager = GoRouter(initialLocation: "/dashboard", routes: [
    GoRoute(
        path: "/",
        name: "splash",
        builder: (context, state) => const SplashScreen()),
    GoRoute(
        path: "/login",
        name: "login",
        builder: (context, state) => const LoginScreen()),
    GoRoute(
        path: "/dashboard",
        name: "dashboard",
        builder: (context, state) => const Dashboard()),
  ]);
}
