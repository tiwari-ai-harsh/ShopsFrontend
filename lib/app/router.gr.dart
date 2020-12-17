// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs

import 'package:auto_route/auto_route.dart';

import '../ui/views/login/login_view.part.dart';
import '../ui/views/signup/signup_view.part.dart';
import '../ui/views/startup/profile_type_view.dart';

class Routes {
  static const String profileTypeView = '/';
  static const String loginView = '/login-view';
  static const String signUpView = '/sign-up-view';
  static const all = <String>{
    profileTypeView,
    loginView,
    signUpView,
  };
}

class AppRouter extends RouterBase {
  @override
  List<RouteDef> get routes => _routes;
  final _routes = <RouteDef>[
    RouteDef(Routes.profileTypeView, page: ProfileTypeView),
    RouteDef(Routes.loginView, page: LoginView),
    RouteDef(Routes.signUpView, page: SignUpView),
  ];
  @override
  Map<Type, AutoRouteFactory> get pagesMap => _pagesMap;
  final _pagesMap = <Type, AutoRouteFactory>{
    ProfileTypeView: (data) {
      return buildAdaptivePageRoute<bool>(
        builder: (context) => ProfileTypeView(),
        settings: data,
      );
    },
    LoginView: (data) {
      return buildAdaptivePageRoute<dynamic>(
        builder: (context) => LoginView(),
        settings: data,
      );
    },
    SignUpView: (data) {
      return buildAdaptivePageRoute<dynamic>(
        builder: (context) => SignUpView(),
        settings: data,
      );
    },
  };
}

/// ************************************************************************
/// Navigation helper methods extension
/// *************************************************************************

extension AppRouterExtendedNavigatorStateX on ExtendedNavigatorState {
  Future<bool> pushProfileTypeView() => push<bool>(Routes.profileTypeView);

  Future<dynamic> pushLoginView() => push<dynamic>(Routes.loginView);

  Future<dynamic> pushSignUpView() => push<dynamic>(Routes.signUpView);
}
