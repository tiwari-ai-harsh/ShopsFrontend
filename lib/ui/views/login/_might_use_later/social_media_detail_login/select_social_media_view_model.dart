import 'package:flutter/material.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:printitflutterapp/app/authentication_service.dart';
import 'package:printitflutterapp/app/locator.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class SocialMediaDetailModel extends BaseViewModel {
  final AuthenticationService _authenticationService =
      locator<AuthenticationService>();
  final NavigationService _navigationService = locator<NavigationService>();
  final DialogService _dialogService = locator<DialogService>();

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final TextEditingController controller = TextEditingController();
  String initialCountry = 'IN';
  PhoneNumber number = PhoneNumber(isoCode: 'IN');

  popBack() {
    _navigationService.back();
  }

  Future facebookLogin() async {
    setBusy(true);
    print(error);
    setBusy(false);
    notifyListeners();
  }

  Future googleLogin() async {
    setBusy(true);
    print(error);
    setBusy(false);
    notifyListeners();
  }

  Future login() async {
    setBusy(true);
    print(error);
    setBusy(false);
    notifyListeners();
  }
}
