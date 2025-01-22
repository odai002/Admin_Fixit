import 'package:flutter/material.dart';

class NotificationsPage extends StatelessWidget {
  final List<Map<String, dynamic>> notifications = [
    {
      'userPicture': 'https://via.placeholder.com/150',
      'userName': 'John Doe',
      'userType': 'Contractor',
      'category': 'Electrician',
      'notificationInfo': 'Please review this receipt.',
      'isReceiptReview': true,
    },
    {
      'userPicture': 'https://via.placeholder.com/150',
      'userName': 'Jane Smith',
      'userType': 'Homeowner',
      'category': null,
      'notificationInfo': 'You have a new task assigned.',
      'isReceiptReview': false,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: notifications.length,
      itemBuilder: (context, index) {
        final notification = notifications[index];
        return Card(
          margin: EdgeInsets.symmetric(vertical: 8),
          child: Padding(
            padding: EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    CircleAvatar(
                      backgroundImage: NetworkImage(notification['userPicture']),
                    ),
                    SizedBox(width: 16),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          notification['userName'],
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Text(
                          notification['userType'] +
                              (notification['category'] != null
                                  ? ' (${notification['category']})'
                                  : ''),
                          style: TextStyle(color: Colors.grey),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                Text(notification['notificationInfo']),
                if (notification['isReceiptReview'])
                  TextButton(
                    onPressed: () {
                      // Navigate to receipt page
                    },
                    child: Text('View Receipt'),
                  ),
              ],
            ),
          ),
        );
      },
    );
  }
}
