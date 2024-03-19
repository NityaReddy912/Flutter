import 'package:flutter/material.dart';
import 'package:update/todos/checkable_todo_item.dart';
//import 'package:flutter_internals/todos/todo_item.dart';

// model - Todo
class Todo {
  const Todo(this.text, this.priority);

  final String text;
  final Priority priority;
}

class Todos extends StatefulWidget {
  const Todos({super.key});

  @override
  State<Todos> createState() => _TodosState();
}

class _TodosState extends State<Todos> {
  var _order = 'asc';

  final _todos = [
    const Todo('Learn Flutter', Priority.urgent),
    const Todo('Learn ReactNative', Priority.normal),
    const Todo('Explore Other Courses', Priority.low),
  ];

  List<Todo> get _orderTodos {
    final sortedTodos = List.of(_todos);

    sortedTodos.sort((a, b) {
      final bComesAfterA = a.text.compareTo(b.text);
      return _order == 'asc' ? bComesAfterA : -bComesAfterA;
    });

    return sortedTodos;
  }

  void _changeOrder(){
    setState(() {
      _order = _order == 'asc' ? 'desc' : 'asc';
    });
  }
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Align(
          alignment: Alignment.centerRight,
          child: TextButton.icon(
            onPressed: _changeOrder, 
            icon: Icon(_order == 'asc' ? Icons.arrow_downward : Icons.arrow_upward), 
            label: Text('Sort ${_order == 'asc' ? 'Descending' : 'Ascending'}'),
            ),
        ),
        Expanded(
          child: Column(
            children: [
              // for (final todo in _orderTodos)
              //   TodoItem(todo.text, todo.priority),

              for (final todo in _orderTodos)
                CheckableTodoItem(
                  //key:ValueKey(todo.text),
                  key: ObjectKey(todo), 
                  todo.text, 
                  todo.priority),
            ],
          ),
        ),
      ],
    );
  }
}
