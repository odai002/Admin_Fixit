import 'package:flutter/material.dart';
import 'Admin_Panel.dart';
import 'Contracts.dart';
import 'Notifications.dart';
import 'Profile.dart';
import 'Receipt_Crude.dart';
import 'Receipts.dart';
import 'Tasks_Mangement.dart';
import 'Useres.dart';


class SidebarLayout extends StatefulWidget {
  @override
  _SidebarLayoutState createState() => _SidebarLayoutState();
}

class _SidebarLayoutState extends State<SidebarLayout> {
  Widget _selectedPage = DashboardPage(); // Default page is Dashboard

  final List<Map<String, dynamic>> _menuItems = [
    {'title': 'Dashboard', 'icon': Icons.dashboard, 'page': DashboardPage()},
    {'title': 'Tasks', 'icon': Icons.task, 'page': TasksPage()},
    {'title': 'Contracts', 'icon': Icons.description, 'page': ContractsPage()},
    {'title': 'Notifications', 'icon': Icons.notifications, 'page': NotificationsPage()},
    {'title': 'Profile', 'icon': Icons.person, 'page': ProfilePage()},
    {'title': 'Receipts', 'icon': Icons.receipt_long, 'page': ReceiptsPage()},
    {'title': 'Users', 'icon': Icons.group, 'page': UserPage()},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          // Sidebar
          Container(
            width: 250,
            color: Color(0xFF7942C1),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Sidebar Header
                Container(
                  height: 100,
                  padding: EdgeInsets.all(20),
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'FixIt Dashboard',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Divider(color: Colors.white54),
                // Sidebar Menu
                Expanded(
                  child: ListView.builder(
                    itemCount: _menuItems.length,
                    itemBuilder: (context, index) {
                      final item = _menuItems[index];
                      return ListTile(
                        leading: Icon(
                          item['icon'],
                          color: Colors.white,
                          size: 16,
                        ),
                        title: Text(
                          item['title'],
                          style: TextStyle(color: Colors.white, fontSize: 12),
                        ),
                        onTap: () {
                          setState(() {
                            _selectedPage = item['page'];
                          });
                        },
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
          // Content Panel
          Expanded(
            child: Container(
              color: Colors.grey[200],
              padding: EdgeInsets.all(16),
              child: _selectedPage,
            ),
          ),
        ],
      ),
    );
  }
}
