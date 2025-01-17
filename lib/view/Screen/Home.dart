import 'package:dash_fixit/Controller/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../data/model/users.dart';
import 'Side_Bar_Layout.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  _DashboardPageState createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  final Map<String, String> _rowActions = {}; // Tracks actions for each user by name

  @override
  Widget build(BuildContext context) {
    HomeController controller = Get.put(HomeController());
    return Scaffold(
      backgroundColor: const Color(0xFFF7F9FC),
      body: Row(
        children: [
          const NavigationSidebar(),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(40.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Dashboard Overview',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _buildStatCard('Number of Receipts', '120', Colors.blue),
                      FutureBuilder<List<User>>(
                        future: controller.getAllUsers(),
                        builder: (context, snapshot) {
                          if (snapshot.connectionState == ConnectionState.waiting) {
                            return _buildStatCard('Number of Users', 'Loading...', Colors.green);
                          } else if (snapshot.hasError) {
                            return _buildStatCard('Number of Users', 'Error', Colors.red);
                          } else if (snapshot.hasData) {
                            int userCount = snapshot.data!.length;
                            return _buildStatCard('Number of Users', '$userCount', Colors.green);
                          } else {
                            return _buildStatCard('Number of Users', '0', Colors.grey);
                          }
                        },
                      ),_buildStatCard('Contracts Done', '30', Colors.orange),
                    ],
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    'Users List',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 10),
                  Expanded(
                    child: FutureBuilder<List<User>>(
                      future: controller.getAllUsers(),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState == ConnectionState.waiting) {
                          return const Center(child: CircularProgressIndicator());
                        } else if (snapshot.hasError) {
                          return Center(child: Text('Error: ${snapshot.error}'));
                        } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                          return const Center(child: Text('No users found.'));
                        }

                        final users = snapshot.data!;

                        return Container(
                          width: double.infinity,
                          padding: const EdgeInsets.all(15),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: const [
                              BoxShadow(color: Colors.black12, blurRadius: 6, offset: Offset(0, 3)),
                            ],
                          ),
                          child: SingleChildScrollView(
                            child: DataTable(
                              columnSpacing: 15,
                              horizontalMargin: 10,
                              columns: const [
                                DataColumn(label: Text('Name')),
                                DataColumn(label: Text('Email')),
                                DataColumn(label: Text('Phone Number')),
                                DataColumn(label: Text('Role')),
                                DataColumn(label: Text('Actions')),
                              ],
                              rows: users.map((user) => _buildDataRow(user,"")).toList(), // إنشاء الصفوف ديناميكياً
                            ),
                          ),
                        );
                      },
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

  DataRow _buildDataRow(User user,String name) {
    return DataRow(
      cells: [
        DataCell(Text(user.username)),
        DataCell(Text(user.email)),
        DataCell(Text(user.phone)),
        DataCell(Text(user.role)),
        DataCell(_buildActionCell(name)),
      ],
    );
  }

  Widget _buildActionCell(String name) {
    String? action = _rowActions[name]; // Get the current action for this row

    if (action == 'Banned') {
      return const Icon(Icons.check_circle, color: Colors.green);
    } else if (action == 'Un Banned') {
      return const Icon(Icons.cancel, color: Colors.red);
    } else {
      return PopupMenuButton<String>(
        onSelected: (value) {
          setState(() {
            _rowActions[name] = value; // Update the action for this row
          });
        },
        itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
          const PopupMenuItem<String>(
            value: 'Banned',
            child: Text('Banned'),
          ),
          const PopupMenuItem<String>(
            value: 'Un Banned',
            child: Text('Un Banned'),
          ),
        ],
      );
    }
  }
}
