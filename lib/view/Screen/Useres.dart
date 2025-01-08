import 'package:flutter/material.dart';

class UserPage extends StatelessWidget {
  final List<Map<String, String>> users = List.generate(
    20,
        (index) => {
      'Name': 'User $index',
      'Email': 'user$index@example.com',
      'Phone': '+123456789$index',
    },
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF7942C1),
        title: const Text('Users'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: ConstrainedBox(
            constraints: const BoxConstraints(minWidth: 800),
            child: DataTable(
              columnSpacing: 16,
              columns: const [
                DataColumn(label: Text('Name')),
                DataColumn(label: Text('Email')),
                DataColumn(label: Text('Phone')),
              ],
              rows: users.map((user) {
                return DataRow(
                  cells: [
                    DataCell(Text(user['Name']!)),
                    DataCell(Text(user['Email']!)),
                    DataCell(Text(user['Phone']!)),
                  ],
                );
              }).toList(),
            ),
          ),
        ),
      ),
    );
  }
}