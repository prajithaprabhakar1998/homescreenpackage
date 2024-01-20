
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../Controller/LoginController.dart';
import '../Utils/Color.dart';
import '../Utils/Widget/gettextformfield.dart';


class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    final LoginController loginController = Get.put(LoginController());

    return Scaffold(
      appBar: AppBar(
         backgroundColor: Appcolor.homebg,
         title: GetText(textName: 'Login Page', fontSize: 15, color: Appcolor.white, fontWeight: FontWeight.w500)

      ),
      body: Container(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Obx(() {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [

                getTextFormField(
                  height: 70,
                    labelfontsize: 13,
                    hintfontsize: 13,
                    hintColor: Appcolor.black,
                    labelColor: Appcolor.black,
                    inputType: TextInputType.text,
                    hintName: 'userid',
                    maxLines: 1,
                    fillColor: Appcolor.white,
                    textInputAction: TextInputAction.next,
                    controller: loginController.txtEmail),


                SizedBox(
                  height: 20,
                ),






                getTextFormField(
                  height: 70,
                  labelfontsize: 13,
                  hintfontsize: 13,
                  hintColor: Colors.black,
                  labelColor: Colors.black,
                  fillColor: Appcolor.white,
                  maxLines: 1,
                  controller: loginController.txtPassword,
                  isObscureText: loginController.showpass.value,
                  icon: IconButton(
                      onPressed: (){
                        loginController.showpass.value =
                        !loginController.showpass.value;

                        print(loginController.showpass);

                      },
                      icon: Icon(loginController.showpass == true
                          ? Icons.visibility_off
                          : Icons.visibility)), hintName: 'password',
                ),






                SizedBox(
                  height: 20,
                ),
                MaterialButton(
                  color: Colors.blue,
                  onPressed: () {
                    loginController.checkvalidlogin(context);
                  },
                  child: Text(
                    "Login",
                  ),
                ),
              ],
            );
          }),
        ),
      ),
    );
  }
}