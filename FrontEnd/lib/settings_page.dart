import 'package:flutter/material.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            ListTile(
              leading: const Icon(Icons.account_circle),
              title: const Text('Account'),
              onTap: () {
                // Implement the logic for Account settings
                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                  content: Text('Account settings clicked!'),
                ));
              },
            ),
            ListTile(
              leading: const Icon(Icons.notifications),
              title: const Text('Notifications'),
              onTap: () {
                // Implement the logic for Notifications settings
                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                  content: Text('Notifications settings clicked!'),
                ));
              },
            ),
            ListTile(
              leading: const Icon(Icons.security),
              title: const Text('Privacy'),
              onTap: () {
                // Implement the logic for Privacy settings
                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
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
