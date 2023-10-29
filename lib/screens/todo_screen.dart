import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/todo_screen_controller.dart';

class TodoScreen extends StatefulWidget {
  const TodoScreen({super.key});

  @override
  State<TodoScreen> createState() => _TodoScreenState();
}

class _TodoScreenState extends State<TodoScreen> {
  TodoScreenController todoScreenController = Get.put(TodoScreenController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Obx(() {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  'userId : ${todoScreenController.userId.value}',
                  textAlign: TextAlign.center,
                ),
                Text(
                  'id : ${todoScreenController.id.value}',
                  textAlign: TextAlign.center,
                ),
                Text(
                  'title : ${todoScreenController.title.value}',
                  textAlign: TextAlign.center,
                ),
                Text(
                  'completed : ${todoScreenController.completed.value}',
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          );
        }),
      ),
    );
  }
}
