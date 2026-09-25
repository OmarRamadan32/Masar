import 'package:hive/hive.dart';
part 'category_model.g.dart';

@HiveType(typeId: 1) // ध्यान: تم استخدام typeId: 1 لتمييزه عن NoteModel (typeId: 0)
class CategoryModel extends HiveObject {
  @HiveField(0)
  String name;

  @HiveField(1)
  int color; // يتم تخزين اللون كـ int باستخدام (Color.value)

  CategoryModel({
    required this.name,
    required this.color,
  });
}