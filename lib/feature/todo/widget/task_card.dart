import 'package:flutter/material.dart';
import 'package:user_app/data/model/Todos.dart';

import '../../../core/theme/app_colors.dart';

class TaskCard extends StatelessWidget {
  final Todos task;
  final Function(bool?)? onChange;

  const TaskCard({super.key, required this.task, this.onChange});

  @override
  Widget build(BuildContext context) {
    final textTheme = TextTheme.of(context);
    return Card(
      color: AppColors.white,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          crossAxisAlignment: .center,
          children: [
            Checkbox(value: task.completed, onChanged: onChange),
            Expanded(
              child: Text(
                task.todo ?? "Not Defined",
                style: textTheme.titleLarge!.copyWith(
                  decoration:
                      (task.completed == null || task.completed == false)
                      ? null
                      : .lineThrough,
                  decorationStyle: .solid,
                  decorationThickness: 2,
                ),
                textAlign: .justify,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

//
//   Color get priorityColor {
//     switch (task.priority) {
//       case PriorityEnum.low:
//         return Colors.green;
//
//       case PriorityEnum.high:
//         return Colors.red;
//
//       case PriorityEnum.medium:
//         return Colors.orange;
//     }
//   }
// }
