import 'package:intl/intl.dart';

abstract class DateFormatter {
  /// تحويل الوقت والتاريخ الحالي لـ String منسّق
  /// مثال للناتج: "26 سبتمبر 2026 - 08:30 م"
  static String formatDateTime(DateTime dateTime) {
    return DateFormat('d MMMM yyyy - hh:mm a', 'ar').format(dateTime);
  }

  /// لو عايز التاريخ فقط (مثال: "26 سبتمبر 2026")
  static String formatDateOnly(DateTime dateTime) {
    return DateFormat('d MMMM yyyy', 'ar').format(dateTime);
  }

  /// لو عايز الوقت فقط (مثال: "08:30 م")
  static String formatTimeOnly(DateTime dateTime) {
    return DateFormat('hh:mm a', 'ar').format(dateTime);
  }
}