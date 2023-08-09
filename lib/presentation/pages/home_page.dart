import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/user_controller.dart';

class HomePage extends StatelessWidget {
  final UserController userController = Get.find();

  HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Users'),
      ),
      body: Obx(
            () => userController.users.isEmpty
            ? const Center(child: CircularProgressIndicator())
            : ListView.builder(
          itemCount: userController.users.length,
          itemBuilder: (context, index) {
            final user = userController.users[index];
            return GestureDetector(
              onTap: () {
                Get.toNamed('/user-details', arguments: user['id']);
              },
              child: Card(
                child: ListTile(
                  leading: CircleAvatar(
                    backgroundImage: NetworkImage(user['avatar']),
                  ),
                  title: Text(user['first_name'] + ' ' + user['last_name']),
                  subtitle: Text(user['email']),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
