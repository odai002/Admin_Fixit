import 'package:flutter/material.dart';

class TasksPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 5, // Replace with dynamic task data
      itemBuilder: (context, index) {
        return Card(
          margin: EdgeInsets.only(bottom: 16),
          child: ListTile(
            leading: Icon(Icons.task, color: Color(0xFF7942C1)),
            title: Text('Task Title $index'),
            subtitle: Text('Task Description $index'),
            trailing: ElevatedButton(
              onPressed: () {},
              child: Text('Details', style: TextStyle(fontSize: 10)),
            ),
          ),
        );
      },
    );
  }
}
