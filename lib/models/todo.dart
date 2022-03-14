import 'package:json_annotation/json_annotation.dart';

part 'todo.g.dart';

@JsonSerializable()
class Todo {
  @JsonKey(defaultValue: "")
  final String todo;
  @JsonKey(defaultValue: false)
  final bool isCompleted;

  Todo(this.todo, this.isCompleted);

  factory Todo.fromJson(Map<String, dynamic> json) =>
      _$TodoFromJson(json);
  Map<String, dynamic> toJson() => _$TodoToJson(this);
}

