import 'package:flutter/material.dart';
import 'package:shop_frontend/app/authentication_service.dart';
import 'package:shop_frontend/app/locator.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class SignUpViewModel extends BaseViewModel {
  final AuthenticationService _authenticationService =
      locator<AuthenticationService>();
  final NavigationService _navigationService = locator<NavigationService>();
  final DialogService _dialogService = locator<DialogService>();
  String _email;
  String get email => _email;

  String _password;
  String get password => _password;

  bool _passwordVisible = true;
  bool get passwordVisible => _passwordVisible;

  void toggleVisible() {
    print("Toggle, ${_passwordVisible}");
    _passwordVisible = !_passwordVisible;

    notifyListeners();
  }

  void updateEmailForm(String value) {
    _email = value;
    notifyListeners();
  }

  void updatePasswordForm(String value) {
    _password = value;
    notifyListeners();
  }

  popBack() {
    _navigationService.back();
  }

  Future navigateToSignUp() async {
    // await _navigationService.navigateTo(Routes.signUpView);
  }

  Future login({@required String email, @required String password}) async {
    setBusy(true);

    // var result = await _authenticationService.loginWithEmail(
    //     email: email, password: password);

    // setBusy(false);
    // if (result is bool) {
    //   if (result) {
    //     _navigationService.navigateTo(Routes.mapsView);
    //   } else {
    //     await _dialogService.showDialog(
    //       title: 'Login Up Failure',
    //       description: 'General login up failure. Please try again later',
    //     );
    //   }
    // } else {
    //   await _dialogService.showDialog(
    //     title: 'Login Up Failure',
    //     description: result,
    //   );
    // }
  }

  Future loginFacebook() async {
    setBusy(true);

    var result = await _authenticationService.facebookSignInorLogin();

    setBusy(false);
    if (result is bool) {
      if (result) {
        // _navigationService.navigateTo(Routes.mapsView);
      } else {
        await _dialogService.showDialog(
          title: 'Log in Failure',
          description: 'General log in failure. Please try again later',
        );
      }
    } else {
      await _dialogService.showDialog(
        title: 'Log in Failure',
        description: result,
      );
    }
  }

  Future loginGoogle() async {
    setBusy(true);

    var result = await _authenticationService.googleSignInorLogin();

    setBusy(false);
    if (result is bool) {
      if (result) {
        // _navigationService.navigateTo(Routes.mapsView);
      } else {
        await _dialogService.showDialog(
          title: 'Log in Failure',
          description: 'General log in failure. Please try again later',
        );
      }
    } else {
      await _dialogService.showDialog(
        title: 'Log in Failure',
        description: result,
      );
    }
  }
}
