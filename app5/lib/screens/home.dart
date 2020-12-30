import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';
import 'package:robbinlaw/controllers/authController.dart';
import 'package:robbinlaw/controllers/todoController.dart';
import 'package:robbinlaw/controllers/userController.dart';
import 'package:robbinlaw/services/database.dart';
import 'package:robbinlaw/widgets/todo_card.dart';

class Home extends GetWidget<AuthController> {
  final TextEditingController _todoController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    //Get.put<TodoController>(TodoController());
    Get.find<TodoController>().upDate();
    return Scaffold(
      appBar: AppBar(
        title: GetX<UserController>(
          initState: (_) async {
            print("Home Getx<UserController> initState: try");
            try {
              Get.find<UserController>().user =
                  await Database().getUser(Get.find<AuthController>().user.uid);
            } catch (e) {
              print('Home GetX<UserController> initState: catch $e');
            }
          },
          builder: (_) {
            print('Home GetX<UserController> builder: try');
            try {
              if (_.user.name != null) {
                return Text("Welcome " + _.user.name);
              } else {
                return Text("loading...");
              }
            } catch (e) {
              print('Home GetX<UserController> builder: catch $e');
              return Text("loading...");
            }
          },
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(Icons.exit_to_app),
            onPressed: () {
              controller.signOut();
            },
          ),
          IconButton(
            icon: Icon(Icons.edit),
            onPressed: () {
              if (Get.isDarkMode) {
                Get.changeTheme(ThemeData.light());
              } else {
                Get.changeTheme(ThemeData.dark());
              }
            },
          )
        ],
      ),
      body: Column(
        children: <Widget>[
          SizedBox(
            height: 20,
          ),
          Text(
            "Add Todo Here:",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          Card(
            margin: EdgeInsets.all(20),
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      controller: _todoController,
                    ),
                  ),
                  IconButton(
                    icon: Icon(Icons.add),
                    onPressed: () {
                      if (_todoController.text != "") {
                        Database()
                            .addTodo(_todoController.text, controller.user.uid);
                        _todoController.clear();
                      }
                    },
                  )
                ],
              ),
            ),
          ),
          Text(
            "Your Todos",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          GetX<TodoController>(
            //init: Get.put<TodoController>(TodoController()),
            builder: (TodoController todoController) {
              print("Home Getx<TodoControrller> builder:");
              //todoController.upDate();
              if (todoController != null && todoController.todos != null) {
                return Expanded(
                  child: ListView.builder(
                    itemCount: todoController.todos.length,
                    itemBuilder: (_, index) {
                      return TodoCard(
                          uid: controller.user.uid,
                          todo: todoController.todos[index]);
                    },
                  ),
                );
              } else {
                return Text("loading...");
              }
            },
          )
        ],
      ),
    );
  }
}
