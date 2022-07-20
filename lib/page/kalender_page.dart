import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

class kalenderPage extends StatelessWidget {
  const kalenderPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0x00f1f1f1),
        title: Text('Kalender'),
      ),
      body: SfCalendar(
        view: CalendarView.month,
        // dataSource: MeetingDataSource(getAppointments()),
      ),
    );
  }
}

// List<Appointment> getAppointments() {
//   List<Appointment> meetings = <Appointment>[];
//   final DateTime today = DateTime.now();
//   final DateTime startTime =
//       DateTime(today.year, today.month, today.day, 9, 0, 0);
//   final DateTime endTime = startTime.add(const Duration(hours: 2));

//   meetings.add(Appointment(
//       startTime: startTime,
//       endTime: endTime,
//       subject: 'tidur',
//       color: Colors.blue));
//   return meetings;
// }

// class MeetingDataSource extends CalendarDataSource {
//   MeetingDataSource(List<Appointment> source) {
//     appointments = source;
//   }
// }
