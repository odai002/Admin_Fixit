import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart'as  http;
import '../../Core/constant/link_api.dart';
import '../model/receipts.dart';
import '../signin_service.dart';

class ApiRecipts {
  Future<List<Receipts>> getAllReceipts() async {
    try {
      SigninService signinService = SigninService();
      String? token = await signinService.getToken();
      String url = AppLink.getAllReceipt;

      final response = await http.get(Uri.parse(url), headers: {
        "Authorization": "Bearer $token",
        'Content-Type': 'application/json',
      });
      log("${response.statusCode}");

      if (response.statusCode == 200) {
        final Map<String, dynamic> jsonResponse = jsonDecode(response.body);
        final List<dynamic> data = jsonResponse['data'];
        final receipts = data.map((receiptJson) =>
            Receipts.fromJson(receiptJson)).toList();
        return receipts;
      } else {
        throw Exception('Failed to load receipts');
      }
    } catch (e) {
      print('Exception: $e');
      rethrow;
    }
  }

  Future<Receipts> getReceiptById(int id) async {
    try {
      SigninService signinService = SigninService();
      String? token = await signinService.getToken();
      String url = AppLink.getReceiptbyId(id);
      final response = await http.get(Uri.parse(url), headers: {
        "Authorization": "Bearer $token",
        'Content-Type': 'application/json',
      });
      if (response.statusCode == 200) {
        final jsonResponse = jsonDecode(response.body);
        return Receipts.fromJson(jsonResponse['data']);
      } else {
        throw Exception('Failed to load receipt details');
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<void> sendWarning(int receiptId,int warningDays)async{
    SigninService signinService = SigninService();
    String? token = await signinService.getToken();
    String url = AppLink.sendWarning(receiptId);
    final response=await http.post(Uri.parse(url),
        body:jsonEncode({
        'warning_days' : warningDays ,
        'id' : receiptId
        }),
        headers:{
        "Authorization": "Bearer $token",
        'Content-Type': 'application/json',});
    log("Response.statusCode:${response.statusCode}");
    log("Body:${response.body}");

    if(response.statusCode == 200){
      print("contractor add warning");
    }

  }

  Future<void> RejectReviewReceipts(int receiptId)async{
    SigninService signinService = SigninService();
    String? token = await signinService.getToken();
    String url = AppLink.rejectReceiptReview(receiptId);

    final response=await http.post(Uri.parse(url),
        body:jsonEncode({
          'id' : receiptId
        }),
        headers:{
          "Authorization": "Bearer $token",
          'Content-Type': 'application/json',});

    if(response.statusCode == 200){
      print("Reject Receipts sucssesfuly");
    }
  }

}