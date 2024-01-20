import 'package:flutter/material.dart';



class OKDialog extends StatefulWidget {
  final String title;
  final String descriptions, text;
  final Image? img;

  const OKDialog(
      {required Key? key,
      required this.title,
      required this.descriptions,
      required this.text,
     this.img})
      : super(key: key);

  @override
  _OKDialogState createState() => _OKDialogState();
}

class _OKDialogState extends State<OKDialog> {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(15.0))),
      elevation: 10.0,
      backgroundColor: Colors.white,
      child: dialogContent(context),
    );
  }

  dialogContent(BuildContext context) {
    var dialog_context = context;
    return Container(
        width: MediaQuery.of(context).size.width / 2,
        child: Container(
          child: Padding(
            padding: const EdgeInsets.only(
                left: 10.0, right: 10, bottom: 15, top: 5),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                Column(
                  children: <Widget>[
                    SizedBox(height: 5),
                    // Image(
                    //   image: AssetImage(
                    //     'assets/images/warning.png',
                    //   ),
                    //   height: 60,
                    //   width: 60,
                    // ),
                    SizedBox(height: 5),
                    widget.title != ""
                        ? Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Flexible(
                                child: Text(
                                  maxLines: 5,
                                  widget.title,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color:Colors.blue,
                                    fontSize: 13,
                                  ),
                                ),
                              )
                            ],
                          )
                        : SizedBox(),
                    widget.title != "" ? SizedBox(height: 20) : SizedBox(),
                    widget.descriptions != ""
                        ? Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Flexible(
                                child: Text(
                                  maxLines: 5,
                                  widget.descriptions,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Colors.blue,
                                    fontSize: 13,
                                  ),
                                ),
                              )
                            ],
                          )
                        : SizedBox(),
                    SizedBox(height: 20),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    InkWell(
                      onTap: () {
                        Navigator.of(dialog_context).pop();
                      },
                      child: Center(
                        child: Container(
                          width: MediaQuery.of(context).size.width / 2,
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                              color: Colors.white),
                          child: Center(
                            child: Text("OK",
                                maxLines: 5,
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 13,
                                )),
                          ),
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ));
  }
}

// class ResponseDialog extends StatefulWidget {
//   final String title;
//   final String button;
//   final String descriptions, text;
//
//   final Image? img;
//
//   const ResponseDialog(
//       {required Key? key,
//       required this.title,
//       required this.descriptions,
//       required this.text,
//       required this.img,
//       required this.button})
//       : super(key: key);
//
//   @override
//   _ResponseDialogState createState() => _ResponseDialogState();
// }
//
// class _ResponseDialogState extends State<ResponseDialog> {
//   @override
//   Widget build(BuildContext context) {
//     return Dialog(
//       shape: RoundedRectangleBorder(
//           borderRadius: BorderRadius.all(Radius.circular(10.0))),
//       elevation: 10.0,
//       backgroundColor: Colors.white,
//       child: dialogContent(context),
//     );
//   }
//
//   dialogContent(BuildContext context) {
//     double WIDTH = MediaQuery.of(context).size.width;
//     var dialog_context = context;
//     return Container(
//         width: MediaQuery.of(context).size.width,
//         child: Container(
//           child: Padding(
//             padding:
//                 EdgeInsets.only(left: 5.0, right: 5.0, bottom: 5.0, top: 5.0),
//             child: Column(
//               mainAxisSize: MainAxisSize.min,
//               mainAxisAlignment: MainAxisAlignment.start,
//               crossAxisAlignment: CrossAxisAlignment.end,
//               children: <Widget>[
//                 Column(
//                   children: <Widget>[
//                     SizedBox(height: 5),
//                     Image(
//                       image: AssetImage(widget.img!.image.toString()),
//                     ),
//                     SizedBox(height: 10),
//                     widget.title != ""
//                         ? Row(
//                             mainAxisAlignment: MainAxisAlignment.center,
//                             children: <Widget>[
//                               Padding(
//                                 padding: EdgeInsets.only(left: 5.0, right: 5.0),
//                                 child: Text(
//                                   overflow: TextOverflow.visible,
//                                   textAlign: TextAlign.center,
//                                   maxLines: 5,
//                                   widget.title,
//                                   style: TextStyle(
//                                     color: AppColors.jbmColor,
//                                     fontSize: SizeEditor.textNormalSize,
//                                   ),
//                                 ),
//                               ),
//                             ],
//                           )
//                         : SizedBox(),
//                     widget.title != "" ? SizedBox(height: 5.0) : SizedBox(),
//                     widget.descriptions != ""
//                         ? Padding(
//                             padding: EdgeInsets.only(left: 5.0, right: 5.0),
//                             child: Text(
//                               overflow: TextOverflow.visible,
//                               textAlign: TextAlign.center,
//                               maxLines: 5,
//                               widget.descriptions,
//                               style: TextStyle(
//                                 color: AppColors.jbmColor,
//                                 fontSize: SizeEditor.textNormalSize,
//                               ),
//                             ))
//                         : SizedBox(),
//                     SizedBox(height: 20),
//                   ],
//                 ),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: <Widget>[
//                     InkWell(
//                       onTap: () {
//                         Navigator.of(dialog_context).pop();
//                       },
//                       child: Center(
//                         child: Container(
//                           width: WIDTH / 2,
//                           height: 40,
//                           padding: EdgeInsets.all(10),
//                           decoration: BoxDecoration(
//                               borderRadius: BorderRadius.circular(10),
//                               color: AppColors.aptConfirmed),
//                           child: Center(
//                             child: Text(widget.button.toUpperCase(),
//                                 maxLines: 5,
//                                 overflow: TextOverflow.visible,
//                                 textAlign: TextAlign.center,
//                                 style: TextStyle(
//                                   color: AppColors.white,
//                                   fontSize: SizeEditor.textNormalSize,
//                                 )),
//                           ),
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//                 SizedBox(height: 20),
//               ],
//             ),
//           ),
//         ));
//   }
// }
