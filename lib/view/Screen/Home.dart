import 'dart:developer';

import 'package:dash_fixit/Controller/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../Controller/receipts_controller.dart';
import '../../data/model/users.dart';
import 'Side_Bar_Layout.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  _DashboardPageState createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  final Map<String, String> rowActions = {}; // Tracks actions for each user by name

  @override
  Widget build(BuildContext context) {
    HomeController controller = Get.put(HomeController());
    ReceiptsController controller1 = Get.put(ReceiptsController());

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
                      FutureBuilder(
                        future: controller1.fetchReceipts(),
                        builder: (context, snapshot) {
                          if (snapshot.connectionState == ConnectionState.waiting) {
                            return _buildStatCard('Number of Receipts', 'Loading...', Colors.blue);
                          } else if (snapshot.hasError) {
                            return _buildStatCard('Number of Receipts', 'Error', Colors.red);
                          } else {
                            return _buildStatCard(
                              'Number of Receipts',
                              controller1.receipts.length.toString(),
                              Colors.blue,
                            );
                          }
                        },
                      ),
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
                              rows: users.map((user) => _buildDataRow(user)).toList(),
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
        margin: const EdgeInsets.symmetric(horizontal: 10),
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: const [
            BoxShadow(color: Colors.black12, blurRadius: 6, offset: Offset(0, 3)),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(fontSize: 16, color: Colors.black54),
            ),
            const SizedBox(height: 10),
            Text(
              value,
              style: TextStyle(fontSize: 24, color: color, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }

  DataRow _buildDataRow(User user) {
    return DataRow(
      cells: [
        DataCell(Text(user.username)),
        DataCell(Text(user.email)),
        DataCell(Text(user.phone)),
        DataCell(Text(user.role)),
        DataCell(_buildActionCell(user)),
      ],
    );
  }

    Widget _buildActionCell(User user) {
      HomeController controller = Get.find<HomeController>();

      return PopupMenuButton<String>(
        onSelected: (value) async {
          try {
            if (value == 'Banned') {
              await controller.banUser(user.id!);
              setState(() {
                user.is_banned = true;
              });
            } else if (value == 'Un Banned') {
              await controller.unbanUser(user.id!);
              setState(() {
                user.is_banned = false;
              });
            }
          } catch (e) {
            log('Error updating user status: $e');
          }
        },
        itemBuilder: (BuildContext context) {
          return user.is_banned == true
              ? [
            const PopupMenuItem<String>(
              value: 'Un Banned',
              child: Text('Unbanned'),
            ),
          ]
              : [
            const PopupMenuItem<String>(
              value: 'Banned',
              child: Text('Banned'),
            ),
          ];
        },
      );
    }
  }

