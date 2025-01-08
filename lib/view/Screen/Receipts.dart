import 'package:flutter/material.dart';

class ReceiptsPage extends StatelessWidget {
  final List<Map<String, dynamic>> receipts = List.generate(10, (index) {
    return {
      'name': 'User Name $index',
      'email': 'user$index@example.com',
      'phone': '+1234567890',
      'requestDescription': 'Please review this receipt',
    };
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: receipts.length,
      itemBuilder: (context, index) {
        final receipt = receipts[index];
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Card(
              margin: EdgeInsets.symmetric(vertical: 8),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(receipt['name'], style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                          Text('Email: ${receipt['email']}', style: TextStyle(fontSize: 16)),
                          Text('Phone: ${receipt['phone']}', style: TextStyle(fontSize: 16)),
                          Text('Request: ${receipt['requestDescription']}', style: TextStyle(fontSize: 14)),
                        ],
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(backgroundColor: Color(0xFF7942C1)),
                      child: Text('View Receipt', style: TextStyle(fontSize: 14, color: Colors.white)),
                    ),
                  ],
                ),
              ),
            ),
            Card(
              margin: EdgeInsets.symmetric(vertical: 8),
              color: Colors.grey[100],
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  children: [
                    Expanded(
                      child: TextField(
                        decoration: InputDecoration(
                          labelText: 'Warning Duration (in days)',
                          border: OutlineInputBorder(),
                        ),
                      ),
                    ),
                    SizedBox(width: 16),
                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(backgroundColor: Color(0xFF7942C1)),
                      child: Text('Send Warning', style: TextStyle(fontSize: 14, color: Colors.white)),
                    ),
                  ],
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
