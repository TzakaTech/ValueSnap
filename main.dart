import 'package:flutter/material.dart';

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
    // Implement the logic to open settings page
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text('Settings button clicked!'),
    ));
  }

  void viewHistory(BuildContext context) {
    // Implement the logic to view snap history
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text('Snap History button clicked!'),
    ));
  }

  void snapPhoto(BuildContext context) {
    // Implement the logic to snap a photo
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text('Snap Photo button clicked!'),
    ));
  }

  void scanBarcode(BuildContext context) {
    // Implement the logic to scan a barcode
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text('Scan Barcode button clicked!'),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ValueSnap'),
        leading: IconButton(
          icon: Icon(Icons.settings),
          onPressed: () => openSettings(context),
        ),
      ),
      body: Center(
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
              icon: Icon(Icons.history),
              iconSize: 30,
              onPressed: () => viewHistory(context),
            ),
            FloatingActionButton(
              onPressed: () => snapPhoto(context),
              child: Icon(Icons.camera_alt),
            ),
            IconButton(
              icon: Icon(Icons.qr_code_scanner),
              iconSize: 30,
              onPressed: () => scanBarcode(context),
            ),
          ],
        ),
      ),
    );
  }
}
