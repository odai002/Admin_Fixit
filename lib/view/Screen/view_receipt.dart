import 'package:flutter/material.dart';
import '../../data/Remotly/API_Recipts.dart';
import '../../data/model/receipts.dart';


class ViewReceipt extends StatelessWidget {
  final int receiptId;

  const ViewReceipt({super.key, required this.receiptId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Receipt Details'),
      ),
      body: FutureBuilder<Receipts>(
        future: ApiRecipts().getReceiptById(receiptId),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData) {
            return const Center(child: Text('No details available.'));
          } else {
            final receipt = snapshot.data!;

            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Payment Date: ${receipt.contract.paymentDate}', style: const TextStyle(fontSize: 20)),
                  const SizedBox(height: 10),
                  Text('Payment End Date: ${receipt.contract.endDate}', style: const TextStyle(fontSize: 20)),
                  const SizedBox(height: 10),
                  Text('Task Title: ${receipt.contract.task.title}', style: const TextStyle(fontSize: 16)),
                  Text('Task Description: \$${receipt.contract.task.description}', style: const TextStyle(fontSize: 16)),
                  Text('Task Price: ${receipt.contract.price}', style: const TextStyle(fontSize: 16)),
                  const SizedBox(height: 20),
                   Text('Task Done Price: ${receipt.amount}', style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  Text('Task Location: ${receipt.contract.task.country} / ${receipt.contract.task.city}', style: const TextStyle(fontSize: 16)),
                  Text('Task Street: \$${receipt.contract.task.location}', style: const TextStyle(fontSize: 16)),
                  Text('End Date: ${receipt.contract.endDate}', style: const TextStyle(fontSize: 16)),
                ],
              ),
            );
          }
        },
      ),
    );
  }
}
