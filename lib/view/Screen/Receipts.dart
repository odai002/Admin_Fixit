import 'package:dash_fixit/view/Screen/view_receipt.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:dash_fixit/Controller/receipts_controller.dart';
import 'Side_Bar_Layout.dart';

class ReceiptsPage extends StatelessWidget {
  const ReceiptsPage({super.key});

  @override
  Widget build(BuildContext context) {
    ReceiptsController controller = Get.put(ReceiptsController());
    return Scaffold(
      backgroundColor: const Color(0xFFF7F9FC),
      body: Row(
        children: [
          const NavigationSidebar(),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Receipts Overview',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 10), // Reduced spacing
                  Obx(() {
                    if (controller.isLoading.value) {
                      return const Center(child: CircularProgressIndicator());
                    } else if (controller.errorMessage.isNotEmpty) {
                      return Center(child: Text(controller.errorMessage.value));
                    }
                    if (controller.receipts.isEmpty) {
                      return const Center(child: Text("No data available"));
                    }
                    return  Expanded(
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: SingleChildScrollView(
                          scrollDirection: Axis.vertical,
                          child: DataTable(
                            columnSpacing: 15,
                            horizontalMargin: 10,
                            columns: const [
                              DataColumn(label: Text('Description')),
                              DataColumn(label: Text('Receipt Date')),
                              DataColumn(label: Text('Hw Name')),
                              DataColumn(label: Text('C Name')),
                              DataColumn(label: Text('C Email')),
                              DataColumn(label: Text('Hw Email')),
                              DataColumn(label: Text('Warning Duration (Days)')),
                              DataColumn(label: Text('Action')),
                            ],
                            rows: controller.receipts.map((receipt) {
                              return DataRow(cells: [
                                const DataCell(Text('Please review this receipt.')),
                                const DataCell(Text("22/7")),
                                DataCell(Text(receipt.contract.task.homeowner.username)),
                                DataCell(Text(receipt.contract.task.contractor.username)),
                                DataCell(Text(receipt.contract.task.homeowner.email)),
                                DataCell(Text(receipt.contract.task.contractor.email)),
                                DataCell(_buildWarningSection(receipt.id)),
                                DataCell(IconButton(
                                  icon:  const Icon(Icons.remove),
                                  color: Colors.red,
                                  onPressed: () async{
                                    controller.RejectReviewReceipts(receipt.id);
                                    await controller.fetchReceipts();
                                    Get.snackbar(
                                          'Success',
                                          'Warning sent successfully.',
                                          snackPosition: SnackPosition.BOTTOM,
                                          );
                                          await controller.fetchReceipts();
                                  },
                                )),
                              ]);
                            }).toList(),
                          ),
                        ),
                      ),
                    );
                  }),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildWarningSection(int id) {
    ReceiptsController controller = Get.find();
    TextEditingController warningDaysController = TextEditingController();

    return ConstrainedBox(
      constraints: const BoxConstraints(maxWidth: 400),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: warningDaysController,
              decoration: const InputDecoration(
                labelText: 'Warning Duration',
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.number,
            ),
          ),
          const SizedBox(width: 10),
          ElevatedButton(
            onPressed: () {
              String input = warningDaysController.text.trim();
              if (input.isNotEmpty) {
                int? warningDays = int.tryParse(input);
                if (warningDays != null) {
                  controller.SendWarning(id, warningDays);
                  Get.snackbar(
                    'Success',
                    'Warning sent successfully.',
                    snackPosition: SnackPosition.BOTTOM,
                  );
                } else {
                  Get.snackbar(
                    'Invalid Input',
                    'Please enter a valid number for warning days.',
                    snackPosition: SnackPosition.BOTTOM,
                  );
                }
              } else {
                Get.snackbar(
                  'Input Required',
                  'Please enter the number of warning days.',
                  snackPosition: SnackPosition.BOTTOM,
                );
              }
            },
            child: const Text('Send Warning'),
          ),
          const SizedBox(width:10,),
          // View Receipt Button
          TextButton(
            onPressed: () {
              Get.to(() => ViewReceipt(receiptId: id));
            },
            child: const Text('View Receipt'),
          ),
        ],
      ),
    );
  }
  }
