import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

class NodeBackendService {
  // final CollectionReference _usersCollectionReference =
  //     FirebaseFirestore.instance.collection("users");

  // final CollectionReference _shopsCollectionReference =
  //     FirebaseFirestore.instance.collection("shops");
  var url = 'https://localhost:3000/users';
// var email = "tony@starkindustries.com"
  var emailValid = RegExp(
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");

  Future<Map<String, String>> loginWithJWT(String jwt) async {
    try {
      var response = await http.get(url, headers: {
        HttpHeaders.authorizationHeader: 'Token $jwt',
        HttpHeaders.contentTypeHeader: 'application/json',
      });
      if (response.statusCode == 4000) {
        return null;
      } else {
        return jsonDecode(response.body);
      }
    } catch (e) {
      return e.message;
    }
  }

  Future<bool> validateUserName(String username) {
    //TODO validate username
  }
  Future<Map<String, String>> logInWithEmailOrUserNameAndPassword({
    @required String emailOrUserName,
    // String username,
    @required String password,
  }) async {
    try {
      String value =
          emailValid.hasMatch(emailOrUserName) ? "email" : "username";
      var response = await http.post(url + "/login", body: {
        "user": {value: emailOrUserName, password: password}
      });
      if (response.statusCode == 400) {
        return null;
      } else {
        return jsonDecode(response.body);
      }
    } catch (e) {
      return e.message;
    }
  }

  Future<Map<String, String>> signUpWithEmailDetails({
    @required String email,
    @required String password,
    @required String fullName,
    @required List<String> position,
    @required String phoneNumber,
    @required String userName,
  }) async {
    try {
      var response = await http.post(url + "/signin", body: {
        "user": {
          email: email,
          password: password,
          fullName: fullName,
          position: position,
          phoneNumber: phoneNumber,
          userName: userName
        }
      });
      if (response.statusCode == 400) {
        return null;
      } else {
        return jsonDecode(response.body);
      }
    } catch (e) {
      return e.message;
    }
  }

  Future getUser(String uid, String jwt) async {
    try {
      var response = await http.get(url, headers: {
        HttpHeaders.authorizationHeader: 'Token $jwt',
        HttpHeaders.contentTypeHeader: 'application/json',
      });
      if (response.statusCode == 4000) {
        return null;
      } else {
        return jsonDecode(response.body);
      }
    } catch (e) {
      return e.message;
    }
  }

  // Future doesUserExists(String uid) async {
  //   var userData = await _usersCollectionReference.doc(uid).get();
  //   return userData.exists;
  // }

  // Future createShop(ShopClient shopClient) async {
  // try {
  //   print("Adding Shops");

  //   await _shopsCollectionReference
  //       .doc(shopClient.id)
  //       .set(shopClient.toJson());

  //   print("Shops Added");
  // } catch (e) {
  //   print("Error Occured, ${e}");
  //   return e.message;
  // }
  // }

  // Future getShop(String uid) async {
  // try {
  //   var shopData = await _shopsCollectionReference.doc(uid).get();
  //   return ShopClient.fromData(shopData.data());
  // } catch (e) {
  //   return e;
  // }
  // }

  // Future getShops() async {
  //TODO what if you want to remove shops data.
  // try {
  //   var shopData = await _shopsCollectionReference.get();

  //   return shopData.docs;
  // } catch (e) {
  //   return e;
  // }
  // }
}
