import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:shop_frontend/app/locator.dart';
// import 'package:printitflutterapp/app/route_gaurd.dart';
import 'package:shop_frontend/app/router.gr.dart';
import 'package:stacked_services/stacked_services.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp();
  setupLocator();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // locator<NavigationService>()
    print(
        "***************************************************************************************");
    print(locator<NavigationService>().navigatorKey);
    print(
        "***************************************************************************************");
    // SystemChrome.setPreferredOrientations([
    //   DeviceOrientation.portraitUp,
    //   DeviceOrientation.portraitDown,
    // ]);
    return MaterialApp(
      // home: ProfileTypeView(),
      builder: ExtendedNavigator.builder(
          router: AppRouter(),
          // guards: [AuthGuard()],
          initialRoute: Routes.profileTypeView, // TODO: Change it to mapsView
          navigatorKey: locator<NavigationService>().navigatorKey,
          builder: (ctx, extendedNav) {
            print(extendedNav);
            return Theme(
              data: ThemeData.dark(),
              child: extendedNav,
            );
          }),
    );
  }
}
