import 'package:todo_bloc/domain/models/todo.dart';

abstract class TodoRepo {
  // get list of todo
  Future<List<Todo>> getTodos();

  Future<void> addTodo(Todo todo);
  // add new todo to list

  Future<void> updateTodo(Todo todo);
  // update  an exists todo

  // delete a  todo
  Future<void> deleteTodo(Todo todo);
}
