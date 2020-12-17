import 'package:flutter/foundation.dart';
import 'package:flutter_facebook_login/flutter_facebook_login.dart';
// import 'package:http/http.dart' as http;
// import 'package:json_annotation/json_annotation.dart';
// import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:geolocator/geolocator.dart';
// import 'package:uuid/uuid.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shop_frontend/app/locator.dart';
import 'package:shop_frontend/app/node_backend_service.dart';
import 'package:shop_frontend/models/userClient.dart';

class AuthenticationService {
  final GoogleSignIn _googleSignIn = GoogleSignIn(scopes: [
    'email',
  ]);
  final FacebookLogin _facebookLogin = FacebookLogin();
  final NodeBackendService nodeBackendService = locator<NodeBackendService>();

  UserClient _currentUser;
  UserClient get currentUser => _currentUser;
  final storage = FlutterSecureStorage();

  Future<bool> isUserLoggedIn() async {
    if (_currentUser == null) {
      var jwt = await storage.read(key: "jwt");
      if (jwt == null) return false;

      var user = await nodeBackendService.loginWithJWT(jwt);
      if (user != null) {
        _populateCurrentUser(user);
        return true;
      }
      return false;
    }
    // await _populateCurrentUser(user);
    return true;
  }

  Future _populateCurrentUser(Map<String, String> userJson) {
    var tempCurrent = _currentUser;
    try {
      _currentUser = UserClient.fromData(userJson);
    } catch (e) {
      print(e);
      _currentUser = tempCurrent;
    }
  }

  Future signOut() async {
    storage.delete(key: "jwt");
  }

  Future<UserClient> loginWithEmailOrUserName({
    @required String emailOrUserName,
    @required String password,
  }) async {
    try {
      var authResult =
          await nodeBackendService.logInWithEmailOrUserNameAndPassword(
        emailOrUserName: emailOrUserName,
        password: password,
      );
      _populateCurrentUser(authResult);
      return authResult != null ? currentUser : null;
    } catch (e) {
      return e.message;
    }
  }

  Future signUpWithEmailDetails({
    @required String email,
    @required String password,
    @required String fullName,
    @required Position position,
    @required String phoneNumber,
    @required String userName,
  }) async {
    try {
      var authResult = await nodeBackendService.signUpWithEmailDetails(
          email: email,
          password: password,
          fullName: fullName,
          position: [
            position.latitude.toString(),
            position.longitude.toString()
          ],
          phoneNumber: phoneNumber,
          userName: userName);

      _populateCurrentUser(authResult);
      return authResult != null ? currentUser : null;
    } catch (e) {
      return e.message;
    }
  }

  // Future facebookSignInorLogin() async {
  //   try {
  //     var facebookResult =
  //         await _facebookLogin.logIn(['email', 'public_profile']);
  //     print(facebookResult.accessToken.token);
  //     if (facebookResult.status == FacebookLoginStatus.loggedIn) {
  //       if (await _firestoreService
  //           .doesUserExists(facebookResult.accessToken.userId)) {
  //         _currentUser = await _firestoreService
  //             .getUser(facebookResult.accessToken.userId);
  //       } else {
  //         final graphResponse = await http.get(
  //             'https://graph.facebook.com/v2.12/me?fields=name,first_name,last_name,email&access_token=${facebookResult.accessToken.token}');
  //         final profile = jsonDecode(graphResponse.body);
  //         _currentUser = UserClient(
  //           id: facebookResult.accessToken.userId,
  //           email: profile["email"],
  //           fullName: profile["name"],
  //         );

  //         await _firestoreService.createUser(_currentUser);
  //         print("Creating User");
  //       }
  //     }
  //     return true;
  //   } catch (e) {
  //     print(e);
  //     return false;
  //   }
  // }

  Future facebookSignInorLogin() async {
    //TODO Add Facebook Signing .
    // try {
    //   final result = await FacebookAuth.instance.login();
    //   final OAuthCredential authCredential =
    //       FacebookAuthProvider.credential(result.accessToken.token);

    //   final User user =
    //       (await _firebaseAuth.signInWithCredential(authCredential)).user;

    //   _currentUser = UserClient(
    //       id: user.uid, email: user.email, fullName: user.displayName);

    //   if (!await _firestoreService.doesUserExists(_currentUser.id)) {
    //     await _firestoreService.createUser(_currentUser);
    //     print("Creating User");
    //   } else {
    //     print("*************************************************");
    //     print("User already created");
    //   }
    //   return true;
    // } catch (e) {
    //   print(e);
    //   return false;
    // }
  }

  Future googleSignInorLogin() async {
    //TODO Add google Signin.

    // try {
    //   var googleResult = await _googleSignIn.signIn();
    //   _currentUser = UserClient(
    //     id: googleResult.id,
    //     email: googleResult.email,
    //     fullName: googleResult.displayName,
    //   );

    //   if (!await _firestoreService.doesUserExists(_currentUser.id)) {
    //     await _firestoreService.createUser(_currentUser);
    //     print("Creating User");
    //   } else {
    //     print("*************************************************");
    //     print("User already created");
    //   }

    //   return true;
    // } catch (e) {
    //   print(e);
    //   return false;
    // }
  }

  Future addShopsEmailDetails({
    @required String email,
    @required String password,
    @required String fullName,
    @required Position position,
  }) async {
    //TODO Add shop Email Details
    // try {
    //   ShopClient shopClient = ShopClient(
    //       id: uuid.v4(), shopName: fullName, email: email, position: position);

    //   await _firestoreService.createShop(shopClient);
    //   return shopClient != null;
    // } catch (e) {
    //   return e.message;
    // }
  }
}
