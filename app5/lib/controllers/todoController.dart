import 'package:get/get.dart';
import 'package:robbinlaw/controllers/authController.dart';
import 'package:robbinlaw/models/todo.dart';
import 'package:robbinlaw/services/database.dart';

class TodoController extends GetxController {
  RxList<TodoModel> todoList = RxList<TodoModel>();

  List<TodoModel> get todos => todoList;

  set todos(List<TodoModel> value) => this.todoList = value;

  @override
  void onInit() {
    super.onInit();
    print('TodoController onInit:');
  }

  void upDate() {
    print('TodoController upDate: try');
    try {
      String uid = Get.find<AuthController>().user.uid;
      print('TodoController upDate: uid= $uid');
      todoList.bindStream(Database().todoStream(uid));
    } catch (e) {
      print('TodoController upDate: catch $e');
    }
  }
}
