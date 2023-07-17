import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application/models/todos_model.dart';

class todos_servies {
  String url = "https://jsonplaceholder.typicode.com/todos";

  Future<List<Todosmodel>> getUsersData() async {
    List<Todosmodel> todoslist = [];
    final dio = Dio();
    final response = await dio.get(url);
    var data = response.data;
    data.forEach((jsonElement) {
      Todosmodel todos = Todosmodel.fromJson(jsonElement);
      todoslist.add(todos);
    });

    return todoslist;
  }
}
