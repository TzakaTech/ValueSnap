import 'dart:io';
import 'package:http/http.dart' as http;
import 'dart:convert';

class BackendService {
  // Base URL for the backend
  static const String baseUrl = 'https://your-backend-url.com';

  // Method to process the image
  static Future<Map<String, dynamic>> processImage(File imageFile) async {
    final uri = Uri.parse('$baseUrl/process_image');
    final request = http.MultipartRequest('POST', uri)
      ..files.add(await http.MultipartFile.fromPath('image', imageFile.path));

    try {
      final streamedResponse = await request.send();
      final response = await http.Response.fromStream(streamedResponse);

      if (response.statusCode == 200) {
        final jsonResponse = json.decode(response.body);
        return {
          'objectName': jsonResponse['objectName'],
          'estimatedValue': jsonResponse['estimatedValue'],
          'description': jsonResponse['description'],
        };
      } else {
        return {'error': 'Failed to process image: ${response.statusCode}'};
      }
    } catch (e) {
      return {'error': 'Failed to connect to the server: $e'};
    }
  }

  // Method to fetch price history
  static Future<Map<String, dynamic>> getPriceHistory(String objectName) async {
    final uri = Uri.parse('$baseUrl/price_history?object=$objectName');

    try {
      final response = await http.get(uri);

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

  // Method to save a result to the user's history
  static Future<bool> saveToHistory(Map<String, dynamic> result) async {
    final uri = Uri.parse('$baseUrl/save_history');

    try {
      final response = await http.post(
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
