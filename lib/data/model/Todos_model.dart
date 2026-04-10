import 'dart:convert';

import 'Todos.dart';

TodosModel todosModelFromJson(String str) =>
    TodosModel.fromJson(json.decode(str));

String todosModelToJson(TodosModel data) => json.encode(data.toJson());

class TodosModel {
  TodosModel({List<Todos>? todos, int? total, int? skip, int? limit}) {
    _todos = todos;
    _total = total;
    _skip = skip;
    _limit = limit;
  }

  TodosModel.fromJson(dynamic json) {
    if (json['todos'] != null) {
      _todos = [];
      json['todos'].forEach((v) {
        _todos?.add(Todos.fromJson(v));
      });
    }
    _total = json['total'];
    _skip = json['skip'];
    _limit = json['limit'];
  }

  List<Todos>? _todos;
  int? _total;
  int? _skip;
  int? _limit;

  List<Todos>? get todos => _todos;

  int? get total => _total;

  int? get skip => _skip;

  int? get limit => _limit;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_todos != null) {
      map['todos'] = _todos?.map((v) => v.toJson()).toList();
    }
    map['total'] = _total;
    map['skip'] = _skip;
    map['limit'] = _limit;
    return map;
  }
}
