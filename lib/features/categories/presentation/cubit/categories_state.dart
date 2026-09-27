part of 'categories_cubit.dart';

@immutable
sealed class CategoriesState {}

final class CategoriesInitial extends CategoriesState {}

final class CategoriesLoaded extends CategoriesState {
  final List<CategoryModel> categories;
  CategoriesLoaded({required this.categories});
}

final class CategoriesLoading extends CategoriesState {}
