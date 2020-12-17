import 'package:shop_frontend/app/locator.dart';
import 'package:shop_frontend/app/router.gr.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class ProfileViewModel extends BaseViewModel {
  final NavigationService _navigationService = locator<NavigationService>();

  Future navigateToLogin() async {
    //TODO uncomment this.
    await _navigationService.navigateTo(Routes.loginView);
  }
}
