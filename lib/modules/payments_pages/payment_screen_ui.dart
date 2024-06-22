import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:get/get.dart';
import 'package:hirejobindia/components/styles.dart';
import 'package:hirejobindia/modules/all_pages/pages/emploree_pages/home_page_employee.dart';
import 'package:hirejobindia/modules/payments_pages/payment_get_page.dart';
import 'package:hirejobindia/services_apis/api_servicesss.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../controllers/employeee_controllersss/payment_get_controller/payment_get_controller.dart'; // Import url_launcher

final PaymentEmployeeController _paymentEmployeeController = Get.find();

class PaymentScreen extends StatefulWidget {
  const PaymentScreen({Key? key}) : super(key: key);

  @override
  _PaymentScreenState createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  final ApiProvider _paymentService = ApiProvider();
  bool _isLoading = true;
  String? _error;
  String? _paymentUrl;
  InAppWebViewController? _webViewController;

  @override
  void initState() {
    super.initState();
    _initiatePayment();
  }

  Future<void> _initiatePayment() async {
    setState(() {
      _isLoading = true;
      _error = null;
    });

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
      setState(() {
        _paymentUrl = paymentUrl;
      });
    } catch (e) {
      setState(() {
        _error = 'Error initiating payment: $e';
      });
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  // Function to launch UPI payment
  void launchUpiPayment(String upiUrl) async {
    if (await canLaunch(upiUrl)) {
      await launch(upiUrl);
    } else {
      throw 'Could not launch UPI payment';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: logoColor, // Update with your app's color scheme
        centerTitle: true,
        title: Text('Payment Page'),
      ),
      body: Center(
        child: _isLoading
            ? CircularProgressIndicator()
            : _error != null
                ? Text(_error!)
                : _paymentUrl != null
                    ? InAppWebView(
                        initialUrlRequest:
                            URLRequest(url: Uri.parse(_paymentUrl!)),
                        initialOptions: InAppWebViewGroupOptions(
                          crossPlatform: InAppWebViewOptions(
                            javaScriptEnabled: true,
                            useShouldOverrideUrlLoading: true,
                          ),
                        ),
                        onWebViewCreated: (InAppWebViewController controller) {
                          _webViewController = controller;
                        },
                        onLoadStart:
                            (InAppWebViewController controller, Uri? url) {
                          print('Started loading: $url');
                        },
                        onLoadStop:
                            (InAppWebViewController controller, Uri? url) {
                          print('Finished loading: $url');

                          // Check if the URL indicates success or failure
                          if (url != null &&
                              url.toString().startsWith(
                                  'https://hirejobindia.com/PaymentResultsuccess/')) {
                            // Payment was successful, navigate to success screen or show success message
                            Navigator.of(context).pushReplacement(
                              MaterialPageRoute(builder: (_) => HomeEmployee()),
                            );
                            Get.snackbar("Successful", "Payment Successfull");
                          } else if (url != null &&
                              url.toString().startsWith(
                                  'https://hirejobindia.com/PaymentResultfail/')) {
                            // Payment failed, navigate to failure screen or show failure message
                            Navigator.of(context).pushReplacement(
                              MaterialPageRoute(
                                  builder: (_) => GetPaymentPage()),
                            );
                            Get.snackbar("Failed", "Payment Failed");
                          }
                        },
                      )
                    : Text('Error loading payment URL'),
      ),
    );
  }
}
