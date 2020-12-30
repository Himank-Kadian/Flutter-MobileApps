import 'package:get/get.dart';
import 'package:robbinlaw/controllers/authController.dart';
import 'package:robbinlaw/controllers/todoController.dart';
import 'package:robbinlaw/controllers/userController.dart';

class GlobalBindings extends Bindings {
  @override
  void dependencies() {
    //Get.lazyPut(() => AuthController());
    Get.put<AuthController>(AuthController(), permanent: true);
    //Get.lazyPut(() => UserController());
    Get.put<UserController>(UserController(), permanent: true);
    //Get.lazyPut(() => TodoController());
    Get.put<TodoController>(TodoController(), permanent: true);
  }
}
