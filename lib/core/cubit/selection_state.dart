part of 'selection_cubit.dart';

@immutable
class SelectionState<T> {
  final bool isSelectionMode;
  final List<T> selectedItems;

  const SelectionState({
    this.isSelectionMode = false,
    this.selectedItems = const [],
  });

  SelectionState<T> copyWith({
    bool? isSelectionMode,
    List<T>? selectedItems,
  }) {
    return SelectionState<T>(
      isSelectionMode: isSelectionMode ?? this.isSelectionMode,
      selectedItems: selectedItems ?? this.selectedItems,
    );
  }
}
