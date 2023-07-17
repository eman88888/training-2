import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:flutter_application/models/todos_model.dart';
import 'package:flutter_application/servies/todos_servies.dart';
part 'todos_state.dart';

class TodosCubit extends Cubit<TodosState> {
  TodosCubit() : super(TodosInitial()) {
    gettodos();
  }
  List<Todosmodel> todos = [];
  bool isLoading = true;

  gettodos() async {
    emit(TodosLoading());
    try {
      todos = await todos_servies().getUsersData();
      isLoading = false;

      emit(TodossSuccess());
    } catch (e) {
      print(e.toString());
      emit(TodosError());
    }
  }
}
