// lib/backend/backend_service.dart

import 'dart:io';
import 'package:http/http.dart' as http;
import 'dart:convert';

class BackendService {
  // Update this URL to where your backend is hosted
  static const String baseUrl = 'https://your-backend-url.com';

  // Method to process the image
  static Future<Map<String, dynamic>> processImage(File imageFile) async {
    var uri = Uri.parse('$baseUrl/process_image');
    var request = http.MultipartRequest('POST', uri);

    // Add the image file to the request
    request.files
        .add(await http.MultipartFile.fromPath('image', imageFile.path));

    try {
      var streamedResponse = await request.send();
      var response = await http.Response.fromStream(streamedResponse);

      if (response.statusCode == 200) {
        // Successfully got a response from the server
        var jsonResponse = json.decode(response.body);
        return {
          'objectName': jsonResponse['objectName'],
          'estimatedValue': jsonResponse['estimatedValue'],
          'description': jsonResponse['description'],
        };
      } else {
        // Server responded with an error
        return {'error': 'Failed to process image: ${response.statusCode}'};
      }
    } catch (e) {
      // Network or other error occurred
      return {'error': 'Failed to connect to the server: $e'};
    }
  }

  // You can add more methods here for other API endpoints if needed
  // For example, a method to fetch price history:

  static Future<Map<String, dynamic>> getPriceHistory(String objectName) async {
    var uri = Uri.parse('$baseUrl/price_history?object=$objectName');

    try {
      var response = await http.get(uri);

      if (response.statusCode == 200) {
        return json.decode(response.body);
      } else {
        return {
          'error': 'Failed to fetch price history: ${response.statusCode}'
        };
      }
    } catch (e) {
      return {'error': 'Failed to connect to the server: $e'};
    }
  }

  // Method to save a result to user's history
  static Future<bool> saveToHistory(Map<String, dynamic> result) async {
    var uri = Uri.parse('$baseUrl/save_history');

    try {
      var response = await http.post(
        uri,
        headers: {'Content-Type': 'application/json'},
        body: json.encode(result),
      );

      return response.statusCode == 200;
    } catch (e) {
      print('Failed to save to history: $e');
      return false;
    }
  }
}
