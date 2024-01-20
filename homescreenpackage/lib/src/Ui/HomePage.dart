



import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../Controller/HomeController.dart';
import '../RequestResponse/MobHomePageFillV2Response.dart';
import '../Utils/Color.dart';
import '../Utils/Widget/gettextformfield.dart';
import 'LoginPage.dart';
import 'package:pie_chart/pie_chart.dart';

class HomePage1 extends StatefulWidget {
  HomePage1({super.key});


  @override
  State<HomePage1> createState() => _HomePage1State();
}

class _HomePage1State extends State<HomePage1> {
  final HomeController homeController = Get.put(HomeController());



  Perform perform=Perform();
  MeetSum meetSum=MeetSum();
  NextApp nextApp=NextApp();
  MobHomeMast mobHomeMast=MobHomeMast();



  Map<String, double> buildPieChartData(MeetSum? meetSum) {
    Map<String, double> dataMap = {};
    if (meetSum != null) {
      dataMap['Today'] = double.tryParse(meetSum.todayCnt.toString())??0;
      dataMap['7 Days'] = double.tryParse(meetSum.weekCnt.toString())??0;
      dataMap['30 Days'] = double.tryParse(meetSum.mthCnt.toString())??0;
    }
    return dataMap;
  }




  List<Color> colours = [
    Appcolor.alertDelete,
    Appcolor.aptConfirmed,
    Appcolor.alertInfo,
  ];

  @override
  void initState() {
    super.initState();
    homeController.MobHomePageFill_V2(context);
    setState(() {});
  }



  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Appcolor.txtDashboardBG,
      appBar: AppBar(
        backgroundColor: Appcolor.homebg,
        iconTheme: IconThemeData(color: Appcolor.white),

        title: GetText(
            textName: 'HOME',
            fontSize: 15,
            color: Appcolor.white,
            fontWeight: FontWeight.w500),
      ),

      drawer: Drawer(
        backgroundColor: Appcolor.txtDashboardBG,
        child: ListView(
          children: [
            ListTile(
              leading: Icon(Icons.logout,size: 20,),
              title: GetText(textName: 'Logout', fontSize: 13, color: Appcolor.dataColor, fontWeight: FontWeight.w500),
              onTap: (){

                Navigator.of(Get.context!).pushAndRemoveUntil(
                    new MaterialPageRoute(
                      builder: (context) => LoginPage(),
                    ),
                        (route) => false);
                homeController.nextAppList.clear();

              },
            ),

          ],

        ),
      ),





      body: Container(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GetText(
                  textName: 'TODAYS APPOINMENTS',
                  fontSize: 12,
                  color: Appcolor.dataColor,
                  fontWeight: FontWeight.w500),
              SizedBox(
                height: 10,
              ),

              homeController.nextAppList.length==0?




              Center(child: GetText(textName: 'No Appointment', fontSize: 13, color: Appcolor.alertDelete, fontWeight: FontWeight.w300))


                  : Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: Appcolor.homebg,
                ),
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      GetText(
                          textName: 'NEXT APPOINTMENT',
                          fontSize: 11,
                          color: Appcolor.white,
                          fontWeight: FontWeight.w400),
                      Column(
                        children: [
                          GetText(
                              textName: homeController.nextAppList.first.meetSubject.toString(),
                              fontSize: 13,
                              color: Appcolor.white,
                              fontWeight: FontWeight.w400),
                          GetText(
                              textName: homeController.nextAppList.first.customer.toString(),
                              fontSize: 11,
                              color: Appcolor.white,
                              fontWeight: FontWeight.w400),
                          GetText(
                              textName:  homeController.nextAppList.first.meetTime.toString(),
                              fontSize: 11,
                              color: Appcolor.white,
                              fontWeight: FontWeight.w400)
                        ],
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              GetText(
                  textName: 'APPOINMENT SUMMARY',
                  fontSize: 12,
                  color: Appcolor.dataColor,
                  fontWeight: FontWeight.w500),
              SizedBox(
                height: 15,
              ),



              // homeController.meetSumList.length==0?
              //   Center(child: GetText(textName: 'No Appointment', fontSize: 13, color: Appcolor.alertDelete, fontWeight: FontWeight.w300))

              Container(
                height: 220,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: Appcolor.white,
                ),
                child: PieChart(
                  dataMap: buildPieChartData(meetSum),
                  animationDuration:  Duration(milliseconds: 800),
                  chartLegendSpacing: 20,
                  chartRadius: 170,
                  colorList: colours,
                  initialAngleInDegree: 10,
                  chartType: ChartType.disc,
                  ringStrokeWidth: 20,
                  legendOptions: LegendOptions(
                    showLegendsInRow: false,
                    legendPosition: LegendPosition.right,
                    showLegends: true,
                    legendShape: BoxShape.circle,
                    legendTextStyle: TextStyle(
                        fontWeight: FontWeight.w300,
                        fontSize: 13,
                        color: Appcolor.black.withOpacity(0.5)),
                  ),
                  chartValuesOptions: ChartValuesOptions(
                    showChartValueBackground: false,
                    showChartValues: true,
                    chartValueStyle: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w400,
                        color: Appcolor.dataColor),
                    showChartValuesInPercentage: false,
                    showChartValuesOutside: true,
                    decimalPlaces: 1,
                  ),
                ),
              ),


              SizedBox(
                height: 15,
              ),
              GetText(
                  textName: 'APPOINMENT HISTORY',
                  fontSize: 12,
                  color: Appcolor.dataColor,
                  fontWeight: FontWeight.w500),
              SizedBox(
                height: 15,
              ),


              homeController.performList.length==0?

              Center(child: GetText(textName: 'No Appointment', fontSize: 13, color: Appcolor.alertDelete, fontWeight: FontWeight.w300)):

              Expanded(
                child: Obx(() {
                  if(homeController.isloading){
                    return Center(child: CircularProgressIndicator(),);
                  }
                  else {
                    return ListView.builder(
                        itemCount: homeController.performList.length,
                        itemBuilder: (context, index) {
                          return Card(
                            elevation: 5,
                            surfaceTintColor: Appcolor.white,
                            child: Column(
                              children: [
                                Container(
                                  height: 30,
                                  width: MediaQuery
                                      .of(context)
                                      .size
                                      .width,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(8),
                                      color: Appcolor.cardheading),
                                  child: Row(
                                    mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                    children: [
                                      GetText(
                                          textName: homeController.performList[index].mthName.toString(),
                                          fontSize: 13,
                                          color: Appcolor.white,
                                          fontWeight: FontWeight.w300),
                                      GetText(
                                          textName: homeController.performList[index].meetYear.toString(),
                                          fontSize: 13,
                                          color: Appcolor.white,
                                          fontWeight: FontWeight.w300)
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Row(
                                    mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                    children: [
                                      Column(
                                        children: [
                                          GetText(
                                              textName: 'Appointments',
                                              fontSize: 12,
                                              color: Appcolor.dataColor,
                                              fontWeight: FontWeight.w300),
                                          SizedBox(
                                            height: 5,
                                          ),
                                          CircleAvatar(
                                            radius: 10,
                                            backgroundColor: Appcolor.alertInfo,
                                            child: GetText(
                                                textName: homeController.performList[index].app.toString(),
                                                fontSize: 13,
                                                color: Appcolor.white,
                                                fontWeight: FontWeight.w300),
                                          ),
                                        ],
                                      ),
                                      Column(
                                        children: [
                                          GetText(
                                              textName: 'Meeting Reports',
                                              fontSize: 12,
                                              color:
                                              Appcolor.black.withOpacity(0.5),
                                              fontWeight: FontWeight.w300),
                                          SizedBox(
                                            height: 5,
                                          ),
                                          CircleAvatar(
                                            radius: 10,
                                            backgroundColor: Appcolor
                                                .aptPending,
                                            child: GetText(
                                                textName: homeController.performList[index].mR.toString(),
                                                fontSize: 13,
                                                color: Appcolor.white,
                                                fontWeight: FontWeight.w300),
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                )
                              ],
                            ),
                          );
                        });
                  }
                }),

              )
            ],
          ),
        ),
      ),
    );
  }
}