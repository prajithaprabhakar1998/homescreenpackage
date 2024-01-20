import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';



/// ////////////////////////////////////////////////////
/// Shared Preferences
///

class SHDF {
  static const String registrationResponseList = "registrationResponseList";
  static const String loginResponseList = "loginResponseList";

  static Future<String?> readSharedPrefString(
      String name, String defaultValue) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();

    return await preferences.getString(name);
  }

  static saveSharedPrefValueString(String name, String value) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();

    await preferences.setString(name, value);
  }

  static Future readShdfBoolean(String name, String defaultValue) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();

    return await preferences.getBool(name);
  }

  static saveSharedPrefValueBoolean(String name, bool value) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();

    await preferences.setBool(name, value);
  }

  static Future readShdfInt(String name, int defaultValue) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();

    return await preferences.getInt(name);
  }

  static saveSharedPrefValueInt(String name, int value) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();

    await preferences.setInt(name, value);
  }

  static clearall() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();

    await preferences.clear();
  }

  static const regTokenKey = "registerTokenKey";
  static const loginTokenKey = "loginTokenKey";
  static const connectionApi = "connectionApi";

  static Future<String?> getRegToken() async {
    try {
      final pref = await SharedPreferences.getInstance();
      final tokenKey = pref.getString(regTokenKey);
      if (tokenKey != null) {
        return tokenKey;
      } else {
        log("Token is null");
      }
      return tokenKey;
    } on Exception catch (e) {
      return "";
    }
  }

  static Future<String?> getLoginToken() async {
    try {
      final pref = await SharedPreferences.getInstance();
      final tokenKey = pref.getString(loginTokenKey);
      if (tokenKey != null) {
        return tokenKey;
      } else {
        log("Token is null");
      }
      return tokenKey;
    } on Exception catch (e) {
      return e.toString();
    }
  }

  static Future<String?> getConnAPI() async {
    try {
      final pref = await SharedPreferences.getInstance();
      final conApi = pref.getString(connectionApi);
      if (conApi != null) {
        return conApi;
      } else {
        log("API is null");
      }
      return conApi;
    } on Exception catch (e) {
      return e.toString();
    }
  }

  static Future<String> get urlBase async {
    final connApi = await SHDF.getConnAPI();
    if (connApi != "".trim()) {
      return connApi.toString();
    } else {
      // showDialog(
      //     context: Get.context!,
      //     builder: (builder) =>
      //         CustomDialog(
      //       my_context: Get.context!,
      //       title: "Warning",
      //       description: "Need to register again",
      //       img: Image.asset(
      //         "assets/images/warning.png",
      //         height: 70.0,
      //         width: 70.0,
      //       ),
      //       buttonText: "Register",
      //       okBtnFunction: () {
      //         Navigator.pushNamedAndRemoveUntil(
      //             Get.context!, '/Register', (route) => false);
      //       },
      //     )
      // );
      log("Base url is empty");
      return "";
    }
  }

  static Future<SharedPreferences> get prefs => SharedPreferences.getInstance();
}