import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'selection_state.dart';

class SelectionCubit<T> extends Cubit<SelectionState<T>> {
  SelectionCubit() : super(SelectionState<T>());

  void clearSelection() {

    emit(SelectionState<T>()); 
  }

  void toggleSelectionMode() {
    if (state.isSelectionMode) {
      clearSelection();
    } else {
      emit(state.copyWith(isSelectionMode: true));
    }
  }

  void toggleItem(T item) {
    final updatedList = List<T>.from(state.selectedItems);

    if (updatedList.contains(item)) {
      updatedList.remove(item);
    } else {
      updatedList.add(item);
    }

    emit(state.copyWith(
      selectedItems: updatedList,
      isSelectionMode: updatedList.isNotEmpty ? true : state.isSelectionMode,
    ));
  }
}
