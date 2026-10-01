import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax_plus/iconsax_plus.dart';
import 'package:masar/core/routing/routes.dart';
import 'package:masar/core/theme/app_colors.dart';
import 'package:masar/core/theme/app_sizes.dart';
import 'package:masar/core/utils/date_formatter.dart';
import 'package:masar/features/tasks/data/models/task_model.dart';
import 'package:masar/features/tasks/presentation/cubit/tasks_cubit.dart';
import 'package:masar/features/tasks/presentation/widgets/task_item_details.dart';
import 'package:masar/features/tasks/presentation/widgets/task_item_title.dart';
import 'package:masar/features/tasks/presentation/widgets/tesk_item_checkbox.dart';

// This widget will be converted to a stateless widget, and leave the state management to the parent widget
// using the Cubit
class TaskItem extends StatefulWidget {
  const new({super.key, required this.task});
  final TaskModel task;

  @override
  State<TaskItem> createState() => _TaskItemState();
}

class _TaskItemState extends State<TaskItem> {
  Future<void> _onPress() async {
    widget.task.isCompleted = !widget.task.isCompleted;
    widget.task.lastCheckDate = DateFormatter.formatDateOnly(DateTime.now());
    widget.task.completedCount = widget.task.isCompleted
        ? widget.task.completedCount + 1
        : widget.task.completedCount - 1;
    context.read<TasksCubit>().updateTask(task: widget.task);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppColors.cardsColor,
        borderRadius: AppSizes.r16,
      ),
      child: Row(
        children: [
          GestureDetector(
            onTap: () {
              _onPress();
            },
            child: TaskItemCheckbox(isCompleted: widget.task.isCompleted),
          ),
          AppSizes.w10,
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TaskItemTitle(
                title: widget.task.title,
                isCompleted: widget.task.isCompleted,
              ),
              AppSizes.h4,
              TaskItemDetails(
                priority: widget.task.priority,
                categoryName: widget.task.category?.name,
              ),
            ],
          ),
          const Spacer(),
          GestureDetector(
            onTap: () {
              context.push(AppRoutes.task, extra: widget.task);
            },
            child: const Icon(IconsaxPlusLinear.arrow_left_1, size: 20),
          ),
        ],
      ),
    );
  }
}
