import 'package:bloc/bloc.dart';
import 'package:masar/features/categories/data/models/category_model.dart';
import 'package:masar/features/categories/data/repos/categories_repo.dart';
import 'package:meta/meta.dart';

part 'categories_state.dart';

class CategoriesCubit extends Cubit<CategoriesState> {
  final CategoriesRepo categoriesRepo;
  List<CategoryModel> categories = [];
  CategoriesCubit({required this.categoriesRepo}) : super(CategoriesInitial());

  void getCategories() async {
    categories = categoriesRepo.getCategories();
    emit(CategoriesLoaded(categories: categories));
  }

  Future<void> addCategory({required CategoryModel category}) async {
    await categoriesRepo.addCategory(category: category);
    print("category added");
    getCategories();
  }

  Future<void> deleteCategory({required CategoryModel category}) async {
    await categoriesRepo.deleteCategory(category: category);
    getCategories();
  }

  Future<void> updateCategory({required CategoryModel category}) async {
    await categoriesRepo.updateCategory(category: category);
    getCategories();
  }


}
