import 'package:flutter/material.dart';

class SettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            ListTile(
              leading: Icon(Icons.account_circle),
              title: Text('Account'),
              onTap: () {
                // Implement the logic for Account settings
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: Text('Account settings clicked!'),
                ));
              },
            ),
            ListTile(
              leading: Icon(Icons.notifications),
              title: Text('Notifications'),
              onTap: () {
                // Implement the logic for Notifications settings
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: Text('Notifications settings clicked!'),
                ));
              },
            ),
            ListTile(
              leading: Icon(Icons.security),
              title: Text('Privacy'),
              onTap: () {
                // Implement the logic for Privacy settings
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: Text('Privacy settings clicked!'),
                ));
              },
            ),
          ],
        ),
      ),
    );
  }
}
