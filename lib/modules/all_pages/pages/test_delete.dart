// import 'package:flutter/material.dart';
// //import 'package:geocoding/geocoding.dart';
//
// class YourWidget extends StatefulWidget {
//   @override
//   _YourWidgetState createState() => _YourWidgetState();
// }
//
// class _YourWidgetState extends State<YourWidget> {
//   double? _latitude;
//   double? _longitude;
//   bool _isLoading = true;
//
//   Future<void> _setInitialLocation() async {
//     String address =
//         "1600 Amphitheatre Parkway, Mountain View, CA"; // Replace with your address
//     await _getCoordinates(address);
//     setState(() {
//       _isLoading = false;
//     });
//   }
//
//   // Future<void> _getCoordinates(String address) async {
//   //   try {
//   //     List<Location> locations = await locationFromAddress(address);
//   //     if (locations.isNotEmpty) {
//   //       Location firstLocation = locations.first;
//   //       setState(() {
//   //         _latitude = firstLocation.latitude;
//   //         _longitude = firstLocation.longitude;
//   //       });
//   //     }
//   //   } catch (e) {
//   //     print('Error: $e');
//   //   }
//   // }
//
//   @override
//   void initState() {
//     super.initState();
//     _setInitialLocation();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Your App'),
//       ),
//       body: Center(
//         child: _isLoading
//             ? CircularProgressIndicator()
//             : Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   Text('Latitude: ${_latitude ?? "Unknown"}'),
//                   Text('Longitude: ${_longitude ?? "Unknown"}'),
//                 ],
//               ),
//       ),
//     );
//   }
// }
