// import 'package:flutter/material.dart';
//
// class GetText extends StatelessWidget {
//   final String textName;
//   final double fontSize;
//   final Color color;
//   final FontWeight fontWeight;
//
//
//   GetText({
//     required this.textName,
//     required this.fontSize,
//     required this.color,
//     required this.fontWeight,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     return Text(
//       textName,
//       style: TextStyle(
//         fontSize: fontSize,
//         color: color,
//         fontWeight: fontWeight,
//       ),
//     );
//   }
// }
//
// class getTextFormField extends StatelessWidget {
//   final VoidCallback? onEditingComplete;
//   TextEditingController controller;
//   String? hintName;
//   String? fontFamily;
//   bool isObscureText;
//   TextInputType inputType;
//   TextInputAction? textInputAction;
//   bool isEnable;
//   Color hintColor;
//   Color labelColor;
//   final Function()? onPressed;
//   final FocusNode? focusNode;
//   IconButton? iconbutton;
//   Icon? icon;
//   int? minLines;
//   int? maxLines;
//   Color? fillColor;
//   double? height;
//   double? labelfontsize;
//   double? hintfontsize;
//   Icon?  prefixicon;
//   bool expands;
//   String? labelText;
//
//
//
//   getTextFormField({
//     required this.labelfontsize,
//     required this.hintfontsize,
//     this.minLines,
//     this.maxLines,
//     this.onPressed,
//     this.icon,
//     this.fontFamily,
//     required this.hintColor,
//     required this.labelColor,
//     required this.controller,
//     this.hintName,
//     this.isObscureText = false,
//     this.inputType = TextInputType.text,
//     this.isEnable = true,
//     this.fillColor,
//     this.textInputAction,
//     this.height,
//     this.focusNode,
//    this.onEditingComplete,
//     this.iconbutton,
//     this.prefixicon,
//     this.expands=true,
//     this.labelText,
//
//
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       height: height,
//       padding: EdgeInsets.symmetric(vertical: 5.0),
//       child: TextField(
//         expands: expands,
//         onEditingComplete: onEditingComplete,
//         focusNode: focusNode,
//         textAlign: TextAlign.start,
//         style: TextStyle(
//           fontFamily: fontFamily,
//           color: labelColor,
//           fontSize: labelfontsize,
//         ),
//         minLines: minLines,
//         //Normal textInputField will be displayed
//         maxLines: maxLines,
//         onTap: () => onPressed,
//         controller: controller,
//         obscureText: isObscureText,
//         enabled: isEnable,
//         keyboardType: inputType,
//         textInputAction: textInputAction,
//         decoration: InputDecoration(
//           labelText: labelText,
//           suffixIcon: iconbutton,
//           prefixIcon: prefixicon,
//           contentPadding:
//           EdgeInsets.only(right: 5, left: 10, bottom: 8, top: 8),
//           border: OutlineInputBorder(
//             borderRadius: BorderRadius.circular(8.0),
//             borderSide: BorderSide(
//               width: 0.5,
//             //  color: AppColors.dataColor,
//             ),
//           ),
//           enabledBorder: OutlineInputBorder(
//             borderRadius: BorderRadius.circular(8.0),
//             borderSide: BorderSide(
//               width: 0.5,
//              // color: AppColors.dataColor,
//             ),
//           ),
//           hintText: hintName,
//           hintStyle: TextStyle(
//             fontFamily: fontFamily,
//             fontSize: hintfontsize,
//             color: hintColor,
//           ),
//           floatingLabelBehavior: FloatingLabelBehavior.never,
//           fillColor: fillColor,
//           filled: true,
//         ),
//       ),
//     );
//   }
// }




import 'package:flutter/material.dart';


class GetText extends StatelessWidget {
  final String textName;
  final double fontSize;
  final Color color;
  final FontWeight fontWeight;

  GetText({
    required this.textName,
    required this.fontSize,
    required this.color,
    required this.fontWeight,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      textName,
      style: TextStyle(
        fontSize: fontSize,
        color: color,
        fontWeight: fontWeight,
      ),
    );
  }
}

class getTextFormField extends StatelessWidget {
  final VoidCallback? onEditingComplete;
  TextEditingController controller;
  String hintName;
  String? fontFamily;
  bool isObscureText;
  TextInputType inputType;
  TextInputAction? textInputAction;
  bool isEnable;
  Color hintColor;
  Color labelColor;
  final Function()? onPressed;
  final FocusNode? focusNode;
  IconButton? icon;
  int? minLines;
  int? maxLines;
  Color? fillColor;
  double? height;
  double? labelfontsize;
  double? hintfontsize;

  getTextFormField({
    required this.labelfontsize,
    required this.hintfontsize,
    this.minLines,
    this.maxLines,
    this.onPressed,
    this.icon,
    this.fontFamily,
    required this.hintColor,
    required this.labelColor,
    required this.controller,
    required this.hintName,
    this.isObscureText =false,
    this.inputType = TextInputType.text,
    this.isEnable = true,
    this.fillColor,
    this.textInputAction,
    this.height,
    this.focusNode,
    this.onEditingComplete,
  });


  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      padding: EdgeInsets.symmetric(vertical: 5.0),
      child: TextField(
        onEditingComplete: onEditingComplete,
        focusNode: focusNode,
        textAlign: TextAlign.start,
        style: TextStyle(
          fontFamily: fontFamily,
          color: labelColor,
          fontSize: labelfontsize,
        ),
        minLines: minLines,
        //Normal textInputField will be displayed
        maxLines: maxLines,
        onTap: () => onPressed,
        controller: controller,
        obscureText: isObscureText,
        enabled: isEnable,
        keyboardType: inputType,
        textInputAction: textInputAction,
        decoration: InputDecoration(
          suffixIcon: icon,
          contentPadding:
          EdgeInsets.only(right: 5, left: 10, bottom: 8, top: 8),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0),
            borderSide: BorderSide(
              width: 0.5,
              color: Colors.black,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0),
            borderSide: BorderSide(
              width: 0.5,
              color: Colors.black,
            ),
          ),
          hintText: hintName,
          hintStyle: TextStyle(
            fontFamily: fontFamily,
            fontSize: hintfontsize,
            color: hintColor,
          ),
          floatingLabelBehavior: FloatingLabelBehavior.never,
          fillColor: fillColor,
          filled: true,
        ),
      ),
    );
  }
}