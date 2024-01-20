
import 'dart:convert';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import '../Http/Request.dart';
import '../Http/Url.dart';
import '../Http/VerifyToken.dart';
import '../RequestResponse/MobHomePageFillV2Request.dart';
import '../RequestResponse/MobHomePageFillV2Response.dart';
import '../Utils/Widget/OKDialog .dart';
import 'LoginController.dart';

class HomeController extends GetxController {
  final LoginController loginController = Get.put(LoginController());

  var token = "".obs;

  var aeId = "".obs;
  var userId = "".obs;
  var errorMsg = "".obs;
  var nextApp = "".obs;
  var meetSum = "".obs;
  var currTime = "".obs;
  var currDt = "".obs;
  var scheId = "".obs;
  var meetSubject = "".obs;
  var customer = "".obs;
  var meetTime = "".obs;
  var todayCnt = "".obs;
  var weekCnt = "".obs;
  var mthCnt = "".obs;
  var mthName = "".obs;
  var app = "".obs;
  var mthNum = "".obs;
  var mR = "".obs;
  var meetYear = "".obs;

  RxList<MobHomePageFillV2Response> jsonresponseList = <MobHomePageFillV2Response>[].obs;
  RxList<MobHomeMast> responseList = <MobHomeMast>[].obs;
  RxList<NextApp> nextAppList = <NextApp>[].obs;
  RxList<MeetSum> meetSumList = <MeetSum>[].obs;
  RxList<Perform> performList = <Perform>[].obs;

  bool isloading = true;

  Future<void> MobHomePageFill_V2(BuildContext context) async {
    var token = loginController.token.value;

    print("MobHomePageFillV2_token");
    print(token);

    String tokenvalue = await verifyToken(context, token);
    print(tokenvalue.toString());

    if (tokenvalue== "True") {

      /// current date time

      String currentDate = DateFormat('yyyy-MM-dd').format(DateTime.now());
      String currentTime=DateFormat('kk:mm:ss').format(DateTime.now());


      // String currDt = getcurrentDate().toString();
      // String currTime = getcurrentTime().toString();

      print('---------');
      print(currDt.toString());
      print(currTime.toString());

      print('---------');


      MobHomePageFillV2Request requestModel = MobHomePageFillV2Request(
          aeId: "ELGO",
          userId: "SIC321",
          currDt: currentDate,
          currTime: currentTime);

      final results = await new Request().requestPostWithToken(
          token: token,
          url: Urls.urlBase + Urls.MobHomePageFillV2,
          parameters: json.encode(requestModel),
          context: Get.context);

      print("result=========${results.toString()}");




      if (results != null) {
        try {
          MobHomePageFillV2Response responseModel =
          MobHomePageFillV2Response.fromJson(results);
          log('MobHomePageFillV2Response' + results.toString());

          if (responseModel.status == "SUCCESS") {
            performList.clear();


            for (int i = 0;
            i < (responseModel.mobHomeMast!.perform!.length ?? 0);
            i++) {
              performList.add(Perform(
                  meetYear: responseModel.mobHomeMast?.perform?[i].meetYear,
                  mthNum: responseModel.mobHomeMast?.perform?[i].mthNum,
                  mthName: responseModel.mobHomeMast?.perform?[i].mthName,
                  mR: responseModel.mobHomeMast?.perform?[i].mR,
                  app: responseModel.mobHomeMast?.perform?[i].app));
            }

            MobHomeMast? mobHomeMast = responseModel.mobHomeMast;

            if (mobHomeMast != null) {
              NextApp nextApp = mobHomeMast.nextApp ?? NextApp();
              MeetSum meetSum = mobHomeMast.meetSum ?? MeetSum();
              meetSumList.value = [meetSum];
              MobHomePageFillV2Response mobHomePageFillV2Response =
              MobHomePageFillV2Response(
                  message: responseModel.message.toString(),
                  mobHomeMast: MobHomeMast(
                      meetSum: meetSum,
                      errorMsg: mobHomeMast.errorMsg,
                      currTime: mobHomeMast.currTime,
                      currDt: mobHomeMast.currDt,
                      aeId: mobHomeMast.aeId,
                      nextApp: nextApp,
                      perform: performList,
                      userId: mobHomeMast.userId));

              jsonresponseList.add(mobHomePageFillV2Response);
              nextAppList.add(nextApp);


              print('---------------');
              print('---------------');
              print('---------------');
              print("jsonresponseList===${jsonresponseList.toString()}");
              print("responseList===${responseList.toString()}");
              print("performList===${performList.toString()}");
              print("nextsapplist===${nextAppList.toString()}");
              print("meetsumlist===${meetSumList.toString()}");
              print('---------------');
              print('---------------');
              print('---------------');



            }
          } else {
            if (responseModel.message!.toString() == "Failed") {
              showDialog(
                  context: Get.context!,
                  builder: (BuildContext context1) => OKDialog(
                    title: "Failed",
                    descriptions:
                    "Something went wrong please try again after sometime",
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
                descriptions: "Something went wrong",
                img: Image.asset("assets/images/warning.png"),
                text: '',
                key: null,
              ));
        } finally {
          isloading = false;
        }



      } else {

        showDialog(
            context: Get.context!,
            builder: (BuildContext context1) => OKDialog(
              title: "Failed",
              descriptions: "Something went wrong",
              img: Image.asset("assets/images/warning.png"),
              text: '',
              key: null,
            ));

      }
    }
  }
}