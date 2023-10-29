import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../models/todo.dart';

class TodoScreenController extends GetxController {
  final RxInt userId = 0.obs;
  final RxInt id = 0.obs;
  final RxString title = ''.obs;
  final RxBool completed = false.obs;

  @override
  void onInit() {
    super.onInit();
    fetchTodo();
  }

  Future<void> fetchTodo() async {
    const String url = 'https://jsonplaceholder.typicode.com/todos/5/';

    try {
      final http.Response response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        userId.value = Todo.fromJson(jsonDecode(response.body)).userId;
        id.value = Todo.fromJson(jsonDecode(response.body)).id;
        title.value = Todo.fromJson(jsonDecode(response.body)).title;
        completed.value = Todo.fromJson(jsonDecode(response.body)).completed;
      } else {
        throw Exception('Failed to load todo');
      }
    } catch (error) {
      throw Exception('Failed to load todo: $error');
    }
  }
}
