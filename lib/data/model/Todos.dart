import 'dart:convert';

Todos todosFromJson(String str) => Todos.fromJson(json.decode(str));
String todosToJson(Todos data) => json.encode(data.toJson());
class Todos {
  Todos({
      int? id, 
      String? todo, 
      bool? completed, 
      int? userId,}){
    _id = id;
    _todo = todo;
    _completed = completed;
    _userId = userId;
}

  Todos.fromJson(dynamic json) {
    _id = json['id'];
    _todo = json['todo'];
    _completed = json['completed'];
    _userId = json['userId'];
  }
  int? _id;
  String? _todo;
  bool? _completed;
  int? _userId;

  int? get id => _id;
  String? get todo => _todo;
  bool? get completed => _completed;
  int? get userId => _userId;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['todo'] = _todo;
    map['completed'] = _completed;
    map['userId'] = _userId;
    return map;
  }

}