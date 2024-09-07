/*
 * Todo cubit simple state manager
 * each cubit is a list of todos
 */
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_bloc/domain/models/todo.dart';
import 'package:todo_bloc/domain/repository/todo_repo.dart';

class TodoCubit extends Cubit<List<Todo>>{

  final TodoRepo todoRepo;

  TodoCubit(this.todoRepo): super([]){
    loadTodos();
  }

  Future<void> loadTodos() async{
    var list = await todoRepo.getTodos();
    emit(list);
  }

  Future<void> addTodo(String text) async{
    final todo = Todo(
      id:DateTime.now().second,
      text: text,
    );
    await todoRepo.addTodo(todo);
    loadTodos();
  }

  Future<void> updateTodo(Todo todo) async{
    await todoRepo.updateTodo(todo);
    loadTodos();
  }

  Future<void> deleteTodo(Todo todo)async{
    await todoRepo.deleteTodo(todo);
    loadTodos();
  }

  Future<void> toggleCompletion(Todo todo) async{
    final updateTodo = todo.toggleCompletion();
    await todoRepo.updateTodo(updateTodo);
    loadTodos();
  }
}