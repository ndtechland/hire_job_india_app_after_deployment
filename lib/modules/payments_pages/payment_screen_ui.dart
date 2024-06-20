import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hirejobindia/modules/payments_pages/payment_page_1.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../controllers/employeee_controllersss/payment_get_controller/payment_get_controller.dart';

final PaymentEmployeeController _paymentEmployeeController = Get.find();

class PaymentScreen extends StatefulWidget {
  const PaymentScreen({Key? key}) : super(key: key);

  @override
  _PaymentScreenState createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  final PaymentService _paymentService = PaymentService();
  bool _isLoading = true;
  String? _error;

  @override
  void initState() {
    super.initState();
    _initiatePayment();
  }

  Future<void> _initiatePayment() async {
    try {
      final amount = _paymentEmployeeController.getPaymentModel?.data
              ?.toInt()
              .toString() ??
          '0';
      final paymentUrl = await _paymentService.createPaymentRequest(
        amount, // Amount in paise (INR)
        'John Doe', // FirstName
        'john.doe@example.com', // Email
        '5465565765', // Phone
        '7557', // ProductInfo
      );
      await _launchURL(paymentUrl);
    } catch (e) {
      setState(() {
        _error = 'Error: $e';
      });
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
      setState(() {
        _error = 'Could not launch $url';
      });
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
            : _error != null
                ? Text(_error!)
                : Text('Launching Payment URL...'),
      ),
    );
  }
}
