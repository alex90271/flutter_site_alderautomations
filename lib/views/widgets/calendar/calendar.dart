import 'package:alderautomationsdotcom/globals.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CalendarWidget extends StatelessWidget {
  CalendarWidget({Key? key}) : super(key: key);

  final calendar = TableCalendar(
    firstDay: DateTime.utc(2010, 10, 16),
    lastDay: DateTime.utc(2030, 3, 14),
    focusedDay: DateTime.now(),
    calendarBuilders: CalendarBuilders(
        todayBuilder: (context, day, focusedDay) => Center(
              child: Container(
                  color: brandBlue, child: Text(DateFormat.d().format(day))),
            )),
    headerStyle: const HeaderStyle(
        formatButtonVisible: false,
        titleCentered: true,
        leftChevronVisible: false,
        rightChevronVisible: false),
  );

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: SizedBox(
      height: 69,
      width: 420,
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: calendar,
      ),
    ));
  }
}
