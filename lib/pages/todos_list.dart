import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todos_getx/controllers/todo.controller.dart';

import '../models/todo.dart';

class TodosList extends StatefulWidget {
  const TodosList({Key? key}) : super(key: key);

  @override
  State<TodosList> createState() => TodosListState();
}

class TodosListState extends State<TodosList> {
  TextEditingController todoTextController = TextEditingController();
  bool isEdit = false;
  int indexTodo = 0;

  TodoController todoController = Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text(
        'Todo list',
      )),
      body: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                    width: 300.0,
                    child: TextField(
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Enter a todo',
                      ),
                      controller: todoTextController,
                    )),
                ElevatedButton(
                  onPressed: () {
                    Todo todo = Todo(todoTextController.text, false);
                    print('isEdit $isEdit');
                    if (!isEdit) {
                      todoController.addTodo(todo);
                    } else {
                      if (todoController.todoLength > 0) {
                        todoController.editTodo(indexTodo, todo);
                        setState(() {
                          isEdit = false;
                        });
                      }
                    }
                  },
                  child: const Text('create'),
                )
              ],
            ),
            Expanded(
              child: Obx(() => ListView.builder(
                  itemCount: todoController.todoLength,
                  itemBuilder: (_buildContext, index) {
                    return ListTile(
                      title: Text(todoController.todos[index].todo),
                      hoverColor: Colors.blueGrey,
                      onTap: () {
                        todoTextController.text =
                            todoController.todos[index].todo;
                        setState(() {
                          isEdit = true;
                          indexTodo = index;
                        });
                      },
                    );
                  })),
            )
          ],
        ),
      ),
    );
  }
}
