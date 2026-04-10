import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:user_app/data/model/Todos_model.dart';
import 'package:user_app/data/repository/home_repository.dart';
import 'package:user_app/feature/todo/widget/show_todos_widget.dart';

import '../../../utils/generated/l10n.dart';

class TodoPage extends StatefulWidget {
  const TodoPage({super.key});

  @override
  State<TodoPage> createState() => _TodoPageState();
}

class _TodoPageState extends State<TodoPage> {
  late Future<TodosModel?> _todos;

  @override
  void initState() {
    super.initState();
    _todos = getTodos();
  }

  Future<TodosModel?> getTodos() async {
    final TodosModel? todosModel = await HomeRepository.getAllTodos();
    log(" your res : ${todosModel}");
    return todosModel;
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = TextTheme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          S.of(context).headingTodos,
          style: textTheme.headlineMedium,
          maxLines: 1,
        ),
      ),
      body: FutureBuilder(
        future: _todos,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return Center(
              child: Text(
                "${S.of(context).msgApiCouldNotFetchDate} ${snapshot.error.toString()}",
              ),
            );
          }
          if (snapshot.hasData) {
            final TodosModel? date = snapshot.data;
            if (snapshot.data == null) {
              return Center(child: Text(S.of(context).erroryouDateIsNull));
            } else {
              return ShowTodosWidget(todosModel: date!);
            }
          }
          return Center(child: Text(S.of(context).errorSomethingWentWrong));
        },
      ),
    );
  }
}
