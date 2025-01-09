import 'package:flutter/material.dart';
import 'Side_Bar_Layout.dart';

class ReceiptsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF7F9FC),
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
                    'Receipts Overview',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 10), // Reduced spacing
                  Expanded(
                    child: SingleChildScrollView(
                      child: DataTable(
                        columnSpacing: 15,
                        horizontalMargin: 10,
                        columns: [
                          DataColumn(label: Text('Description')),
                          DataColumn(label: Text('Receipt Date')),
                          DataColumn(label: Text('Hw Name')),
                          DataColumn(label: Text('C Name')),
                          DataColumn(label: Text('C Email')),
                          DataColumn(label: Text('Hw Email')),
                          DataColumn(label: Text('Warning Duration(Days)')),
                          DataColumn(label: Text('Action')), // Add Action column for Minus icon
                        ],
                        rows: [
                          DataRow(cells: [
                            DataCell(Text('Please review this receipt.')),
                            DataCell(Text('2023-12-01')),
                            DataCell(Text('John Doe')),
                            DataCell(Text('Jane Smith')),
                            DataCell(Text('jane.smith@example.com')),
                            DataCell(Text('john.doe@example.com')),
                            DataCell(_buildWarningSection()),
                            DataCell(IconButton(
                              icon: Icon(Icons.remove), // Minus icon
                              color: Colors.red, // Set icon color to red
                              onPressed: () {
                                // Handle the "minus" action (deleting or disapproving)
                                print('Disapproved John Doe receipt');
                              },
                            )),
                          ]),
                          DataRow(cells: [
                            DataCell(Text('Please review this receipt.')),
                            DataCell(Text('2023-12-02')),
                            DataCell(Text('Alice Johnson')),
                            DataCell(Text('Bob Brown')),
                            DataCell(Text('bob.brown@example.com')),
                            DataCell(Text('alice.johnson@example.com')),
                            DataCell(_buildWarningSection()),
                            DataCell(IconButton(
                              icon: Icon(Icons.remove), // Minus icon
                              color: Colors.red, // Set icon color to red
                              onPressed: () {
                                // Handle the "minus" action (deleting or disapproving)
                                print('Disapproved Alice Johnson receipt');
                              },
                            )),
                          ]),
                        ],
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

  // Updated function to add "View Receipt" button next to "Send Warning" button
  Widget _buildWarningSection() {
    return ConstrainedBox(
      constraints: BoxConstraints(maxWidth: 400), // Set width constraint
      child: Row(
        children: [
          // Warning Duration TextField
          Expanded(
            child: TextField(
              decoration: InputDecoration(
                labelText: 'Warning Duration',
                border: OutlineInputBorder(),
              ),
            ),
          ),
          SizedBox(width: 10), // Space between text field and buttons

          // Send Warning Button
          ElevatedButton(
            onPressed: () {},
            child: Text('Send Warning'),
          ),
          SizedBox(width: 10), // Space between buttons

          // View Receipt Button
          TextButton(
            onPressed: () {
              // Add logic to view receipt
            },
            child: Text('View Receipt'),
          ),
        ],
      ),
    );
  }
}
