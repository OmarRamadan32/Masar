import 'package:hive/hive.dart';
import 'package:masar/core/constants/app_options.dart';
import 'package:masar/features/categories/data/models/category_model.dart';

part 'task_model.g.dart';

@HiveType(typeId: 2)
class TaskModel extends HiveObject {
  @HiveField(0)
  String title;

  @HiveField(1)
  String? description;

  @HiveField(2)
  final DateTime date;

  @HiveField(3)
  final DateTime time;

  @HiveField(4)
  CategoryModel? category;

  @HiveField(5)
  String priority;

  @HiveField(6)
  int repeatCount;

  @HiveField(7)
  int completedCount;

  @HiveField(8)
  String repeatType;

  @HiveField(9)
  DateTime? lastCheckDate;

  @HiveField(10)
  DateTime? previousCheckDate;

  TaskModel({
    required this.title,
    this.description,
    required this.date,
    required this.time,
    this.category,
    required this.priority,
    required this.repeatCount,
    required this.completedCount,
    required this.repeatType,
    this.lastCheckDate,
    this.previousCheckDate,
  });

  // 1. عدد المرات المتبقية
  int get remainingCount => repeatCount - completedCount;

  // 2. هل الانتهاء كلي؟
  bool get isCompleted => remainingCount <= 0;

  // 3. أيام التكرار
  int get repeatTypeByDays {
    switch (repeatType) {
      case AppOptions.daily:
        return 1;
      case AppOptions.weekly:
        return 7;
      case AppOptions.monthly:
        return 30;
      default:
        return 0; // بدون تكرار دوري
    }
  }

  // 4. هل تم إنجاز حصة الفترة الحالية؟
  bool get isCompletedForToday {
    if (lastCheckDate == null) return false;

    // لو بدون تكرار دوري وتم عمل Check مرة واحدة 👈 تعتبر مكتملة
    if (repeatTypeByDays == 0) return completedCount > 0;

    DateTime now = DateTime.now();
    DateTime todayOnly = DateTime(now.year, now.month, now.day);
    DateTime lastCheckOnly = DateTime(
      lastCheckDate!.year,
      lastCheckDate!.month,
      lastCheckDate!.day,
    );

    int daysSinceLastCheck = todayOnly.difference(lastCheckOnly).inDays;

    return daysSinceLastCheck < repeatTypeByDays;
  }

  // 5. هل متاحة للإنجاز الآن؟
  bool get canCheck {
    return remainingCount > 0 && !isCompletedForToday;
  }

  // 6. دالة الإنجاز
  void checkTask() {
    if (canCheck) {
      completedCount++;
      previousCheckDate = lastCheckDate;
      lastCheckDate = DateTime.now();
    }
  }

  // 7. دالة التراجع
  void unCheckTask() {
    if (completedCount > 0) {
      completedCount--;
      lastCheckDate = previousCheckDate;
      previousCheckDate = null;
    }
  }
}
