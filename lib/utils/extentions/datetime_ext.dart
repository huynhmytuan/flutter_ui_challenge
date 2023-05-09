extension DateTimeX on DateTime {
  String toMonthYearString() {
    final monthStr = day.toString().padLeft(2, '0');
    final yearStr = year % 100;
    return '$monthStr/$yearStr';
  }
}
