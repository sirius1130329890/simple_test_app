import 'package:get/get.dart';

import '../../data/repositories/user_repository.dart';

class UserController extends GetxController {
  final UserRepository _userRepository;

  UserController(this._userRepository);

  RxList<Map<String, dynamic>> users = <Map<String, dynamic>>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchUsers();
  }

  Future<void> fetchUsers() async {
    users.value = await _userRepository.getUsers();
  }
}
