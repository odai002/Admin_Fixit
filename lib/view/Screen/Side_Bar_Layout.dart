import 'package:dash_fixit/view/Screen/sign_in.dart';
import 'package:flutter/material.dart';
import '../../main.dart';
import 'Home.dart';
import 'Contracts.dart';
import 'Notifications.dart';
import 'Receipt_Crude.dart';
import 'Receipts.dart';
import 'Tasks_Mangement.dart';
import 'Useres.dart';

class NavigationSidebar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 250,
      color: Colors.white,
      child: Column(
        children: [
          // Header with Title and Back Button
          Container(
            padding: EdgeInsets.only(left: 30.0, top: 20.0),
            color: Colors.white,
            child: Row(
              children: [
                Text(
                  'Fixit Dashboard',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),

          // Search Widget
          Padding(
            padding: EdgeInsets.all(20.0),
            child: Material(
              borderRadius: BorderRadius.circular(12.0),
              elevation: 2,
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Search...',
                  prefixIcon: Icon(Icons.search, color: Colors.grey),
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12.0),
                    borderSide: BorderSide.none,
                  ),
                  contentPadding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 0.0),
                ),
              ),
            ),
          ),

          // Sidebar List
          Expanded(
            child: ListView(
              padding: EdgeInsets.zero,
              children: [
                ListTile(
                  leading: Icon(Icons.dashboard),
                  title: Text('Dashboard'),
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => DashboardPage()),
                  ),
                ),
                ListTile(
                  leading: Icon(Icons.receipt_long),
                  title: Text('Receipts'),
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ReceiptsPage()),
                  ),
                ),
                ListTile(
                  leading: Icon(Icons.ad_units_outlined),
                  title: Text('Contracts'),
                  onTap: () {},
                ),
                ListTile(
                  leading: Icon(Icons.task),
                  title: Text('Tasks'),
                  onTap: () {},
                ),
                ListTile(
                  leading: Icon(Icons.person),
                  title: Text('Profile'),
                  onTap: () {},
                ),
                ListTile(
                  leading: Icon(Icons.settings),
                  title: Text('Settings'),
                  onTap: () {},
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
