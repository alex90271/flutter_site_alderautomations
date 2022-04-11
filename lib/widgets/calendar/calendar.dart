import 'package:alderautomationsdotcom/globals.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CalendarWidget extends StatefulWidget {
  const CalendarWidget({Key? key}) : super(key: key);
  @override
  State<CalendarWidget> createState() => _CalendarWidgetState();
}

class _CalendarWidgetState extends State<CalendarWidget> {
  CalendarFormat _calendarFormat = CalendarFormat.month;
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        child: const Text('Show Calendar'),
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(brandBlue)),
        onPressed: () {
          showModalBottomSheet(
              context: context,
              builder: (BuildContext builder) {
                return Expanded(
                    child: Column(
                  children: [
                    SizedBox(
                        width: 420,
                        child: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: TableCalendar(
                            firstDay: DateTime.utc(2022, 0, 0),
                            lastDay: DateTime.utc(2030, 0, 0),
                            focusedDay: _focusedDay,
                            selectedDayPredicate: (day) {
                              return isSameDay(_selectedDay, day);
                            },
                            calendarBuilders: CalendarBuilders(
                                selectedBuilder: (context, day, focusedDay) =>
                                    Center(
                                      child: Container(
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              color: brandBlue),
                                          padding: const EdgeInsets.all(10.0),
                                          child: Text(
                                            DateFormat.d().format(day),
                                            style: const TextStyle(
                                                color: brandWhite),
                                          )),
                                    ),
                                todayBuilder: (context, day, focusedDay) =>
                                    Center(
                                      child: Container(
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              color:
                                                  brandBlue.withOpacity(0.25)),
                                          padding: const EdgeInsets.all(10.0),
                                          child: Text(
                                            DateFormat.d().format(day),
                                            style: const TextStyle(
                                                color: brandWhite),
                                          )),
                                    )),
                            headerStyle: const HeaderStyle(
                                formatButtonVisible: false,
                                titleCentered: true,
                                leftChevronVisible: false,
                                rightChevronVisible: false),
                            onDaySelected: (selectedDay, focusedDay) {
                              if (!isSameDay(_selectedDay, selectedDay)) {
                                setState(() {
                                  _selectedDay = selectedDay;
                                  _focusedDay = focusedDay;
                                });
                              }
                            },
                            onFormatChanged: (format) {
                              if (_calendarFormat != format) {
                                setState(() {
                                  _calendarFormat = format;
                                });
                              }
                            },
                            onPageChanged: (focusedDay) {
                              _focusedDay = focusedDay;
                            },
                          ),
                        )),
                    ElevatedButton(
                      child: const Text('Close'),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                  ],
                ));
              });
        });
  }
}
