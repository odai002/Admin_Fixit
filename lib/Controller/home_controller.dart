import 'dart:convert';
import 'dart:developer';
import 'package:dash_fixit/Core/constant/link_api.dart';
import 'package:dash_fixit/data/model/users.dart';
import 'package:dash_fixit/data/signin_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;


class HomeController extends GetxController{
  List<int> usersId=[];


  Future<void> banUser(int userId) async {
    try {
      await BannedUser(userId);
      Get.snackbar('Success', 'User banned successfully',backgroundColor:Colors.green);
    } catch (e) {
      log('Error banning user: $e');
      Get.snackbar('Error', 'Failed to ban user');
    }
  }
  Future<void> unbanUser(int userId) async {
    try {
      await UnBannedUser(userId);
      Get.snackbar('Success', 'User unbanned successfully',backgroundColor:Colors.white);
    } catch (e) {
      log('Error unbanning user: $e');
      Get.snackbar('Error', 'Failed to unban user');
    }
  }

  Future<List<User>> getAllUsers() async {
    try {
      SigninService signinService = SigninService();
      String? token = await signinService.getToken();
      String url = AppLink.getAllUser;

      final response = await http.get(Uri.parse(url), headers: {
        "Authorization": "Bearer $token"
      });

      if (response.statusCode == 200) {
        final Map<String, dynamic> jsonResponse = jsonDecode(response.body);
        final List<dynamic> data = jsonResponse['data'];
        final users= data.map((userJson) => User.fromJson(userJson)).toList();
        usersId = users.map((user) => user.id).whereType<int>().toList();
        //whereType<int>        تصفية للقيم ال NULL
        return users;
      } else {
        print('Error: ${response.statusCode}, ${response.body}');
        throw Exception('Failed to load Receipts');
      }
    } catch (e) {
      print('Exception: $e');
      rethrow;
    }
  }

  Future<void> BannedUser(int userId)async{
    SigninService signinService = SigninService();
    String? token = await signinService.getToken();
  String url =AppLink.Banned(userId);
  final response=await http.post(Uri.parse(url),
      body:jsonEncode({
      'status' : false,
        "userId":userId
      }),
     headers:{
      "Authorization": "Bearer $token",
       'Content-Type': 'application/json',

     });
    log('Response: ${response.body}');
    log('Response Code: ${response.statusCode}');


    if(response.statusCode == 200){
    log("User Banned Sucsessfuly");
  }else{
    throw Exception("Error Banned user");
  }


  }

  Future<void> UnBannedUser(int userId)async{
    SigninService signinService = SigninService();
    String? token = await signinService.getToken();
    String url =AppLink.unBanned(userId);
    final response=await http.post(Uri.parse(url),
        body:jsonEncode({
          'status' : true,
          "userId":userId
        }),
        headers:{
          "Authorization": "Bearer $token",
          'Content-Type': 'application/json',

        });
    if(response.statusCode == 200){
      log("User UnBanned Sucsessfuly");
    }else{
      throw Exception("Error Banned user");
    }


  }

  @override
  void onInit()async {
    super.onInit();
    getAllUsers();
    SigninService signinService = SigninService();
    String? token = await signinService.getToken();
    log("$token");
  }
}