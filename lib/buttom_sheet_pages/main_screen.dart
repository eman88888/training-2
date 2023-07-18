import 'package:flutter/material.dart';
import 'package:flutter_application/models/todos_model.dart';
import 'package:flutter_application/servies/todos_servies.dart';
import 'package:flutter_application/todos/todos_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class mains extends StatefulWidget {
  const mains({super.key});

  @override
  State<mains> createState() => _MainScreenState();
}

class _MainScreenState extends State<mains> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TodosCubit(),
      child: BlocBuilder<TodosCubit, TodosState>(
        // BlocConsumer<UsersCubit, UsersState>(
        builder: (context, state) {
          if (state is TodosLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is TodossSuccess) {
            return ListView.builder(
              itemCount: context.watch<TodosCubit>().todos.length,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  title: Text(
                      context.watch<TodosCubit>().todos[index].title ?? "--"),
                );
              },
            );
          } else {
            return const Center(
              child: Text("Error in this screen"),
            );
          }
        },
        
      ),
    );
  }
}
