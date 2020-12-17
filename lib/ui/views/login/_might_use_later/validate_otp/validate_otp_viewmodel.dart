import 'dart:async';

import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:printitflutterapp/app/authentication_service.dart';
import 'package:printitflutterapp/app/locator.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class ValidateOTPModel extends BaseViewModel {
  final AuthenticationService _authenticationService =
      locator<AuthenticationService>();
  final NavigationService _navigationService = locator<NavigationService>();
  final DialogService _dialogService = locator<DialogService>();

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final TextEditingController controller = TextEditingController();
  final StreamController streamController =
      StreamController<ErrorAnimationType>();

  String initialCountry = 'IN';
  // PhoneNumber number = PhoneNumber(isoCode: 'IN');
  String phoneNumber = "";
  bool hasError = false;
  String currentText;

  popBack() {
    _navigationService.back();
  }

  onChangedCurrentValue(String value) {
    print("Value ${value}");
    currentText = value;
    notifyListeners();
  }

  Future login() async {
    setBusy(true);
    print("Current Value ${currentText}");
    formKey.currentState.validate();
    if (currentText.length != 6) {
      streamController
          .add(ErrorAnimationType.shake); // Triggering error shake animation
      hasError = true;
      notifyListeners();
    } else {
      hasError = false;
      // _dialogService.showDialog();
      print("Error");
      notifyListeners();
    }
    print(error);
    setBusy(false);
    notifyListeners();
  }

  @override
  void dispose() {
    streamController.close();
  }
}
