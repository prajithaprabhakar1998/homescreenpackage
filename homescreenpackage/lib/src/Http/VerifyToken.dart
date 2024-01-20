import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';


import '../Utils/AppConstant.dart';
import '../Utils/ShdfClass.dart';
import '../Utils/Widget/OKDialog .dart';
import 'Request.dart';
import 'Url.dart';

Future<String> verifyToken(BuildContext context, String strtoken) async {
  // var Token = "".obs;
  print("strtoken");
  print("strtoken");
  print(strtoken);
  try {
    String? Login_UserNameTxt =
        await SHDF.readSharedPrefString(AppConstants.Login_UserName, "")!;
    String? LoginPasswordTxt =
        await SHDF.readSharedPrefString(AppConstants.Login_Pasword, "")!;
    String? validTokenGen =
        await SHDF.readSharedPrefString(SHDF.loginTokenKey, "")!;
    // Set base URL
    String baseUrl = await SHDF.urlBase;
    baseUrl = baseUrl;

    // Set token value
    // Token.value = loginController.loginResponseModel.token.toString();
    // Token.value = validTokenGen.toString();
    // print("Token==Token: ${Token.value}");

    print("baseUrl verifyToken1: $baseUrl");
    //print("verifyToken verifyToken2: ${Urls.baseUrl}");
   // print("verifyToken verifyToken3: ${Token.value}");

    // Verify token
    final verifyTokenResponse = await Request().verifyToken(
      token: strtoken.toString(),
      context: context,
      url: Urls.urlBase+Urls.CheckTokenValid,
    );
    String validTokenvalue =
        verifyTokenResponse!.substring(1, (verifyTokenResponse.length - 1));
    print("change_Email Token value =========== " + validTokenvalue);
    print(validTokenvalue); // Output: "True"
    if (validTokenvalue != null) {
      // Check if the token is valid
      if (validTokenvalue == "True") {
        return "True";
      } else {
      //  await CheckLoginCommon(Login_UserNameTxt, LoginPasswordTxt);
        return "False";
      }
    } else {
      showDialog(
          context: Get.context!,
          builder: (BuildContext context1) => OKDialog(
                title: "Failed",
                descriptions: "Authorisation has been denied".toString(),
                img: Image.asset("assets/images/warning.png"),
                text: '',
                key: null,
              ));

      return "False";
    }
  } catch (e) {
    showDialog(
        context: Get.context!,
        builder: (BuildContext context1) => OKDialog(
              title: "Failed",
              descriptions: e.toString(),
              img: Image.asset("assets/images/warning.png"),
              text: '',
              key: null,
            ));

    return "false";
  }
}

// CheckLoginCommon(String? userIdLoginText, String? passwordLoginText) async {
//   List regRequestList = [];
//   RxString accountNameValue = "".obs;
//   RxString userId_LoginText = "".obs;
//   RxString password_LoginText = "".obs;
// //  RegisterDomainRequest regRequestModel = RegisterDomainRequest();
//   List<CheckLoginResponse> loginResponseList = [];
//
//   String urlBase = await SHDF.urlBase;
//   bool selectionMatchToDropdown = false;
//   for (var i in regRequestList) {
//     if (accountNameValue.value == i.accountName) {
//       //  regRequestModel = i;
//       selectionMatchToDropdown = true;
//     }
//   }
//
//   try {
//     final CheckLoginRequest requestMap = CheckLoginRequest(
//         password: passwordLoginText,
//         apiBaseUri: urlBase,
//         userId: userIdLoginText,
//         latitude: "",
//         iMEICode: "",
//         longitude: "",
//         macId: "");
//     if (selectionMatchToDropdown == true) {
//       /*final baseUrl = await SHDF.getConnAPI();*/
//       final response = await Request().requestPost(
//           url: Urls.CheckLogin,
//           parameters: json.encode(requestMap),
//           context: Get.context);
//       CheckLoginResponse responseModel = CheckLoginResponse.fromJson(response!);
//       String? errorStat = responseModel.eRRSTAT;
//       if (errorStat == "True") {
//         /// Request Save To Sqlite
//         // await DBHelper().insert(requestMap.toJson(), DBHelper.loginRequestList);
//
//         /// Response Saving to Shared Preferences
//         loginResponseList.add(CheckLoginResponse(
//           eRRSTAT: responseModel.eRRSTAT,
//           eRRMSG: responseModel.eRRMSG,
//           userId: responseModel.userId,
//           userName: responseModel.userName,
//           allowTrack: responseModel.allowTrack,
//           trackId: responseModel.trackId,
//           trackIdENC: responseModel.trackIdENC,
//           jBMMOBTrackReq: responseModel.jBMMOBTrackReq,
//           userSpStat: responseModel.userSpStat,
//           defaultAeId: responseModel.defaultAeId,
//           defaultCompId: responseModel.defaultCompId,
//           defaultCompName: responseModel.defaultCompName,
//           defaultAeName: responseModel.defaultAeId,
//           token: responseModel.token,
//           apiBaseUri: responseModel.apiBaseUri,
//           finId: responseModel.finId,
//           eRRRES: responseModel.eRRRES,
//         ));
//         userId_LoginText.value = userIdLoginText!;
//         password_LoginText.value = passwordLoginText!;
//
//         await SHDF.saveSharedPrefValueString(AppConstants.Login_UserName,
//             userIdLoginText)!; // here u r saving data not retriving from shared preference
//         await SHDF.saveSharedPrefValueString(
//             AppConstants.Login_Pasword, passwordLoginText)!;
//
//         String? Login_UserNameTxt =
//             await SHDF.readSharedPrefString(AppConstants.Login_UserName, "")!;
//         String? LoginPasswordTxt =
//             await SHDF.readSharedPrefString(AppConstants.Login_Pasword, "")!;
//         //now try
//         print("CheckLoginData" +
//             Login_UserNameTxt.toString() +
//             LoginPasswordTxt.toString());
//         final jsonResponseList =
//             loginResponseList.map((e) => e.toJson()).toList();
//         await SHDF.saveSharedPrefValueString(
//             SHDF.loginResponseList, jsonEncode(jsonResponseList));
//         await SHDF.saveSharedPrefValueString(
//             SHDF.loginTokenKey, response['Token']);
//       } else {
//         showDialogue();
//       }
//     }
//   } on Exception catch (e) {
//     log(e.toString());
//   }
// }

showDialogue() {
  Get.dialog(OKDialog(
      key: null,
      title: "Warning",
      descriptions: "descriptions",
      text: "text",
      img: Image.asset("assets/images/warning.png")));
}
