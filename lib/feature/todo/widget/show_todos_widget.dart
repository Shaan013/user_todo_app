import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:user_app/data/model/Todos.dart';
import 'package:user_app/data/model/Todos_model.dart';
import 'package:user_app/feature/todo/widget/task_card.dart';

class ShowTodosWidget extends StatelessWidget {
  final TodosModel todosModel;

  const ShowTodosWidget({super.key, required this.todosModel});

  @override
  Widget build(BuildContext context) {
    final List<Todos> listTodo = todosModel.todos!;
    return ListView.builder(
      padding: EdgeInsets.all(16.r),
      shrinkWrap: true,
      itemCount: listTodo.length,
      itemBuilder: (context, index) {
        final Todos todos = listTodo[index];
        return TaskCard(task: todos);
      },
    );
  }
}
