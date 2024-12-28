import 'package:dash_fixit/data/signin_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../Core/constant/route.dart';
abstract class SigninController extends GetxController{
  Signin();
}


class SigninControllerImp extends SigninController{

 GlobalKey<FormState> formstate8= GlobalKey<FormState>();
  late TextEditingController email;
  late TextEditingController password;


  bool isshowpassword = true;
  Showpassword(){
    isshowpassword = isshowpassword == true ? false : true ;
    update();
  }

  @override
  Signin() async {
    var formdata = formstate8.currentState;
    if (formdata!.validate()) {
      try {
        SigninService signinService=SigninService();
        String? token = await signinService.signIn(email.text, password.text);

        if (token != null) {
          String? role = await signinService.getUserType();
          if (role == "admin") {
            Get.offNamed(AppRoute.HomePage);
          }else {
            Get.offNamed(AppRoute.SignIn);
          }
        } else {
          print("Failed to get token");
        }
      } catch (e) {
        print("Error during sign in: $e");
      }
    }
  }


@override
  void onInit() {
    email = TextEditingController();
    password = TextEditingController();
    super.onInit();
  }
  @override
  void dispose() {
    email.dispose();
    password.dispose();
     super.dispose();
  }
}