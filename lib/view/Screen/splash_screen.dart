import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

import '../../../Core/constant/route.dart';
import '../../../Core/services/myservices.dart';
import '../../data/signin_service.dart';
import '../../language.dart';


class SplachScreen extends StatefulWidget {
  const SplachScreen({super.key});
  @override
  State<SplachScreen> createState() => _SplachScreenState();
}

class _SplachScreenState extends State<SplachScreen> {
  SigninService signinService =SigninService();
  Myservices myServices = Get.find();

  @override
  void initState(){
    super.initState();
    Timer(const Duration(seconds: 3),checkloginstate);
  }

  Future<void> checkloginstate()async {
    bool? isLanguageSelected = myServices.sharedPreferences.getBool(
        "isLanguageSelected");

    if (isLanguageSelected == null || !isLanguageSelected) {
      Get.off(() => const Language());
    } else {
      String? token = await signinService.getToken();
      String? role = await signinService.getUserType();

      if (token != null) {
        if (role == "admin") {
          Get.offNamed(AppRoute.HomePage);
        }else{
          Get.offNamed(AppRoute.SignIn);
        }
      } else {
        Get.offNamed(AppRoute.SignIn);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:const Color(0xff6A3BA8),
      body:Center(
        child: Lottie.asset('assets/logo.json'),
      ),
    );
  }
}
