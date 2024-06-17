import 'package:flutter/material.dart';
import 'package:hirejobindia/modules/payments_pages/payment_page_1.dart';
import 'package:url_launcher/url_launcher.dart';
//import 'payment_service.dart'; // Ensure the path is correct

class PaymentScreen extends StatefulWidget {
  const PaymentScreen({super.key});

  @override
  _PaymentScreenState createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  final PaymentService _paymentService = PaymentService();
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _initiatePayment();
  }

  Future<void> _initiatePayment() async {
    try {
      final paymentUrl = await _paymentService.createPaymentRequest(
        '1', // Amount in paise (INR)
        'Product Info',
        'John Doe',
        'john.doe@example.com',
      );
      _launchURL(paymentUrl);
    } catch (e) {
      // Handle error
      print(e);
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  Future<void> _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Payment'),
      ),
      body: Center(
        child: _isLoading
            ? CircularProgressIndicator()
            : Text('Launching Payment URL...'),
      ),
    );
  }
}
