import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:masar/core/cubit/selection_cubit.dart';
import 'package:masar/core/widgets/selectable_item.dart';
import 'package:masar/features/tasks/data/models/task_model.dart';
import 'package:masar/features/tasks/presentation/cubit/tasks_cubit.dart';
import 'package:masar/features/tasks/presentation/widgets/task_item.dart';

class SelectableTasksView extends StatefulWidget {
  const new({super.key, required this.tasks});
  final List<TaskModel> tasks;

  @override
  State<SelectableTasksView> createState() => _SelectableTasksViewState();
}

class _SelectableTasksViewState extends State<SelectableTasksView> {
  @override
  Widget build(BuildContext context) {
    SelectionCubit selectionCubit = context.read<SelectionCubit>();
    TasksCubit tasksCubit = context.read<TasksCubit>();
    return ListView.builder(
      itemCount: widget.tasks.length,
      itemBuilder: (context, index) {
      return GestureDetector(
                  onTap: () {
            selectionCubit.toggleItem(tasksCubit.tasksList[index]);
            setState(() {});
          },
        child: SelectableItem(item: TaskItem(task: widget.tasks[index]),
         isSelected: selectionCubit.state.selectedItems.contains(widget.tasks[index]),),
      );
    },);
  }
}
