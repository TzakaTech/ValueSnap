import 'package:flutter/material.dart';

class ScanBarcodePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Scan Barcode'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Scan a barcode to get started.',
              style: TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Implement the logic to scan a barcode
                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                  content: Text('Scan barcode button clicked!'),
                ));
              },
              child: const Text('Start Scanning'),
            ),
          ],
        ),
      ),
    );
  }
}
