import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import 'history_page.dart'; // Import the HistoryPage
import 'settings_page.dart'; // Import the SettingsPage
import 'scan_barcode_page.dart'; // Import the ScanBarcodePage
import 'result_page.dart'; // Import the ResultPage

void main() {
  runApp(const ValueSnapApp());
}

class ValueSnapApp extends StatelessWidget {
  const ValueSnapApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ValueSnap',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MainPage(),
    );
  }
}

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  void openSettings(BuildContext context) {
    // Navigate to SettingsPage
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const SettingsPage()),
    );
  }

  void viewHistory(BuildContext context) {
    // Navigate to HistoryPage
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const HistoryPage()),
    );
  }

  void snapPhoto(BuildContext context) async {
    // Directly navigate to the ResultPage
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const ResultPage(
          objectName: "Sample Object",
          estimatedValue: "100",
          description: "This is a sample description.",
        ),
      ),
    );
  }

  void scanBarcode(BuildContext context) {
    // Navigate to ScanBarcodePage
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const ScanBarcodePage()),
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
