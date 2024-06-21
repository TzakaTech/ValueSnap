import 'package:flutter/material.dart';

class HistoryPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Snap History'),
      ),
      body: ListView.builder(
        itemCount: 10, // Replace with actual item count
        itemBuilder: (context, index) {
          return ListTile(
            leading: Icon(Icons.image),
            title: Text('Item ${index + 1}'),
            subtitle: Text('Estimated Value: \$${(index + 1) * 100}'),
            onTap: () {
              // Implement the logic to view item details
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: Text('Item ${index + 1} clicked!'),
              ));
            },
          );
        },
      ),
    );
  }
}
