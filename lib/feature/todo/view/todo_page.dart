import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:user_app/data/model/Todos_model.dart';
import 'package:user_app/data/repository/home_repository.dart';

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
    return const Placeholder();
  }
}
