import 'package:masar/core/constants/hive_constants.dart';
import 'package:masar/core/database/datebase_service.dart';
import 'package:masar/features/categories/data/models/category_model.dart';
import 'package:masar/features/categories/data/repos/categories_repo.dart';

class CategoriesRepoImpl implements CategoriesRepo {
  final DatabaseService databaseService;

  static const boxName = HiveConstants.categoriesBox;

  CategoriesRepoImpl({required this.databaseService});

  @override
  Future<void> addCategory({required CategoryModel category})async {
   await databaseService.add<CategoryModel>(boxName, category);
  }

  @override
  Future<void> deleteCategory({required CategoryModel category})async {
 await   category.delete();
  }

  @override
  List<CategoryModel> getCategories() {
    return databaseService.getAll<CategoryModel>(boxName);
  }

  @override
  Future<void> updateCategory({required CategoryModel category})async {
  await  category.save();
  }
}
