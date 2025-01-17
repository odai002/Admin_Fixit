import 'package:flutter/material.dart';
import 'Home.dart';
import 'Receipts.dart';

class NavigationSidebar extends StatelessWidget {
  const NavigationSidebar({super.key});

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
            child: const Row(
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
              ],
            ),
          ),
        ],
      ),
    );
  }
}
