import 'package:todo_bloc/data/models/isar_todo.dart';
import 'package:todo_bloc/domain/models/todo.dart';
import 'package:todo_bloc/domain/repository/todo_repo.dart';
import 'package:isar/isar.dart';

class IsarTodoRepo implements TodoRepo {
  final Isar db;

  IsarTodoRepo(this.db);

  @override
  Future<List<Todo>> getTodos() async {
    final todos = await db.todoIsars.where().findAll();
    return todos.map((i) => i.toDomain()).toList();
  }

  @override
  Future<void> addTodo(Todo todo) async {
    var fromDomain = TodoIsar.fromDomain(todo);
    return db.writeTxn(() => db.todoIsars.put(fromDomain));
  }

  @override
  Future<void> updateTodo(Todo todo) async {
    var fromDomain = TodoIsar.fromDomain(todo);
    return db.writeTxn(() => db.todoIsars.put(fromDomain));
  }

  @override
  Future<void> deleteTodo(Todo todo) async {
    return db.writeTxn(() => db.todoIsars.delete(todo.id));
  }
}
