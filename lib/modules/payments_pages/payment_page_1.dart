import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:logging/logging.dart';

class PaymentService {
  final String baseUrl = 'https://api.hirejobindia.com/Pay';
  final Logger _logger = Logger('PaymentService');

  Future<String> createPaymentRequest(String amount, String firstName,
      String email, String phone, String productInfo) async {
    final Uri uri = _buildUri(amount, firstName, email, phone, productInfo);

    // Log the request URL for debugging
    _logger.info('Request URL: $uri');

    final response = await http.post(
      uri,
      headers: {
        'Content-Type': 'application/json',
      },
    );

    // Log the response status and body for debugging
    _logger.info('Response status: ${response.statusCode}');
    _logger.info('Response body: ${response.body}');

    return _handleResponse(response);
  }

  Uri _buildUri(String amount, String firstName, String email, String phone,
      String productInfo) {
    return Uri.parse(baseUrl).replace(queryParameters: {
      'Amount': amount,
      'FirstName': firstName,
      'Email': email,
      'Phone': phone,
      'ProductInfo': productInfo,
      'Surl': 'https://hirejobindia.com/PaymentResultsuccess/',
      'Furl': 'https://hirejobindia.com/PaymentResultfail/',
    });
  }

  String _handleResponse(http.Response response) {
    if (response.statusCode == 200) {
      if (response.body.isEmpty) {
        throw EmptyResponseException('Response body is empty');
      }
      try {
        final responseBody = json.decode(response.body);
        if (responseBody.containsKey('payurl')) {
          return responseBody['payurl'];
        } else {
          throw KeyNotFoundException('Key "payurl" not found in response');
        }
      } catch (e) {
        throw JsonParsingException('Failed to parse response: $e');
      }
    } else {
      if (response.body.isEmpty) {
        throw EmptyResponseException('Error response body is empty');
      }
      try {
        final responseBody = json.decode(response.body);
        final errorMessage =
            responseBody['error_message'] ?? 'Failed to create payment request';
        throw PaymentRequestException(errorMessage);
      } catch (e) {
        throw JsonParsingException('Failed to create payment request: $e');
      }
    }
  }
}

class EmptyResponseException implements Exception {
  final String message;
  EmptyResponseException(this.message);
}

class KeyNotFoundException implements Exception {
  final String message;
  KeyNotFoundException(this.message);
}

class JsonParsingException implements Exception {
  final String message;
  JsonParsingException(this.message);
}

class PaymentRequestException implements Exception {
  final String message;
  PaymentRequestException(this.message);
}
