import 'package:flutter/material.dart';

class DashboardPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF7942C1),
        title: const Text('Dashboard'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Welcome to the Dashboard',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              const Text(
                'Here is a summary of the system’s activity and quick access to essential actions.',
                style: TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 16),
              // Summary Cards
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SummaryCard(
                    title: 'Total Users',
                    value: '120',
                    color: Colors.blue,
                  ),
                  SummaryCard(
                    title: 'Active Tasks',
                    value: '45',
                    color: Colors.orange,
                  ),
                  SummaryCard(
                    title: 'Completed Tasks',
                    value: '320',
                    color: Colors.green,
                  ),
                  SummaryCard(
                    title: 'Warnings Issued',
                    value: '8',
                    color: Colors.red,
                  ),
                ],
              ),
              const SizedBox(height: 24),
              // Recent Activities
              const Text(
                'Recent Activities',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              RecentActivityCard(
                title: 'Task Completed',
                description: 'User John Doe completed task #23',
                timestamp: '2 hours ago',
              ),
              RecentActivityCard(
                title: 'New Warning',
                description: 'Warning issued to user Jane Smith.',
                timestamp: '4 hours ago',
              ),
              RecentActivityCard(
                title: 'Task Created',
                description: 'User Mark Lee created a new task.',
                timestamp: '1 day ago',
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class SummaryCard extends StatelessWidget {
  final String title;
  final String value;
  final Color color;

  const SummaryCard({
    required this.title,
    required this.value,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 80,
      height: 100,
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(8),
      ),
      padding: const EdgeInsets.all(12.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            value,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: color,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            title,
            style: const TextStyle(fontSize: 14),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}

class RecentActivityCard extends StatelessWidget {
  final String title;
  final String description;
  final String timestamp;

  const RecentActivityCard({
    required this.title,
    required this.description,
    required this.timestamp,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  Text(description, style: const TextStyle(fontSize: 14)),
                ],
              ),
            ),
            Text(timestamp, style: const TextStyle(fontSize: 12, color: Colors.grey)),
          ],
        ),
      ),
    );
  }
}