import 'package:get/get.dart';
import 'package:robbinlaw/models/user.dart';

class UserController extends GetxController {
  Rx<UserModel> _userModel = Rx<UserModel>();

  UserModel get user => _userModel.value;

  set user(UserModel value) => this._userModel.value = value;

  @override
  onInit() {
    super.onInit();
    print('UserController onInit:');
  }

  void clear() {
    _userModel.value = UserModel();
    print('userController clear:');
  }
}
