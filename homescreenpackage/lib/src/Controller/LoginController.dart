


import 'dart:convert';
import 'dart:developer';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../Http/Request.dart';
import '../Http/Url.dart';
import '../RequestResponse/CheckLoginRequest.dart';
import '../RequestResponse/CheckLoginResponse.dart';
import '../Ui/HomePage.dart';
import '../Utils/Widget/OKDialog .dart';



class LoginController extends GetxController {
  TextEditingController txtEmail = TextEditingController();
  TextEditingController txtPassword = TextEditingController();

  RxBool showpass = true.obs;
  var token = "".obs;
  var userId = ''.obs;
  var userName = ''.obs;

  _tokenValidation(BuildContext context, String strtoken) async {
    final results_CheckTokenValid = await Request().verifyToken(
        token: strtoken,
        url: Urls.urlBase + Urls.CheckLogin,
        parameters: null,
        context: context);

    if (results_CheckTokenValid != null) {
      try {
        String validTokenvalue = results_CheckTokenValid.substring(
            1, (results_CheckTokenValid.length - 1));
        print("change_Email Token value =========== " + validTokenvalue);
        if (validTokenvalue == "True") {
          return validTokenvalue;
        } else {
          CheckLoginRequest requestModel = new CheckLoginRequest(
              apiBaseUri: "https://dev.jbmcloud.com/BO_FT_API/",
              userId: txtEmail.text,
              password: txtPassword.text);
          final results1 = await new Request().requestPost_GetonlyToken(
              url: Urls.urlBase + Urls.CheckLogin,
              parameters: json.encode(requestModel),
              context: Get.context!);

          if (results1 != null) {
            try {
              print("token in controller " + results1.toString());
              token.value = results1.toString();
              print("token.value");
              print(token.value);
              String b = token.value;
              String finalToken = b.substring(1, (b.length - 1));
              print("finalToken " + finalToken.toString());

              return "True";
            } catch (e) {
              showDialog(
                  context: Get.context!,
                  builder: (BuildContext context1) => OKDialog(
                    title: "Failed",
                    descriptions: "Something went wrong " + e.toString(),
                    img: Image.asset("assets/images/warning.png"),
                    text: '',
                    key: null,
                  ));
            }
          }
        }
      } catch (e) {
        log("login_Token Error " + e.toString());
      }
    }
  }

  checkvalidlogin(BuildContext context) {
    if (txtEmail.value.text.length == 0 || txtPassword.value.text.length == 0) {
      Get.defaultDialog(
          title: "Warning",
          middleText: "Enter valid details",
          actions: [
            MaterialButton(
              color: Colors.blue,
              onPressed: () {
                Get.back();
              },
              child: Text("ok"),
            )
          ]);
    }



    else {
      loginRequestCall(context);
    }
  }

  loginRequestCall(BuildContext context) async {

    if (await _tokenValidation(context, token.value.toString()) == "True") {
      try {
        CheckLoginRequest requestModel = new CheckLoginRequest(
            password: txtPassword.text.toString().trim(),
            apiBaseUri: "https://dev.jbmcloud.com/BO_FT_API/",
            userId: txtEmail.text.toString().trim(),
            latitude: "",
            iMEICode: "",
            longitude: "",
            macId: "");

        final results = await new Request().requestPostWithToken(
            token: token.value,
            url: Urls.urlBase + Urls.CheckLogin,
            parameters: json.encode(requestModel),
            context: Get.context);
        log("requestPost result " + results.toString());

        if (results != null) {
          try {
            CheckLoginResponse responseModel =
            CheckLoginResponse.fromJson(results);
            log("SigninResponse result " + results.toString());

            if (responseModel.eRRSTAT == 'True') {
              token.value = responseModel.token.toString();

              print("token.value====${token.value}");
              print("response.model====${responseModel.token}");

              userId.value = responseModel.userId.toString();
              userName.value = responseModel.userName.toString();


              Navigator.of(Get.context!).pushAndRemoveUntil(
                  MaterialPageRoute(
                    builder: (context) =>  HomePage1(),
                  ),
                      (route) => false);
              txtEmail.clear();
              txtPassword.clear();

            } else {
              if (responseModel.eRRMSG!.toString() == "Wrong Password.") {
                showDialog(
                    context: Get.context!,
                    builder: (BuildContext context1) => OKDialog(
                      title: "Failed",
                      descriptions:
                      "Please enter correct email address and password",
                      img: Image.asset("assets/images/warning.png"),
                      text: '',
                      key: null,
                    ));
              } else if (responseModel.eRRMSG!.toString() ==
                  "User ID not exists." ||
                  responseModel.eRRMSG!.toString() == "User not exists.") {
                showDialog(
                    context: Get.context!,
                    builder: (BuildContext context1) => OKDialog(
                      title: "Failed",
                      descriptions: "Member details not found",
                      img: Image.asset("assets/images/warning.png"),
                      text: '',
                      key: null,
                    ));
              } else {
                showDialog(
                    context: Get.context!,
                    builder: (BuildContext context1) => OKDialog(
                      title: "Failed",
                      descriptions: responseModel.eRRMSG!.toString(),
                      img: Image.asset("assets/images/warning.png"),
                      text: '',
                      key: null,
                    ));
              }
            }
          } catch (e) {
            showDialog(
                context: Get.context!,
                builder: (BuildContext context1) => OKDialog(
                  title: "Failed",
                  descriptions: "Something went wrong " + e.toString(),
                  img: Image.asset("assets/images/warning.png"),
                  text: '',
                  key: null,
                ));
          }
        } else {
          showDialog(
              context: Get.context!,
              builder: (BuildContext context1) => OKDialog(
                title: "Failed",
                descriptions:
                "Something went wrong please try after some time",
                img: Image.asset("assets/images/warning.png"),
                text: '',
                key: null,
              ));
        }
      } catch (e) {}
    } else {
      showDialog(
          context: Get.context!,
          builder: (BuildContext context1) => OKDialog(
            title: "Failed",
            descriptions: "invalid Token please try after some time",
            text: '',
            key: null,
          ));
    }
  }
}