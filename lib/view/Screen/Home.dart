import 'package:flutter/material.dart';
import 'Side_Bar_Layout.dart';

class DashboardPage extends StatefulWidget {
  @override
  _DashboardPageState createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  final Map<String, String> _rowActions = {}; // Tracks actions for each user by name

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF7F9FC),
      body: Row(
        children: [
          NavigationSidebar(),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(40.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Dashboard Overview',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _buildStatCard('Number of Receipts', '120', Colors.blue),
                      _buildStatCard('Number of Users', '45', Colors.green),
                      _buildStatCard('Contracts Done', '30', Colors.orange),
                    ],
                  ),
                  SizedBox(height: 20),
                  Text(
                    'Users List',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 10),
                  Expanded(
                    child: Container(
                      width: double.infinity,
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
                          columnSpacing: 15,
                          horizontalMargin: 10,
                          columns: [
                            DataColumn(label: Text('Name')),
                            DataColumn(label: Text('Email')),
                            DataColumn(label: Text('Phone Number')),
                            DataColumn(label: Text('Role')),
                            DataColumn(label: Text('Actions')),
                          ],
                          rows: [
                            _buildDataRow('John Doe', 'john.doe@example.com', '123-456-7890', 'Contractor'),
                            _buildDataRow('Jane Smith', 'jane.smith@example.com', '987-654-3210', 'Homeowner'),
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

  Widget _buildStatCard(String title, String value, Color color) {
    return Expanded(
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 10),
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(color: Colors.black12, blurRadius: 6, offset: Offset(0, 3)),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(fontSize: 16, color: Colors.black54),
            ),
            SizedBox(height: 10),
            Text(
              value,
              style: TextStyle(fontSize: 24, color: color, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }

  DataRow _buildDataRow(String name, String email, String phone, String role) {
    return DataRow(
      cells: [
        DataCell(Text(name)),
        DataCell(Text(email)),
        DataCell(Text(phone)),
        DataCell(Text(role)),
        DataCell(_buildActionCell(name)),
      ],
    );
  }

  Widget _buildActionCell(String name) {
    String? action = _rowActions[name]; // Get the current action for this row

    if (action == 'Approve') {
      return Icon(Icons.check_circle, color: Colors.green);
    } else if (action == 'Deny') {
      return Icon(Icons.cancel, color: Colors.red);
    } else {
      return PopupMenuButton<String>(
        onSelected: (value) {
          setState(() {
            _rowActions[name] = value; // Update the action for this row
          });
        },
        itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
          PopupMenuItem<String>(
            value: 'Approve',
            child: Text('Approve'),
          ),
          PopupMenuItem<String>(
            value: 'Deny',
            child: Text('Deny'),
          ),
        ],
      );
    }
  }
}
