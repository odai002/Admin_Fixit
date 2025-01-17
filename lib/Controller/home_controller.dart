import 'dart:convert';
import 'dart:developer';

import 'package:dash_fixit/Core/constant/link_api.dart';
import 'package:dash_fixit/data/model/users.dart';
import 'package:dash_fixit/data/signin_service.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;


class HomeController extends GetxController{
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
        final List<dynamic> data = jsonResponse['data']; // الوصول إلى قائمة البيانات
        return data.map((userJson) => User.fromJson(userJson)).toList();
      } else {
        print('Error: ${response.statusCode}, ${response.body}');
        throw Exception('Failed to load users');
      }
    } catch (e) {
      print('Exception: $e');
      rethrow;
    }
  }
@override
  void onInit() {
    super.onInit();
    getAllUsers();
  }
}