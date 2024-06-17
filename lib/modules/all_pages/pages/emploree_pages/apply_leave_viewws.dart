// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:table_calendar/table_calendar.dart';
//
// import '../../../../controllers/employeee_controllersss/apply_leave_controller/apply_controllerss.dart';
//
// class CalendarPage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Select Multiple Dates'),
//       ),
//       body: GetBuilder<CalendarController>(
//         init: CalendarController(),
//         builder: (controller) {
//           return Column(
//             children: <Widget>[
//               TableCalendar(
//                 onDaySelected: (date, events, holidays) {
//                   controller.onDaySelected(date);
//                 },
//                 calendarController: controller.calendarController,
//                 availableCalendarFormats: const {CalendarFormat.month: 'Month'}, focusedDay: null,
//               ),
//               ElevatedButton(
//                 onPressed: () {
//                   controller.sendSelectedDates();
//                 },
//                 child: Text('Send Selected Dates'),
//               ),
//             ],
//           );
//         },
//       ),
//     );
//   }
// }
