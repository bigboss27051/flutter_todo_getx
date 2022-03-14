// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'todo.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Todo _$TodoFromJson(Map<String, dynamic> json) => Todo(
      json['todo'] as String? ?? '',
      json['isCompleted'] as bool? ?? false,
    );

Map<String, dynamic> _$TodoToJson(Todo instance) => <String, dynamic>{
      'todo': instance.todo,
      'isCompleted': instance.isCompleted,
    };
