import 'package:flutter/material.dart';

extension DateTimeExt on DateTime {
  DateTime applyTimeOfDay({required TimeOfDay timeOfDay}) {
    return DateTime(year, month, day, timeOfDay.hour, timeOfDay.minute);
  }
}