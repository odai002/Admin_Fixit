import 'package:dash_fixit/data/Remotly/API_Recipts.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../data/model/receipts.dart';

class ReceiptsController extends GetxController {
  RxList<Receipts> receipts = <Receipts>[].obs;
  RxBool isLoading = false.obs;
  RxString errorMessage = ''.obs;
  int get totalReceiptsCount => receipts.length;

  int? id;
  int? warningDays;
  @override
  void onInit() {
    super.onInit();
    fetchReceipts();
  }

  Future<void> fetchReceipts() async {
    isLoading.value = true;
    errorMessage.value = '';
    try {
      ApiRecipts apiRecipts = ApiRecipts();
      final fetchedReceipts = await apiRecipts.getAllReceipts();
      receipts.assignAll(fetchedReceipts);
    } catch (e) {
      errorMessage.value = 'Error fetching receipts: $e';
      print(errorMessage.value);
    } finally {
      isLoading.value = false;
    }
  }


  void SendWarning(int id, int warningDays) async {
    try {
      ApiRecipts apiRecipts = ApiRecipts();

      final response = await apiRecipts.sendWarning(id, warningDays);
      Get.snackbar(
        'Success',
        'Warning sent successfully for receipt',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.green
      );
    } catch (e) {
      Get.snackbar(
        'Error',
        'Failed to send warning: $e',
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  void RejectReviewReceipts(int id)async{
    try{
    ApiRecipts apiRecipts = ApiRecipts();

    final response = await apiRecipts.RejectReviewReceipts(id);
    Get.snackbar(
        'Success',
        'Reject successfully for receipt',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.green
    );
    } catch (e) {
      Get.snackbar(
        'Error',
        'Failed to Reject receipt: $e',
        snackPosition: SnackPosition.BOTTOM,
      );
    }

  }

}
