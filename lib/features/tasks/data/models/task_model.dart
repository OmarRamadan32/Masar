import 'package:hive/hive.dart';
import 'package:masar/features/categories/data/models/category_model.dart';
part 'task_model.g.dart';

@HiveType(typeId: 2)
class TaskModel extends HiveObject {
  @HiveField(0)
  String title;

  @HiveField(1)
  String description;

  @HiveField(2)
  final String date;

  @HiveField(3)
  final String time;

  @HiveField(4)
  CategoryModel category;

  @HiveField(5)
  String priority;

  @HiveField(6)
  bool isCompleted;

  @HiveField(7)
  int repeatCount;

  @HiveField(8)
  int completedCount;

  @HiveField(9)
  String repeatType;

  @HiveField(10)
  String? lastCheckDate;

  @HiveField(11)
  String? previousCheckDate;

  int get remainingCount => repeatCount - completedCount;
  //--
  int get repeatTypeByDays {
    switch (repeatType) {
      case "Daily":
        return 1;
      case "Weekly":
        return 7;
      case "Monthly":
        return 30;
      case "Yearly":
        return 365;
      default:
        return 0;
    }
  }

  int get lastCheckByDays {
  if (lastCheckDate == null || lastCheckDate!.isEmpty) {
    return 999999;
  }
  final lastDate = DateTime.parse(lastCheckDate!);
  final now = DateTime.now();

  // make hours == 00:00, to cancel effect of time
  final lastDateOnly = DateTime(lastDate.year, lastDate.month, lastDate.day);
  final nowDateOnly = DateTime(now.year, now.month, now.day);

  return nowDateOnly.difference(lastDateOnly).inDays;
}

  bool get canCheck => lastCheckByDays >= repeatTypeByDays;

  TaskModel(
    this.title,
    this.description,
    this.date,
    this.time,
    this.category,
    this.priority,
    this.isCompleted,
    this.repeatCount,
    this.completedCount,
    this.repeatType,
    this.lastCheckDate,
    this.previousCheckDate,
  );
}
