import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/cupertino.dart';
import 'package:simple_fontellico_progress_dialog/simple_fontico_loading.dart';

import '../Utils/MyUtilClass.dart';

class Request {
  bool progressDialog = false;


  Future<Map?> requestPost({String? url, String? parameters, context}) async {
    try {
      SimpleFontelicoProgressDialog? _progressDialog =
      SimpleFontelicoProgressDialog(
          context: context, barrierDimisable: false);
      if (progressDialog == false) {
        progressDialog = true;


        _progressDialog.show(
          message: "Please wait...",
        );
      }
      log('requestPosturl==' + url.toString());
      log('requestPostparameters==' + parameters.toString());
      debugPrint(parameters, wrapWidth: 1024);

      bool flagNet = await new MyUtilClass().isInternetAvailable();
      if (flagNet) {
        Uri uri = Uri.parse(url!);

        final results = await http.post(uri,
            body: parameters,
            headers: {'access-token': '920c685555dc31df2eb452f0856a756e',
              'Content-Type': 'application/json',
              'Cookie': 'advanced-api=06f50008fa4108ff45f6745f2d841126'});
        log("Resultss " + results.toString());

        if (results.statusCode == 200) {
          final jsonObject = json.decode(results.body);
          log('requestPost_jsonObject==' + jsonObject.toString());
          // _progressDialog.dismissProgressDialog(context);
          _progressDialog.hide();
          progressDialog = false;
          return jsonObject;
        } else {

          _progressDialog.hide();
          progressDialog = false;
          return null;
        }
      } else {

        _progressDialog.hide();
        progressDialog = false;
        return null;
      }
    } catch (e) {
      //  Fluttertoast.showToast(msg: "Error " + e.toString());
    }
  }


  Future<String?> requestPost_GetonlyToken(
      {String? url, String? parameters, context}) async {
    try {
      SimpleFontelicoProgressDialog? _progressDialog =
      SimpleFontelicoProgressDialog(
          context: context, barrierDimisable: false);
      // if (progressDialog == false) {
      //   progressDialog = true;
      //   // _progressDialog.show(textToBeDisplayed: 'Please wait...');
      //
      //   // _progressDialog.show(
      //   //   message: "Please wait...",
      //   // );
      // }
      log('requestPost_GetonlyToken_url==' + url.toString());
      log('requestPost_GetonlyToken_parameters==' + parameters.toString());
      debugPrint(parameters, wrapWidth: 1024);

      bool flagNet = await new MyUtilClass().isInternetAvailable();
      if (flagNet) {
        Uri uri = Uri.parse(url!);

        final results = await http.post(uri,
            body: parameters, headers: {"Content-Type": "application/json"});
        // log("Resultss " + results.toString());

        if (results.statusCode == 200) {
          // final jsonObject = json.decode(results.body);
          // print(jsonObject);
          // _progressDialog.dismissProgressDialog(context);
          log('requestPost_GetonlyTokenresults.body==' +
              results.body.toString());
          // _progressDialog.hide();
          // progressDialog = false;
          return results.body;
        } else {
          // _progressDialog.dismissProgressDialog(context);
          // _progressDialog.hide();
          // progressDialog = false;
          return null;
        }
      } else {
        // _progressDialog.dismissProgressDialog(context);
        // _progressDialog.hide();
        // progressDialog = false;
        return null;
      }
    } catch (e) {
      // Fluttertoast.showToast(msg: "Error " + e.toString());
    }
  }

  Future<Map?> requestPostWithToken(
      {String? url,
        String? parameters,
        context,
        required String? token}) async {
    SimpleFontelicoProgressDialog? _progressDialog =
    SimpleFontelicoProgressDialog(
        context: context, barrierDimisable: false);
    if (progressDialog == false) {
      progressDialog = true;
      // _progressDialog.show(textToBeDisplayed: 'Please wait...');

      _progressDialog.show(
        message: "Please wait...",
      );
    }
    log('requestPostWithToken_url==' + url.toString());
    log('requestPostWithToken_parameters==' + parameters.toString());
    debugPrint(parameters, wrapWidth: 1024);
    log("requestPostWithToken_token :- " + token!);
    bool flagNet = await new MyUtilClass().isInternetAvailable();
    if (flagNet) {
      Uri uri = Uri.parse(url!);

      final results = await http.post(uri, body: parameters, headers: {
        HttpHeaders.contentTypeHeader: "application/json",
        HttpHeaders.authorizationHeader: "Bearer $token"
      });
      log("Resultss " + results.toString());
      log("Resultss " + results.statusCode.toString());

      if (results.statusCode == 200) {
        final jsonObject = json.decode(results.body);
        log('requestPostWithToken_jsonObject==' + jsonObject.toString());
        log('requestPostWithToken_jsonObject==' + results.body);
        _progressDialog.hide();
        progressDialog = false;
        return jsonObject;
      } else {
        _progressDialog.hide();
        progressDialog = false;
        return null;
      }
    } else {
      _progressDialog.hide();
      progressDialog = false;
      return null;
    }
  }
  Future<Map?> requestPostWithToken_withoutloader(
      {String? url,
        String? parameters,
        context,
        required String? token}) async {
    // SimpleFontelicoProgressDialog? _progressDialog =
    // SimpleFontelicoProgressDialog(
    //     context: context, barrierDimisable: false);
    // if (progressDialog == false) {
    //   progressDialog = true;
    //   // _progressDialog.show(textToBeDisplayed: 'Please wait...');
    //
    //   _progressDialog.show(
    //     message: "Please wait...",
    //   );
    // }
    log('requestPostWithToken_url==' + url.toString());
    log('requestPostWithToken_parameters==' + parameters.toString());
    debugPrint(parameters, wrapWidth: 1024);
    log("requestPostWithToken_token :- " + token!);
    bool flagNet = await new MyUtilClass().isInternetAvailable();
    if (flagNet) {
      Uri uri = Uri.parse(url!);

      final results = await http.post(uri, body: parameters, headers: {
        HttpHeaders.contentTypeHeader: "application/json",
        HttpHeaders.authorizationHeader: "Bearer $token"
      });
      log("Resultss " + results.toString());
      log("Resultss " + results.statusCode.toString());

      if (results.statusCode == 200) {
        final jsonObject = json.decode(results.body);
        log('requestPostWithToken_jsonObject==' + jsonObject.toString());
        log('requestPostWithToken_jsonObject==' + results.body);
        // _progressDialog.hide();
        // progressDialog = false;
        return jsonObject;
      } else {
        // _progressDialog.hide();
        // progressDialog = false;
        return null;
      }
    } else {
      // _progressDialog.hide();
      // progressDialog = false;
      return null;
    }
  }
  Future<String?> verifyToken(
      {String? url,
        String? parameters,
        context,
        required String? token}) async {
    try {
      SimpleFontelicoProgressDialog? _progressDialog =
      SimpleFontelicoProgressDialog(
          context: context, barrierDimisable: false);
      // if (progressDialog == false) {
      //   progressDialog = true;
      //   // _progressDialog.show(textToBeDisplayed: 'Please wait...');
      //
      //   // _progressDialog.show(
      //   //   message: "Please wait...",
      //   // );
      // }
      log('verifyToken_url==' + url.toString());
      log('verifyToken_parameters==' + parameters.toString());
      debugPrint(parameters, wrapWidth: 1024);

      bool flagNet = await new MyUtilClass().isInternetAvailable();
      if (flagNet) {
        Uri uri = Uri.parse(url!);

        // final results = await http.post(uri,
        //     body: parameters, headers: {"Content-Type": "application/json"});
        final results = await http.post(uri, body: null, headers: {
          HttpHeaders.contentTypeHeader: "application/json",
          HttpHeaders.authorizationHeader: "Bearer $token"
        });
        log("Resultss " + results.toString());

        if (results.statusCode == 200) {
          log('verifyToken_results.body==' + results.body.toString());
          log("results.body " + results.body);
          return results.body;
        } else {
          return null;
        }
      } else {
        // _progressDialog.dismissProgressDialog(context);
        // _progressDialog.hide();
        // progressDialog = false;
        return null;
      }
    } catch (e) {
      //  Fluttertoast.showToast(msg: "Error " + e.toString());
    }
  }

  Future<Map?> multipartRequestPostWithToken(
      {String? url,
        List? path,
        String? parameters,
        context,
        required String? token,
        String? userid}) async {
    SimpleFontelicoProgressDialog? _progressDialog =
    SimpleFontelicoProgressDialog(
        context: context, barrierDimisable: false);
    if (progressDialog == false) {
      progressDialog = true;
      // _progressDialog.show(textToBeDisplayed: 'Please wait...');

      _progressDialog.show(
        message: "Please wait...",
      );
    }
    log('multipartRequestPostWithToken_url==' + url.toString());
    log('multipartRequestPostWithToken_parameters==' + parameters.toString());
    debugPrint(parameters, wrapWidth: 1024);
    log("multipartRequestPostWithToken_token :- " + token!);
    bool flagNet = await new MyUtilClass().isInternetAvailable();

    if (flagNet) {
      Uri uri = Uri.parse(url!);
      Map<String, String> headers = {
        HttpHeaders.contentTypeHeader: "application/json",
        HttpHeaders.authorizationHeader: "Bearer $token"
      };
      final data = json.decode(parameters!);

      var request = http.MultipartRequest('POST', uri);
      request = jsonToFormData(request, data);
      request.headers.addAll(headers);
      if (path != null) {
        for (int i = 0; i < path.length; i++) {
          request.files.add(await http.MultipartFile.fromPath(
              userid.toString() + i.toString(), path[i]));
        }
      }

      var response = await request.send();

      log("Resultss " + response.toString());
      log("Resultss " + response.statusCode.toString());

      if (response.statusCode == 200) {
        // for getting and decoding the response into json formate.
        var responsed = await http.Response.fromStream(response);
        final jsonObject = json.decode(responsed.body);

        log('requestPostWithToken_jsonObject==' + jsonObject.toString());
        log('requestPostWithToken_jsonObject==' + responsed.body);
        _progressDialog.hide();
        progressDialog = false;
        return jsonObject;
      } else {
        _progressDialog.hide();
        progressDialog = false;
        return null;
      }
    } else {
      _progressDialog.hide();
      progressDialog = false;
      return null;
    }
  }

  /**
   * jsonToFormData: Pooja & Arjun
   */
  jsonToFormData(http.MultipartRequest request, Map<String, dynamic> data) {
    for (var key in data.keys) {
      request.fields[key] = data[key].toString();
    }
    return request;
  }
}
