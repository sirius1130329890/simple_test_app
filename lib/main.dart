import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:simple_test_app/presentation/controllers/user_controller.dart';
import 'package:simple_test_app/presentation/pages/home_page.dart';
import 'package:simple_test_app/presentation/pages/user_details_page.dart';

import 'data/repositories/user_repository.dart';
import 'data/sources/api_provider.dart';
import 'data/sources/local_storage.dart';

void main() {
  final apiProvider = ApiProvider();
  final localStorage = LocalStorage();
  final userRepository = UserRepository(apiProvider, localStorage);
  final userController = UserController(userRepository);

  runApp(MyApp(userController));
}

class MyApp extends StatelessWidget {
  final UserController userController;

  const MyApp(this.userController, {super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Clean Architecture Example',
      initialRoute: '/',
      getPages: [
        GetPage(name: '/', page: () => HomePage()),
        GetPage(name: '/user-details', page: () => UserDetailsPage()),
      ],
      initialBinding: BindingsBuilder(() {
        Get.lazyPut<UserController>(() => userController);
      }),
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
    );
  }
}
