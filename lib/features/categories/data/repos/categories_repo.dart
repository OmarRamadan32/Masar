import 'package:masar/features/categories/data/models/category_model.dart';

abstract class CategoriesRepo {

  List<CategoryModel> getCategories();
  Future<void> addCategory({required CategoryModel category,});
  Future<void> updateCategory({required CategoryModel category,});
  Future<void> deleteCategory({required CategoryModel category,});
  
}