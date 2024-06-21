import 'package:flutter/material.dart';
import 'history_page.dart'; // Import the HistoryPage
import 'settings_page.dart'; // Import the SettingsPage
import 'scan_barcode_page.dart'; // Import the ScanBarcodePage

void main() {
  runApp(ValueSnapApp());
}

class ValueSnapApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ValueSnap',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MainPage(),
    );
  }
}

class MainPage extends StatelessWidget {
  void openSettings(BuildContext context) {
    // Navigate to SettingsPage
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => SettingsPage()),
    );
  }

  void viewHistory(BuildContext context) {
    // Navigate to HistoryPage
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => HistoryPage()),
    );
  }

  void snapPhoto(BuildContext context) {
    // Implement the logic to snap a photo
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
      content: Text('Snap Photo button clicked!'),
    ));
  }

  void scanBarcode(BuildContext context) {
    // Navigate to ScanBarcodePage
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => ScanBarcodePage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ValueSnap'),
        leading: IconButton(
          icon: const Icon(Icons.settings),
          onPressed: () => openSettings(context),
        ),
      ),
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Welcome to ValueSnap',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            Text(
              'Discover the true worth of your possessions.',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 20),
            // Additional content can go here
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            IconButton(
              icon: const Icon(Icons.history),
              iconSize: 30,
              onPressed: () => viewHistory(context),
            ),
            FloatingActionButton(
              onPressed: () => snapPhoto(context),
              child: const Icon(Icons.camera_alt),
            ),
            IconButton(
              icon: const Icon(Icons.qr_code_scanner),
              iconSize: 30,
              onPressed: () => scanBarcode(context),
            ),
          ],
        ),
      ),
    );
  }
}
