import 'package:injectable/injectable.dart';
import 'package:shop_frontend/app/authentication_service.dart';
import 'package:shop_frontend/app/node_backend_service.dart';
// import 'package:printitflutter/app/file_picker_services.dart';
// import 'package:printitflutter/app/firestore_services.dart';
// import 'package:printitflutter/app/geo_location_service.dart';
// import 'package:printitflutter/app/marker_service.dart';
// import 'package:printitflutter/app/shop_service.dart';
import 'package:stacked_services/stacked_services.dart';

// import 'package:printitflutter/app/payment_service.dart';

@module
abstract class ThirdPartyServicesModule {
  @lazySingleton
  AuthenticationService get authenticationService;

  @lazySingleton
  NavigationService get navigationServices;

  @lazySingleton
  DialogService get dialogService;

  @lazySingleton
  NodeBackendService get nodeBackendService;

  // @lazySingleton
  // FirestoreService get fireStoreService;

  // @lazySingleton
  // GeoLocationService get geoLocationService;

  // @lazySingleton
  // ShopService get shopServices;

  // @lazySingleton
  // FilePickerServices get filePickerServices;

  // @lazySingleton
  // PaymentService get paymentService;

  // @lazySingleton
  // SnackbarService get snackbarService;

  // @lazySingleton
  // MarkerService get markerService;
}
