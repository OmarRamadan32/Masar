abstract class AppOptions {
  //---
  static const List<String> categoriesOptions = [
    'الدراسة',
    'شخصي',
    'العمل',
    'المواعيد',
  ];
  static const List<String> priorityOptions = ["عادية", "متوسطة", "عالية"];
  static const String infinite = "لا نهائي";
  static const String noRepeat = "بدون تكرار";
  static const List<String> taskCount = [
    infinite,
    noRepeat,
    "2",
    "5",
    "7",
    "10",
  ];
  static const String daily = 'يوميا';
  static const String weekly = 'اسبوعيا';
  static const String monthly = 'شهريا';
  static const List<String> taskRepeat = [daily, weekly, monthly];
}
