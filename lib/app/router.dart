import 'package:auto_route/auto_route_annotations.dart';
import 'package:shop_frontend/ui/views/login/login_view.part.dart';
import 'package:shop_frontend/ui/views/signup/signup_view.part.dart';
// import 'package:printitflutterapp/ui/views/login/phone_number/phone_number_view.dart';
// import 'package:printitflutterapp/ui/views/login/validate_otp/validate_otp_view.dart';
// import 'package:printitflutterapp/ui/views/sign_up/sign_up_view.dart';
import 'package:shop_frontend/ui/views/startup/profile_type_view.dart';
// import 'package:printitflutter/app/route_guards.dart';
// import 'package:printitflutter/ui/views/add_documents/add_documents.dart';
// import 'package:printitflutter/ui/views/add_files/add_files_view.dart';
// import 'package:printitflutter/ui/views/add_shops/add_shop_view.dart';
// import 'package:printitflutter/ui/views/load_maps_splash_screen.dart/load_maps_splash_screenView.dart';
// import 'package:printitflutter/ui/views/login/login_view.part.dart';
// import 'package:printitflutter/ui/views/maps/maps_view.dart';
// import 'package:printitflutter/ui/views/settings/settings_view.dart';
// import 'package:printitflutter/ui/views/shop_details/shop_details_view.dart';
// import 'package:printitflutter/ui/views/sign_up/sign_up_view.part.dart';
// import 'package:printitflutter/ui/views/startup/profile_type_view.dart';

@MaterialAutoRouter(
    generateNavigationHelperExtension: true,
    routes: <AutoRoute>[
      //   AdaptiveRoute(page: MapsView, guards: [AuthGuard]),
      AdaptiveRoute<bool>(page: ProfileTypeView, initial: true),
      AdaptiveRoute(page: LoginView),
      AdaptiveRoute(page: SignUpView),
      // AdaptiveRoute(page: ValidateOTPView),
      // AdaptiveRoute(page: SignUpView),
      //   AdaptiveRoute(page: SettingsView),
      //   AdaptiveRoute(page: AddShopView),
      //   AdaptiveRoute(page: ShopDetails),
      //   AdaptiveRoute(page: AddDocumentsView),
      //   AdaptiveRoute(page: AddFilesView),
      //   AdaptiveRoute(page: LoadMapsSplashScreenView, initial: true),
    ])
class $AppRouter {}
