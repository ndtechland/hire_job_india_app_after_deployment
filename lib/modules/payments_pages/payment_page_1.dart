import 'dart:convert';

import 'package:http/http.dart' as http;

class PaymentService {
  final String baseUrl =
      'https://sandbox.easebuzz.in'; // Use the appropriate base URL
  final String key = 'OEQD9YFNL0';
  final String salt = '4THF4SPPXT';

  Future<String> createPaymentRequest(
      String amount, String productInfo, String firstName, String email) async {
    final Map<String, String> body = {
      'key': key,
      'amount': amount,
      'productinfo': productInfo,
      'firstname': firstName,
      'email': email,
      'phone': '1234567890', // Add more parameters as required
    };

    final response = await http.post(
      Uri.parse('$baseUrl/payment/initiateLink'),
      headers: {
        'Content-Type': 'application/json',
      },
      body: json.encode(body),
    );

    if (response.statusCode == 200) {
      final responseBody = json.decode(response.body);
      return responseBody['payment_link'];
    } else {
      throw Exception('Failed to create payment request');
    }
  }
}
