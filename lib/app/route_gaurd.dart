import 'package:auto_route/auto_route.dart';
import 'package:shop_frontend/app/authentication_service.dart';
import 'package:shop_frontend/app/locator.dart';

import 'router.gr.dart';

// guard
class AuthGuard extends RouteGuard {
  final AuthenticationService _authenticationService =
      locator<AuthenticationService>();

  @override
  Future<bool> canNavigate(
    ExtendedNavigatorState navigator,
    String routeName,
    Object arguments,
  ) async {
    // TODO:: Add firebase authentication here.
    var hasLoggedInUser = await _authenticationService.isUserLoggedIn();
    if (hasLoggedInUser)
      return true;
    else
      return navigator.root.push(Routes.profileTypeView);
  }
}
