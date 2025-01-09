import 'package:flutter/material.dart';
import 'Side_Bar_Layout.dart';

class UsersPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF7F9FC),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: Text(
          'Users',
          style: TextStyle(color: Colors.black, fontSize: 22, fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.search, color: Colors.black),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.filter_list, color: Colors.black),
            onPressed: () {},
          ),
        ],
      ),
      body: Row(
        children: [
          NavigationSidebar(),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'User Management',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 20),
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.all(15),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(color: Colors.black12, blurRadius: 6, offset: Offset(0, 3)),
                        ],
                      ),
                      child: SingleChildScrollView(
                        child: DataTable(
                          columnSpacing: 20,
                          horizontalMargin: 10,
                          columns: [
                            DataColumn(label: Text('Name')),
                            DataColumn(label: Text('Email')),
                            DataColumn(label: Text('Role')),
                            DataColumn(label: Text('Status')),
                          ],
                          rows: [
                            DataRow(cells: [
                              DataCell(Text('John Doe')),
                              DataCell(Text('john.doe@example.com')),
                              DataCell(Text('Admin')),
                              DataCell(Text('Active')),
                            ]),
                            DataRow(cells: [
                              DataCell(Text('Jane Smith')),
                              DataCell(Text('jane.smith@example.com')),
                              DataCell(Text('User')),
                              DataCell(Text('Inactive')),
                            ]),
                            DataRow(cells: [
                              DataCell(Text('Alex Johnson')),
                              DataCell(Text('alex.johnson@example.com')),
                              DataCell(Text('User')),
                              DataCell(Text('Active')),
                            ]),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
