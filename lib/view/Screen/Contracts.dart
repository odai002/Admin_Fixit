import 'package:flutter/material.dart';

class ContractsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 5,
      itemBuilder: (context, index) {
        return Card(
          margin: EdgeInsets.only(bottom: 16),
          child: ListTile(
            leading: Icon(Icons.description, color: Color(0xFF7942C1)),
            title: Text('Contract Title $index'),
            subtitle: Text('Contract Description $index'),
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
