import 'dart:convert';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:todos_getx/models/todo.dart';

class TodoController extends GetxController {
  GetStorage box = GetStorage();
  var todos = <Todo>[].obs;
  var isLoading = true.obs;
  var errorMsg = "".obs;

  @override
  void onInit() {
    super.onInit();
    var todosRaw = box.read('todos');
    if(todosRaw != null) {
      var json = jsonDecode(todosRaw.toString());
      List<Todo> todoList = List<Todo>.from(json.map((model)=> Todo.fromJson(model))).toList();
      todos.value = todoList;
    }
    ever(
      todos,
      (List<Todo> value) {
        var jsonString = jsonEncode(value);
        box.write('todos', jsonString);
      },
    ); 
  }

  int get todoLength  => todos.length;

  void addTodo(Todo todo) {
    todos.value = [...todos, todo];
  }

  void editTodo(int editIndex, Todo todo) {
    todos.value = [
      ...todos.sublist(0, editIndex),
      todo,
      ...todos.sublist(editIndex + 1)
    ];
  }
}
